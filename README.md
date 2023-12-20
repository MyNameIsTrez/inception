# inception

VM username is `sbos`
VM password is `aabc`

[inception tutorial](https://tuto.grademe.fr/inception/#)
[vbenneko's inception](https://github.com/adfhjl/Inception)
[mivw's inception](https://github.com/42-mvan-wij/Inception/blob/master/srcs/docker-compose.yml)
[Don't use the Docker group, use sudo](https://fosterelli.co/privilege-escalation-via-docker.html)
[/usr/local/bin/ rather than /usr/bin/ because future distribution upgrades may modify or delete them without warning](https://unix.stackexchange.com/a/8658)
[wp config command documentation for wp-config.php](https://github.com/wp-cli/config-command)

# Docker commands

- `Ctrl + P + Q` detaches from a container

- `docker build -t nginx srcs/requirements/nginx/` to build the nginx container
- `docker image ls` to list the images
- `docker image prune` to remove images with REPOSITORY and TAG `<none>`
- `docker image rm nginx` to remove the image with REPOSITORY `nginx`
- `docker ps -a` to list running containers
- `docker run -it --rm <image name>` to create and run a new container from an image, where the terminal attaches its stdin and a TTY is allocated, and the container is automatically removed when it exits
- `docker start 7e` restarts an existing container `7e`
- `docker attach 7e` attaches to a running container `7e`
- `docker stop 7e` to stop the container `7e`
- `docker rm <CONTAINER ID>` to remove the container `7e`
- `(docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q)) 2>/dev/null` stop all containers, remove all containers, remove all images, remove all volumes, remove all networks
- `docker builder prune` to clear the build cache
- `docker exec -it wordpress bash` to run the command `bash` in the running container `wordpress`
- `docker logs <CONTAINER ID>` to see why the container exited

# nginx

- `docker build -t nginx srcs/requirements/nginx/` to build the nginx container
- `docker run -it --rm nginx` to run the nginx container

# mariadb

- `docker build -t mariadb srcs/requirements/mariadb/` to build the mariadb container
- `docker run -it --rm -e DB_USER="sbos" -e DB_PASSWORD="aabc" mariadb` to run the mariadb container

- `mariadb -e "CREATE DATABASE IF NOT EXISTS FOO;"` creates a database `FOO`
- `mariadb -u root` logs in as root in mariadb
- `/etc/init.d/mariadb start` or `mariadbd &` to manually run mariadb in the background
- `show databases;` to list all databases
- `show warnings;` right after a command that printed `1 warning` in order to view the warning

# wordpress

- `docker build -t wordpress srcs/requirements/wordpress/` to build the wordpress container
- `docker run -it --rm wordpress` to run the wordpress container

- `PAGER=cat /usr/local/bin/wp-cli-release.phar --allow-root` to show wp-cli's help list
- `PAGER=cat /usr/local/bin/wp-cli-release.phar --allow-root --path="/var/www/wordpress" --dbname=wordpress --dbuser="wordpress" config create` to generate `wp-config.php`

# docker compose

- `docker compose --project-directory srcs up --build -d --remove-orphans` to start up the containers
- `docker compose --project-directory srcs down` to shut down the containers

# Things the inception tutorial didn't cover

If you do this project, make the docker-compose first; it is virtually impossible to get mariadb/nginx/wordpress working individually in my experience!

TODO: I decided not to call *any* .sh script, as we can just let the background daemons calls that we want to run in an infinite loop be run by the `Dockerfile` its `CMD`. We can use Docker's build-time `RUN` for everything else, so we don't need .sh scripts!

1. Add `sbos` to the `sudo` group with `usermod -a -G sudo sbos`, and restart the VM for the change to take effect
2. Install ssh and git with `sudo apt install openssh-server git`
3. Set the git username and email with `git config --global user.name "MyNameIsTrez"` and `git config --global user.email "welfje@gmail.com"`
4. Install Docker for Debian by copying [these](https://docs.docker.com/engine/install/debian/) commands
5. Allow the user `sbos` to run docker commands without sudo by running `sudo groupadd docker` if the docker group doesn't exist yet, and `sudo gpasswd -a $USER docker` to add sbos to the docker group. You need to restart the VM for `groups` to reflect the change, and for docker to work without `sudo`
6. Need `events` and `http` directives in `nginx.conf`
