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

- `sudo docker build -t nginx srcs/requirements/nginx/` to build the nginx container
- `sudo docker image ls` to list the images
- `sudo docker image prune` to remove images with REPOSITORY and TAG `<none>`
- `sudo docker image rm nginx` to remove the image with REPOSITORY `nginx`
- `sudo docker ps -a` to list running containers
- `sudo docker run -it --rm <image name>` to create and run a new container from an image, where the terminal attaches its stdin and a TTY is allocated, and the container is automatically removed when it exits
- `sudo docker start 7e` restarts an existing container `7e`
- `sudo docker attach 7e` attaches to a running container `7e`
- `sudo docker stop 7e` to stop the container `7e`
- `sudo docker rm <CONTAINER ID>` to remove the container `7e`
- `(docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q)) 2>/dev/null` stop all containers, remove all containers, remove all images, remove all volumes, remove all networks
- `docker builder prune` to remove build cache

# MariaDB

- `mariadb -e "CREATE DATABASE IF NOT EXISTS FOO;"` creates a database `FOO`
- `mariadb -u root` logs in as root in mariadb
- `/etc/init.d/mariadb start` to manually run mariadb in the background
- `show databases;` to list all databases
- `show warnings;` right after a command that printed `1 warning` in order to view the warning

# wordpress

- `PAGER=cat /usr/local/bin/wp-cli-release.phar --allow-root` to show wp-cli's help list
- `PAGER=cat /usr/local/bin/wp-cli-release.phar --allow-root --path="/var/www/wordpress" --dbname=wordpress --dbuser="wordpress" config create` to generate `wp-config.php`

# Steps the inception tutorial didn't cover

1. Installing ssh with `usermod -a -G sudo sbos`, and restart the VM for the change to take effect
2. Installing ssh with `apt install openssh-server`
3. Needing `events` and `http` directives in `nginx.conf`
