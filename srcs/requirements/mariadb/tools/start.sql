-- -- TODO: Try to remove this, it should be redundant
-- FLUSH PRIVILEGES;

-- -- TODO: Aren't we supposed to set up a database?

-- CREATE USER IF NOT EXISTS "$DB_USER"@'localhost' IDENTIFIED BY "$DB_PASSWORD";

-- -- TODO: *.* here means "in every table, in every column", so try to limit it to just mydb.*
-- -- We don't do "IDENTIFIED BY PASSWD" here,
-- -- since using it here can change the user's password:
-- -- https://stackoverflow.com/a/42998360
-- GRANT ALL PRIVILEGES ON *.* TO "$DB_USER"@'localhost';

-- -- TODO: Try to remove this, it should be redundant
-- FLUSH PRIVILEGES;


-- TODO: Try to use my above commented version instead of this
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $DB_NAME;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD('$DB_ROOT_PASSWORD') WITH GRANT OPTION;
GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
FLUSH PRIVILEGES;
