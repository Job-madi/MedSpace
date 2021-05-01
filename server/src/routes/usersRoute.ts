import express from "express";
import mongoose from "mongoose";
import users from "../models/usersModel";
const router = express.Router();

router.get("/view", async (req, res) => {
    const foundUsers = await users.find({});

    if (!foundUsers) return res.status(400).json({success: false, data: "Error in fetching."});
    return res.status(200).json({success: true, message: "Returning all users", data: foundUsers});
});

router.post("/", async (req, res) => {

    const { inputName } = req.body;
    
    let newUser:mongoose.Document = new users({
        name: "placeholder",
    });

    await newUser.save();

    return res.status(201).json({success: true, message: `Created user: '${inputName}'.`});
    // return res.status(400).json({success: false, message: "Error in creation."});
});

export default router;