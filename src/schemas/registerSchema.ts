import Joi from "joi";

const registerSchema = Joi.object({
  username: Joi.string().alphanum().min(6).max(20).required(),
  password: Joi.string().alphanum().min(8).max(12).required(),
  name: Joi.string().regex(/^[a-zA-Z]+$/).min(3).max(20).required(),
  lastname: Joi.string().regex(/^[a-zA-Z]+$/).min(3).max(20).required(),
  email: Joi.string().email().required(),
});

export default registerSchema;

