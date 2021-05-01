import express from "express";
import mongoose from "mongoose";
import posts from "../models/postsModel";
import {postsInterface, comment} from "../ts/interface";

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

    const { author, title, content }:postsInterface = req.body;
    
    const valuesAreValid = author && title && content;
    if (!valuesAreValid) return res.status(400).json({success: false, message: "Invalid values. Required: author, title, content"});

    let newPost:mongoose.Document = new posts({
        postId: Date.now(), author, title, content, datePosted: new Date().toUTCString(), upvotes: 0
    });

    await newPost.save();

    return res.status(201).json({success: true, data: `Created post for '${author}'.`});
    // return res.status(400).json({success: false, data: "Error in creation."});
});

router.post("/like", async (req, res) => {

    const { postId, author } = req.body;

    const valuesAreValid = postId && author;
    if (!valuesAreValid) return res.status(400).json({success: false, message: "Invalid values. Required: postId && author"});

    const isDuplicatePost:mongoose.Document & postsInterface = await posts.findOne({ postId });
    if (!isDuplicatePost) return res.status(400).json({success: false, data: "Error in fetching, possibly wrong id given."});

    isDuplicatePost.upvotes++;

    await isDuplicatePost.save();

    return res.status(201).json({success: true, data: `Liked comment with post id '${postId}'.`});
    // return res.status(400).json({success: false, data: "Error in creation."});
});

router.post("/unlike", async (req, res) => {

    const { postId, author } = req.body;

    const valuesAreValid = postId && author;
    if (!valuesAreValid) return res.status(400).json({success: false, message: "Invalid values. Required: postId && author"});

    const isDuplicatePost:mongoose.Document & postsInterface = await posts.findOne({ postId });
    if (!isDuplicatePost) return res.status(400).json({success: false, data: "Error in fetching, possibly wrong id given."});

    isDuplicatePost.upvotes--;

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
    if (!valuesAreValid) return res.status(400).json({success: false, message: "Invalid values. Required: postId, author, pfpUrl, content"});

    const isDuplicatePost:mongoose.Document & postsInterface = await posts.findOne({ postId });
    if (!isDuplicatePost) return res.status(400).json({success: false, data: "Error in fetching, possibly wrong id given."});

    let newComment:comment = { author, content, pfpUrl, date: new Date().toUTCString(), upvotes: 0, commentId: Date.now().toString() };

    isDuplicatePost.comments.push(newComment);
    await isDuplicatePost.save();

    return res.status(201).json({success: true, data: `Created comment on post id '${postId}'.`});
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
    temp[0].upvotes++;

    isDuplicatePost.markModified("comments");
    await isDuplicatePost.save();

    return res.status(201).json({success: true, data: `Unliked comment with post id '${postId}'.`});
    // return res.status(400).json({success: false, data: "Error in creation."});
});

export default router;