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
