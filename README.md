# World Cup Database

This project is a solution to the freeCodeCamp "World Cup Database" challenge. It involves creating and querying a PostgreSQL database to store and retrieve data related to FIFA World Cup tournaments.

## Features
- Stores World Cup teams and match results.
- Uses PostgreSQL to manage data.
- Includes SQL queries to insert and retrieve information.
- Implements constraints and relationships between tables.

## Technologies Used
- PostgreSQL
- Bash scripting (for automation)
- SQL (Structured Query Language)

## Project Structure
- `worldcup.sql`: SQL script for creating and populating the database.
- `queries.sh`: Shell script containing SQL queries for retrieving required information.
- `insert_data.sh`: A shell script to automate data insertion.

## How to Use
1. Ensure you have PostgreSQL installed.
2. Create a new database by running:
   ```sh
   createdb worldcup
   ```
3. Execute the SQL script to set up the database:
   ```sh
   psql -d worldcup -f worldcup.sql
   ```
4. Insert data using `insert_data.sh`
5. Run queries from `queries.sh`:
   ```sh
  ./queries.sh
   ```

## Requirements
- PostgreSQL installed on your system.
- Basic understanding of SQL.
- Ability to run shell commands.

## Author
This project was completed as part of freeCodeCamp's Relational Database Certification.

## License
This project is open-source and available under the [MIT License](LICENSE).
