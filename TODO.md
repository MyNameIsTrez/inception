# TODO:

`PAGER=cat /usr/local/bin/wp-cli.phar --allow-root --path="/var/www/wordpress" --dbname=wordpress --dbuser="wordpress" config create --ssh=docker:nginx`
^the --ssh argument is wrong

- For some reason stuff is put in `data/wordpress/wordpress/`, rather than `data/wordpress/`

# Questions

- Should the .env file that is handed in contain empty values for keys, or should the file just be empty or smth?

# Before handing in

- Put .env in gitignore, and make sure to remove it from git's cache as well. This is due to the PDF stating "For obvious security reasons, any credentials, API keys, env variables etc... must be saved locally in a .env file and ignored by git."
- "The Docker images must have the same name as their corresponding service", according to the PDF and eval sheet, so change the image name `srcs-mariadb` to `mariadb`, and do the same for nginx and wordpress
- Try moving as many .sh script commands to Docker RUN commands
- Remove evaluation_files/ and evaluation.html
- Double-check that no .env file is handed in
- Clone from intra and use it to go over the subject and eval sheet one more time
