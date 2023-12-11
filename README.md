# inception

VM user username: sbos
VM user password: aabc

`apt install openssh-server`

- `sudo docker build -t nginx srcs/requirements/nginx/` to build the nginx container
- `sudo docker image ls` to list the images
- `sudo docker image prune` to remove images with REPOSITORY and TAG `<none>`
- `sudo docker image rm nginx` to remove the image with REPOSITORY `nginx`
- `sudo docker ps -a` to list running containers
- `sudo docker run <image name>` to create and run a new container from an image
- `sudo docker run -it <image name>` to create and run a new container from an image, where the terminal attaches its stdin and a TTY is allocated
- `sudo docker start 7e` restarts an existing container `7e`
- `sudo docker attach 7e` attaches to a running container `7e`
- `Ctrl+P+Q` detaches from a container
- `sudo docker stop 7e` to stop the container `7e`
- `sudo docker rm <CONTAINER ID>` to remove the container `7e`
