import Joi from "joi";

const loginSchema = Joi.object({
  username: Joi.string().alphanum().required(),
  password: Joi.string().alphanum().required(),
});

export default loginSchema;