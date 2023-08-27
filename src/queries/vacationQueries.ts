import { ResultSetHeader, RowDataPacket } from "mysql2";
import { sql } from "../sql";
import { VacationParams } from "../types/params";

export async function selectVacations() {
  const [result] = await sql.execute<RowDataPacket[]>(
    "SELECT * FROM vacations"
  );
  return result;
}

export async function createVacation(
  createVacationParams: Omit<VacationParams, "id">
) {
  const [result] = await sql.execute<ResultSetHeader>(
    "INSERT INTO vacations (destination, description, image, startDate, endDate, price) VALUES (?,?,?,?,?,?)",
    [
      createVacationParams.destination,
      createVacationParams.description,
      createVacationParams.image,
      createVacationParams.startDate,
      createVacationParams.endDate,
      createVacationParams.price,
    ]
  );
  return result.insertId;
}

export async function upDateVacation(vacationParams: VacationParams) {
  const [result] = await sql.execute<ResultSetHeader>(
    "UPDATE vacations SET destination = ? , description = ?, image = ? , startDate = ? , endDate = ? , price = ? WHERE id = ? ",
    [
      vacationParams.destination,
      vacationParams.description,
      vacationParams.image,
      vacationParams.startDate,
      vacationParams.endDate,
      vacationParams.price,
      vacationParams.id,
     ]
  );
  return result
}

export async function deleteVacation(vacationId: number) {
  const [result] = await sql.execute<ResultSetHeader>(
    "DELETE FROM vacations WHERE id = ?",
    [vacationId]
  );

  return !!result.affectedRows;
}
