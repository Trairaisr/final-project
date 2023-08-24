import express from "express";
import userRoute from "./routes/userroutes";

const app = express();

app.use(express.json());

app.use("/users", userRoute);

app.listen(4000, () => console.log(`Server is up at port ${4000}`));
