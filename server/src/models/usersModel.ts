import mongoose from "mongoose";
const Schema = mongoose.Schema;

let usersSchema = new Schema({
  username: { type: String, required: true },
  password: { type: String, required: true },
  posts: { type: Array, required: true },
  upvotedPosts: { type: Array, required: true },
  userId: { type: String, required: true },
  // add more info later
});

let users = mongoose.model("users", usersSchema);

export default users;