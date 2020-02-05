# Docker

## :pushpin: Sauvegarder son image avec `commit`

```
$ docker commit --message "version 2.3" some-mysqlds 300098957/some-mysqlds:v1.2
```

         --env MYSQL_ROOT_PASSWORD=password \


```
docker container run \
         --name some-mysqlds \
         --publish 3306:3306 \
         --publish 33060:33060 \
         --detach \
         300098957/some-mysqlds:v1.2
```

## References:

https://docs.docker.com/engine/reference/commandline/commit/
