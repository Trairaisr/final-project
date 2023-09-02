import Joi from "joi";

const createVacationSchema = Joi.object({
  destination: Joi.string().max(30).required(),
  description: Joi.string().min(8).max(500).required(),
  image: Joi.string().max(500).required(),
  startDate: Joi.date().required(),
  endDate: Joi.date().required(),   
  price: Joi.number().min(1).max(10000).required(),
});

export default createVacationSchema;
