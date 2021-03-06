import express from "express";
import cors from "cors";
import mongoose from "mongoose";
import doctors from "./routes/doctorsRoute";
import users from "./routes/usersRoute";
import posts from "./routes/postsRoute";

const app: express.Application = express();
require("dotenv").config();

app.use(express.json());
app.use(cors({}));

app.use("/doctors", doctors);
app.use("/users", users);
app.use("/posts", posts);

app.get("/", (req, res) => {
  res.status(200).json({test: ""});
});

mongoose
  .connect(process.env.DB_CONNECT!, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useFindAndModify: false,
  })
  .then((result) =>
    app.listen(process.env.PORT || 3001, () =>
      console.log(`Listening on port ${process.env.PORT || 3001}`)
    )
  )
  .catch((err) => {
    console.log(err);
  });
