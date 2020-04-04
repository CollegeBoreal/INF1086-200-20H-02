# Kafka


:bulb: Cours en ligne

https://www.linkedin.com/learning/learn-apache-kafka-for-beginners

## :o: Docker Machine

:star: Installer `docker-machine` outil permettant de créer une machine virtuelle

```
PS > choco install docker-machine
```



:pushpin: Pointer vers une machine virtuelle

```
PS > docker-machine env CB-KAFKA | Invoke-Expression
```

```
PS > docker-machine ls
NAME         ACTIVE   DRIVER   STATE     URL                      SWARM   DOCKER     ERRORS
CB-HYPERV    -        hyperv   Running   tcp://10.13.2.14:2376            v19.03.5
CB-HYPERV2   -        hyperv   Running   tcp://10.13.5.54:2376            v19.03.5
CB-KAFKA     *        hyperv   Running   tcp://10.13.4.228:2376           v19.03.5
```


## :b: Docker Compose

:star: Installer `docker-compose` outil permettant de composer avec un ensemble de conteneurs

```
PS > choco install docker-compose
```


## Quick Start

https://docs.confluent.io/current/quickstart/cos-docker-quickstart.html#

