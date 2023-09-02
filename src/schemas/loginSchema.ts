import Joi from "joi";

const loginSchema = Joi.object({
  username: Joi.string().alphanum().min(6).max(20).required(),
  password: Joi.string().alphanum().min(8).max(12).required(),
});

export default loginSchema;