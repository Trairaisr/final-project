import { Router } from "express";
import { register, loginUser } from "../queries/usersQueries";
import { validateSchema } from "../middleware/validateSchema";
import registerSchema from "../schemas/registerSchema";
import loginSchema from "../schemas/loginSchema";

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

  res.send({
    userId,
  });
});

route.post("/login",validateSchema(loginSchema), async (req, res) => {
  const { username, password } = req.body;

  const userInfo = await loginUser(username, password);

  if (!userInfo)
    return res.status(404).send({
      success: false,
      message: "Username and Password do not match",
    });

  res.send({
    success:true,
    userInfo
  })

});

export default route;
