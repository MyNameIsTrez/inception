# inception

VM username is `sbos`
VM password is `aabc`

[inception tutorial](https://tuto.grademe.fr/inception/#)
[vbenneko's inception](https://github.com/adfhjl/Inception)

# Docker commands

- `Ctrl + P + Q` detaches from a container

- `sudo docker build -t nginx srcs/requirements/nginx/` to build the nginx container
- `sudo docker image ls` to list the images
- `sudo docker image prune` to remove images with REPOSITORY and TAG `<none>`
- `sudo docker image rm nginx` to remove the image with REPOSITORY `nginx`
- `sudo docker ps -a` to list running containers
- `sudo docker run <image name>` to create and run a new container from an image
- `sudo docker run -it --rm <image name>` to create and run a new container from an image, where the terminal attaches its stdin and a TTY is allocated, and the container is automatically removed when it exits
- `sudo docker start 7e` restarts an existing container `7e`
- `sudo docker attach 7e` attaches to a running container `7e`
- `sudo docker stop 7e` to stop the container `7e`
- `sudo docker rm <CONTAINER ID>` to remove the container `7e`

# Steps the inception tutorial didn't cover

1. Installing ssh with `apt install openssh-server`
2. Needing `events` and `http` directives in `nginx.conf`
