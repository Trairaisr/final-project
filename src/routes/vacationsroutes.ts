import { Router } from "express";
import {
  createVacation,
  deleteVacation,
  selectVacations,
} from "../queries/vacationQueries";

const route = Router();

route.get("/", async (req, res) => {
  const vacations = await selectVacations();

  res.send({ vacations });
});

route.post("/createVacation", async (req, res) => {
  const { destination, description, image, startDate, endDate, price } =
    req.body;

  const vacationId = await createVacation({
    destination,
    description,
    image,
    startDate,
    endDate,
    price,
  });

  res.send({
    vacationId,
  });
});

route.delete("/", async (req, res) => {
  const { vacationId } = req.body;
  const isDeleted = await deleteVacation(vacationId); // to make sure we deleted a row (vacation)
  res.send({ success: isDeleted });
});
export default route;
