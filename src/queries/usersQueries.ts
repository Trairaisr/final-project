import { ResultSetHeader, RowDataPacket } from "mysql2";
import { sql } from "../sql";
import type { RegisterParams } from "../types/params";

export async function register(registerParams: RegisterParams) {
  try {
    if (await checkIfUserExists(registerParams.username)) return false;

    const [result] = await sql.execute<ResultSetHeader>(
      "INSERT INTO users (username, password, name, lastname, email) VALUES (?,?,?,?,?)",
      [
        registerParams.username,
        registerParams.password,
        registerParams.name,
        registerParams.lastname,
        registerParams.email,
      ]
    );

    return result.insertId;
  } catch (error) {
    return false;
  }
}

export async function loginUser(username: string, password: string) {
  const [[result]] = await sql.execute<RowDataPacket[]>(
    "SELECT * FROM users WHERE username = ? AND password = ?",
    [username, password]
  );

  if (!result) return false;

  return {
    id: result.id,
    name: result.name,
    lastname: result.lastname,
    userType: result.userType,
  };
}
async function checkIfUserExists(username: string) {
  try {
    const [[result]] = await sql.execute<RowDataPacket[]>(
      "SELECT id FROM users WHERE username = ?",
      [username]
    );
    return !!result;
  } catch (error) {
    return true;
  }
}
