import mongoose from "mongoose";
const Schema = mongoose.Schema;

let postsSchema = new Schema({
  postId: { type: String, required: true },
  author: { type: String, required: true },
  title: { type: String, required: true },
  content: { type: String, required: true },
  datePosted: { type: String, required: true },
  upvotes: { type: String, required: true },
});

let posts = mongoose.model("posts", postsSchema);

export default posts;