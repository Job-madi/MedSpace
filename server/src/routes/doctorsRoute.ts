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

router.post("/viewOne", async (req, res) => {
    const { doctorId }:doctorsInterface = req.body;

    const valuesAreValid = doctorId;
    if (!valuesAreValid) return res.status(400).json({success: false, message: "Invalid values. Required: doctorId"});

    const foundDoctor = await doctors.find({ doctorId });

    if (!foundDoctor) return res.status(400).json({success: false, data: "Error in fetching Possibly invalid doctorId."});
    return res.status(200).json({success: true, message: "Returning doctor", data: foundDoctor});
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