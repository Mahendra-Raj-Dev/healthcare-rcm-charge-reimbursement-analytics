
import sqlite3
from pathlib import Path

PROJECT_DIR = Path(__file__).resolve().parent
DB_PATH = PROJECT_DIR / "healthcare_rcm.db"
SQL_PATH = PROJECT_DIR / "sql" / "02_top_drgs_by_medicare_payment.sql"

with sqlite3.connect(DB_PATH) as conn:
    cursor = conn.cursor()

    with open(SQL_PATH, "r", encoding="utf-8") as file:
        sql_file = file.read()
        cursor.execute(sql_file)
        print(cursor.fetchall())
