-- TODO: Try to remove this, it should be redundant
FLUSH PRIVILEGES;

-- TODO: Aren't we supposed to set up a database?

CREATE USER IF NOT EXISTS "$DB_USER"@'localhost' IDENTIFIED BY "$DB_PASSWORD";

-- TODO: *.* here means "in every table, in every column", so try to limit it to just mydb.*
-- We don't do "IDENTIFIED BY PASSWD" here,
-- since using it here can change the user's password:
-- https://stackoverflow.com/a/42998360
GRANT ALL PRIVILEGES ON *.* TO "$DB_USER"@'localhost';

-- TODO: Try to remove this, it should be redundant
FLUSH PRIVILEGES;
