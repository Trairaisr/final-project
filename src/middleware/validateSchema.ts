import { NextFunction, Request, Response } from "express";
import { Schema } from "joi";

export function validateSchema(schema: Schema) {
  return (req: Request, res: Response, next: NextFunction) => {
    const result = schema.validate({
      ...req.body,
    });

    if (result.error) {
      return res.send({
        success: false,
        msg: result.error.message,
      });
    }

    next();
  };
}
