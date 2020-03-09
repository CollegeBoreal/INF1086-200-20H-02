# Kafka


:bulb: Cours en ligne

https://www.linkedin.com/learning/learn-apache-kafka-for-beginners

## Installation

:pushpin: Créer une machine virtuelle

```
PS > docker-machine create --driver hyperv `
                           --hyperv-cpu-count "2" `
                           --hyperv-memory "4096" `
                           CB-KAFKA
```

:pushpin: POinter vers une machine virtuelle

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
