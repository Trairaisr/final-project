import { NextFunction, Request, Response } from "express";

export function validateRole(role: string) {
  return (req: Request, res: Response, next: NextFunction) => {
    console.log(role, req.auth.userType,"testing if my name is spong bob ");

    if (role !== req.auth.userType) {
      return res
        .status(401)
        .send({ success: false, msg: "vladi You are not authorized" });
    }

    next();
  };
}
