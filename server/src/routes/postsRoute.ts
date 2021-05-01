import express from "express";
import mongoose from "mongoose";
import posts from "../models/postsModel";
import {postsInterface} from "../ts/interface";

const router = express.Router();

router.get("/view", async (req, res) => {
    const foundPosts = await posts.find({});

    if (!foundPosts) return res.status(400).json({success: false, data: "Error in fetching."});
    return res.status(200).json({success: true, message: "Returning all posts", data: foundPosts});
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

export default router;