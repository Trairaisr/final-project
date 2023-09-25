import { Router } from "express";
import { register, loginUser } from "../queries/usersQueries";
import { validateSchema } from "../middleware/validateSchema";
import registerSchema from "../schemas/registerSchema";
import loginSchema from "../schemas/loginSchema";
import Jwt from "jsonwebtoken";

const route = Router();

route.post("/register", validateSchema(registerSchema), async (req, res) => {
  const { username, password, name, lastname, email } = req.body;

  const userId = await register({
    username,
    password,
    name,
    lastname,
    email,
  });

  if (!userId) return res.send({ success: false });

  const token = Jwt.sign(
    {
      userId,
      userType: "user",
    },
    "trairaisr",
    { algorithm: "HS256" }
  );

  res.send({
    userId,
    token,
  });
});

route.post("/login", validateSchema(loginSchema), async (req, res) => {
  const { username, password } = req.body;

  const userInfo = await loginUser(username, password);

  if (!userInfo)
    return res.status(404).send({
      success: false,
      message: "Username and Password do not match",
    });

  const token = Jwt.sign(
    {
      userId: userInfo.id,
      userType: userInfo.userType
    },
    "trairaisr",
    { algorithm: "HS256"}
  );

  res.send({
    success: true,
    userInfo,
    token
  });
});

export default route;
