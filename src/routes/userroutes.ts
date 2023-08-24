import { Router } from "express";
import { register } from "../queries/usersQueries";

const route = Router();

route.post("/register", async (req, res) => {
  const { username, password, name, lastname, email } = req.body;

  const userId = await register({
    username,
    password,
    name,
    lastname,
    email,
  });

  res.send({
    userId,
  });
});

export default route;
