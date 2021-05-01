import express from "express";
import mongoose from "mongoose";
import posts from "../models/postsModel";
import users from "../models/usersModel";
import {postsInterface, comment, usersInterface} from "../ts/interface";

const router = express.Router();

router.get("/view", async (req, res) => {
    const foundPosts = await posts.find({});

    if (!foundPosts) return res.status(400).json({success: false, data: "Error in fetching."});
    return res.status(200).json({success: true, message: "Returning all posts", data: foundPosts});
});

router.post("/viewOne", async (req, res) => {
    const { postId }:postsInterface = req.body;

    const valuesAreValid = postId;
    if (!valuesAreValid) return res.status(400).json({success: false, message: "Invalid values. Required: postId"});

    const foundPost = await posts.findOne({ postId });

    if (!foundPost) return res.status(400).json({success: false, data: "Error in fetching Possibly invalid postId."});
    return res.status(200).json({success: true, message: "Returning post", data: foundPost});
});

router.post("/create", async (req, res) => {

    const { author, title, content, userId }/*:postsInterface*/ = req.body;
    
    const valuesAreValid = author && title && content && userId;
    if (!valuesAreValid) return res.status(400).json({success: false, message: "Invalid values. Required: author, title, content, userId"});

    let newPost/*:mongoose.Document*/ = new posts({
        postId: Date.now(), author, title, content, datePosted: new Date().toUTCString(), upvotes: 0
    });

    const foundUser:mongoose.Document & usersInterface = await users.findOne({ userId });
    foundUser.posts.push({ postId: newPost.postId });
    
    await newPost.save();
    await foundUser.save();

    return res.status(201).json({success: true, message: `Created post for '${author}'.`, data: newPost});
    // return res.status(400).json({success: false, data: "Error in creation."});
});

router.post("/like", async (req, res) => {

    const { postId, author, userId } = req.body;

    const valuesAreValid = postId && author && userId;
    if (!valuesAreValid) return res.status(400).json({success: false, message: "Invalid values. Required: postId && author && userId"});

    const isDuplicatePost:mongoose.Document & postsInterface = await posts.findOne({ postId });
    if (!isDuplicatePost) return res.status(400).json({success: false, data: "Error in fetching, possibly wrong id given."});

    const foundUser = await users.findOne({ userId });
    if (!foundUser) return res.status(400).json({success: false, data: "Error in fetching, possibly wrong user id given."});

    foundUser.upvotedPosts.push(postId);
    isDuplicatePost.upvotes++;

    await foundUser.save();
    await isDuplicatePost.save();

    return res.status(201).json({success: true, data: `Liked comment with post id '${postId}'.`});
    // return res.status(400).json({success: false, data: "Error in creation."});
});

router.post("/unlike", async (req, res) => {

    const { postId, author, userId } = req.body;

    const valuesAreValid = postId && author && userId;
    if (!valuesAreValid) return res.status(400).json({success: false, message: "Invalid values. Required: postId && author && userId"});

    const isDuplicatePost:mongoose.Document & postsInterface = await posts.findOne({ postId });
    if (!isDuplicatePost) return res.status(400).json({success: false, data: "Error in fetching, possibly wrong id given."});

    const foundUser:mongoose.Document & usersInterface = await users.findOne({ userId });
    if (!foundUser) return res.status(400).json({success: false, data: "Error in fetching, possibly wrong user id given."});

    foundUser.upvotedPosts = foundUser.upvotedPosts.filter(post => post !== postId);
    isDuplicatePost.upvotes--;
    
    await foundUser.save();
    await isDuplicatePost.save();

    return res.status(201).json({success: true, data: `Unliked comment with post id '${postId}'.`});
    // return res.status(400).json({success: false, data: "Error in creation."});
});

router.post("/comment/add", async (req, res) => {

    const { postId, author, pfpUrl, content/*, upvotes, date*/ }/*:postsInterface && commentInterface*/ = req.body;
    /*
        COMMENT INTERFACE
        author: string,
        pfpUrl: string,
        content: string,
        upvotes: string,
        date: string,
    */
    const valuesAreValid = postId && author && pfpUrl && content;
    if (!valuesAreValid) return res.status(400).json({success: false, message: "Invalid values. Required: postId, author, pfpUrl, content, userId"});

    const isDuplicatePost:mongoose.Document & postsInterface = await posts.findOne({ postId });
    if (!isDuplicatePost) return res.status(400).json({success: false, data: "Error in fetching, possibly wrong post id given."});

    let newComment:comment = { author, content, pfpUrl, date: new Date().toUTCString(), upvotes: 0, commentId: Date.now().toString() };

    isDuplicatePost.comments.push(newComment);
    isDuplicatePost.markModified("comments");

    await isDuplicatePost.save();

    return res.status(201).json({success: true, message: `Created comment on post id '${postId}'.`, data: newComment});
    // return res.status(400).json({success: false, data: "Error in creation."});
});

router.post("/comment/like", async (req, res) => {

    const { postId, commentId, author } = req.body;

    const valuesAreValid = postId && commentId && author;
    if (!valuesAreValid) return res.status(400).json({success: false, message: "Invalid values. Required: postId && commentId && author"});

    const isDuplicatePost:mongoose.Document & postsInterface = await posts.findOne({ postId });
    if (!isDuplicatePost) return res.status(400).json({success: false, data: "Error in fetching, possibly wrong id given."});

    let temp = isDuplicatePost.comments.filter(com => com.commentId === commentId);
    temp[0].upvotes++;

    isDuplicatePost.markModified("comments");
    await isDuplicatePost.save();

    return res.status(201).json({success: true, data: `Liked comment with post id '${postId}'.`});
    // return res.status(400).json({success: false, data: "Error in creation."});
});

router.post("/comment/unlike", async (req, res) => {

    const { postId, commentId, author } = req.body;

    const valuesAreValid = postId && commentId && author;
    if (!valuesAreValid) return res.status(400).json({success: false, message: "Invalid values. Required: postId && commentId && author"});

    const isDuplicatePost:mongoose.Document & postsInterface = await posts.findOne({ postId });
    if (!isDuplicatePost) return res.status(400).json({success: false, data: "Error in fetching, possibly wrong id given."});

    let temp = isDuplicatePost.comments.filter(com => com.commentId === commentId);
    temp[0].upvotes--;

    isDuplicatePost.markModified("comments");
    await isDuplicatePost.save();

    return res.status(201).json({success: true, data: `Unliked comment with post id '${postId}'.`});
    // return res.status(400).json({success: false, data: "Error in creation."});
});

export default router;