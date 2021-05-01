import express from "express";
import mongoose from "mongoose";
import posts from "../models/postsModel";
const router = express.Router();

router.get("/view", async (req, res) => {
    const foundPosts = await posts.find({});

    if (!foundPosts) return res.status(400).json({success: false, data: "Error in fetching."});
    return res.status(200).json({success: true, message: "Returning all posts", data: foundPosts});
});

router.post("/", async (req, res) => {

    const { inputName } = req.body;
    
    let newPost:mongoose.Document = new posts({
        name: "placeholder",
    });

    await newPost.save();

    return res.status(201).json({success: true, data: `Created listing for '${inputName}'.`});
    // return res.status(400).json({success: false, data: "Error in creation."});
});

export default router;