import mongoose from "mongoose";
const Schema = mongoose.Schema;

let doctorsSchema = new Schema({
  name: { type: String, required: true },
  surname: { type: String, required: true },
  age: { type: Number, required: true },
  gender: { type: String, required: true },
  medicalField: { type: String, required: true },
  licenseNumber: { type: Number, required: true },
  post: { type: String, required: true },
  placeOfWork: { type: String, required: true },
  country: { type: String, required: true },
  city: { type: String, required: true },
  doctorId: { type: String, required: true },
});

let doctors = mongoose.model("doctors", doctorsSchema);

export default doctors;