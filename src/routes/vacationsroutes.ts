import { Router } from "express";
import {
  createVacation,
  deleteVacation,
  selectVacations,
  updateVacation,
} from "../queries/vacationQueries";
import { validateSchema } from "../middleware/validateSchema";
import createVacationSchema from "../schemas/createVacationScheme";
import updateVacationSchema from "../schemas/updateVacationSchema";
import { validateRole } from "../middleware/checkRole";

const route = Router();

route.get("/", async (_, res) => {
  const vacations = await selectVacations();

  res.send({ vacations });
});

route.post(
  "/",
  validateRole("admin"),
  validateSchema(createVacationSchema),
  async (req, res) => {
    const { destination, description, image, startDate, endDate, price } =
      req.body;

    if (new Date(startDate).getTime() >= new Date(endDate).getTime())
      return res.send({ success: false });

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
  }
);

route.put(
  "/",
  validateRole("admin"),
  validateSchema(updateVacationSchema),
  async (req, res) => {
    const {
      vacationId,
      destination,
      description,
      image,
      startDate,
      endDate,
      price,
    } = req.body;

    const isUpdated = await updateVacation({
      id: vacationId,
      destination,
      description,
      image,
      startDate,
      endDate,
      price,
    });

    res.send({
      success: isUpdated,
    });
  }
);

route.delete("/", validateRole("admin"), async (req, res) => {
  const { vacationId } = req.body;

  if (typeof vacationId !== "number") return res.send({ success: false });

  const isDeleted = await deleteVacation(vacationId); // to make sure we deleted a row (vacation)

  res.send({ success: isDeleted });
});
export default route;
