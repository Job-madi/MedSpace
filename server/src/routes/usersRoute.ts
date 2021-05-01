import express from "express";
import mongoose from "mongoose";
import users from "../models/usersModel";
import {usersInterface} from "../ts/interface";

const router = express.Router();

router.get("/view", async (req, res) => {
    const foundUsers = await users.find({});

    if (!foundUsers) return res.status(400).json({success: false, data: "Error in fetching."});
    return res.status(200).json({success: true, message: "Returning all users", data: foundUsers});
});

router.post("/create", async (req, res) => {

    const { username, password }:usersInterface = req.body;
    
    const isDuplicate = await users.findOne({ username });
    if (isDuplicate) return res.status(400).json({success: false, message: "Account already exists."});

    const valuesAreValid = username && password;
    if (!valuesAreValid) return res.status(400).json({success: false, message: "Invalid values. Required: username, password"});

    let newUser:mongoose.Document = new users({
        username,
        password,
    });

    await newUser.save();

    return res.status(201).json({success: true, message: `Created user: '${username}'.`});
    // return res.status(400).json({success: false, message: "Error in creation."});
});

export default router;