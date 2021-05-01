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

router.post("/viewOne", async (req, res) => {
    const { userId }:usersInterface = req.body;

    const valuesAreValid = userId;
    if (!valuesAreValid) return res.status(400).json({success: false, message: "Invalid values. Required: userId"});

    const foundUser = await users.findOne({ userId });

    if (!foundUser) return res.status(400).json({success: false, data: "Error in fetching Possibly invalid userId."});
    return res.status(200).json({success: true, message: "Returning user", data: foundUser});
});

router.post("/create", async (req, res) => {

    const { username, password, pfpUrl }:usersInterface = req.body;
    
    const isDuplicate = await users.findOne({ username });
    if (isDuplicate) return res.status(400).json({success: false, message: "Account already exists."});

    const valuesAreValid = username && password && pfpUrl;
    if (!valuesAreValid) return res.status(400).json({success: false, message: "Invalid values. Required: username, password, pfpUrl"});

    let newUser:mongoose.Document = new users({
        username,
        password,
        pfpUrl,
        userId: Date.now()
    });

    await newUser.save();

    return res.status(201).json({success: true, message: `Created user: '${username}'.`});
    // return res.status(400).json({success: false, message: "Error in creation."});
});

router.post("/login", async (req, res) => {

    const { username, password }:usersInterface = req.body;
    
    const valuesAreValid = username && password;
    if (!valuesAreValid) return res.status(400).json({success: false, message: "Invalid values. Required: username, password"});

    const isDuplicate = await users.findOne({ username });
    if (!isDuplicate) return res.status(400).json({success: false, message: "Account doesn't exist."});

    return res.status(200).json({success: true, message: `Signed in user: '${username}'.`, data: isDuplicate });
    // return res.status(400).json({success: false, message: "Error in creation."});
});

export default router;