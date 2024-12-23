## general

this included colima to run docker images

example useage

```bash
colima start
docker info
docker pull ubuntu
docker run -it ubuntu
```

devpod

```bash
colima start
devpod up . --provider docker --dotfiles https://github.com/gradybknight/dotfiles-two.git --ide none
devpod ls
devpod ssh NAME_OF_CONTAINER
```
