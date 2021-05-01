import express from "express";
import mongoose from "mongoose";
import users from "../models/usersModel";
const router = express.Router();

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