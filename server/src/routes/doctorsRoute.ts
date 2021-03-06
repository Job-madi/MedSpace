import express from "express";
import mongoose from "mongoose";
import doctors from "../models/doctorsModel";
import users from "../models/usersModel";
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

    const foundDoctor = await doctors.findOne({ doctorId });

    if (!foundDoctor) return res.status(400).json({success: false, data: "Error in fetching Possibly invalid doctorId."});
    return res.status(200).json({success: true, message: "Returning doctor", data: foundDoctor});
});

router.post("/create", async (req, res) => {

    const { name, surname, age, gender, medicalField, licenseNumber, post, placeOfWork, country, city, pfpUrl, userId }:doctorsInterface = req.body;
    
    const valuesAreValid = name && surname && age && gender && medicalField && licenseNumber && post && placeOfWork && country && city && pfpUrl && userId;
    if (!valuesAreValid) return res.status(400).json({success: false, message: "Invalid values. Required: name, surname, age, gender, medicalField, licenseNumber, post, placeOfWork, country, city, pfpUrl, userId"});

    const foundUser = await users.findOne({ userId });
    if (!foundUser) return res.status(400).json({success: false, data: "Error in fetching with userId."});

    let newDoctor/*:mongoose.Document*/ = new doctors({
        name, surname, age, gender, medicalField, licenseNumber, post, placeOfWork, country, city, pfpUrl, doctorId: Date.now(), userId
    });

    foundUser.doctorId = newDoctor.doctorId;
    
    await newDoctor.save();
    await foundUser.save();

    return res.status(201).json({success: true, data: `Created doctor profile named '${name}'.`});
    // return res.status(400).json({success: false, data: "Error in creation."});
});

export default router;