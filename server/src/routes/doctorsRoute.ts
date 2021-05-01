import express from "express";
import mongoose from "mongoose";
import doctors from "../models/doctorsModel";
import {doctorsInterface} from "../ts/interface";

const router = express.Router();

router.get("/view", async (req, res) => {
    const foundDoctors = await doctors.find({});

    if (!foundDoctors) return res.status(400).json({success: false, data: "Error in fetching."});
    return res.status(200).json({success: true, message: "Returning all doctors", data: foundDoctors});
});

router.post("/create", async (req, res) => {

    const { name, surname, age, gender, medicalField, licenseNumber, post, placeOfWork, country, city, pfpUrl }:doctorsInterface = req.body;
    
    const valuesAreValid = name && surname && age && gender && medicalField && licenseNumber && post && placeOfWork && country && city && pfpUrl;
    if (!valuesAreValid) return res.status(400).json({success: false, message: "Invalid values. Required: name, surname, age, gender, medicalField, licenseNumber, post, placeOfWork, country, city, pfpUrl"});

    let newDoctor:mongoose.Document = new doctors({
        name, surname, age, gender, medicalField, licenseNumber, post, placeOfWork, country, city, pfpUrl, doctorId: Date.now()
    });

    await newDoctor.save();

    return res.status(201).json({success: true, data: `Created doctor profile named '${name}'.`});
    // return res.status(400).json({success: false, data: "Error in creation."});
});

export default router;