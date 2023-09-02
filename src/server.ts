import express, { NextFunction, Request, Response } from "express";
import userRoute from "./routes/userroutes";
import vacationsRoute from "./routes/vacationsroutes";
import { expressjwt } from "express-jwt";

const app = express();

app.use(express.json());

app.use(
  expressjwt({
    secret: "trairaisr",
    algorithms: ["HS256"],
  }).unless({
    path: [/users/, { url: "/vacations", method: "GET" }],
  })
);

app.use("/users", userRoute);

app.use("/vacations", vacationsRoute);

app.use((error: Error, _: Request, res: Response, __: NextFunction) => {
    if((error as any).status === 401)
    return res.status(401).send("You are not authorized for this action")

    res.status(404).send("path not found")
});

app.listen(4000, () => console.log(`Server is up at port ${4000}`));
