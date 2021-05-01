import express from "express";
import mongoose from "mongoose";
import doctors from "../models/doctorsModel";
const router = express.Router();

router.post("/", async (req, res) => {

    const { inputName } = req.body;
    
        let newDoctor:mongoose.Document = new doctors({
            name: "placeholder",
        });
    
        await newDoctor.save();
    
        return res.status(201).json({success: true, message: `Created listing for '${inputName}'.`});
        // return res.status(400).json({success: false, message: "Error in creation."});
});

export default router;