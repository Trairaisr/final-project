import mysql from "mysql2/promise";

export const sql = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "Do!re2me3",
  database: "TravelIL",
});