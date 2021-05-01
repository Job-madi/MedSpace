import express from "express";
import mongoose from "mongoose";
import doctors from "../models/doctorsModel";
const router = express.Router();

router.get("/", async (req, res) => {
    const foundDoctors = await doctors.find({});

    if (!foundDoctors) return res.status(400).json({success: false, data: "Error in fetching."});
    return res.status(200).json({success: true, message: "Returning all doctors", data: foundDoctors});
});

router.post("/", async (req, res) => {

    const { inputName } = req.body;
    
    let newDoctor:mongoose.Document = new doctors({
        name: "placeholder",
    });

    await newDoctor.save();

    return res.status(201).json({success: true, data: `Created listing for '${inputName}'.`});
    // return res.status(400).json({success: false, data: "Error in creation."});
});

export default router;