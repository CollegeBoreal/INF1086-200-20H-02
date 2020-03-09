# Kafka

## :o: Création de votre répertoire de travail dans `git bash`

### :one: Dans le répertoire `5.Kafka` Créer un répertoire avec comme nom, votre :id:

`$ mkdir ` :id:

### :two: Copier les fichiers se trouvant dans le repretoire `.src` dans votre répertoire

`$ cp -r .src/* `:id:` `

### :three: Envoyer vers github

* soumettre votre répertoire de travail vers github `(git add, commit, push)` 

## :a: Dans votre Serveur Windows du laboratoire

### :one: Créer une nouvelle machine virtuelle `CB-KAFKA` et `docker-compose`

:star: [Installer la VM CB-KAFKA](../K.Kafka)

### :two: Cloner le cours

```
PS > cd $HOME\Developer
PS > git clone https://github.com/CollegeBoreal/INF1086-200-20H-02.git
```

### :three: Aller dans votre répertoire de travail


`PS > cd .\INF1086-200-20H-02\5.Kafka\`:id:


## :b: Créer les conteneurs `Kafka` sur le serveur windows

### :one: Construire les images et démarrer les conteneurs avec `docker-compose`

- [ ]  Assurez vous que vous pointez sur la VM `CB-KAFKA`

```
PS > docker-machine env CB-KAFKA | Invoke-Expression
```

- [ ] Vérifiez l'étoile dans la colonne `ACTIVE` 


```
> docker-machine ls
NAME         ACTIVE   DRIVER   STATE     URL                      SWARM   DOCKER     ERRORS
CB-HYPERV    -        hyperv   Running   tcp://10.13.2.14:2376            v19.03.5
CB-HYPERV2   -        hyperv   Running   tcp://10.13.5.54:2376            v19.03.5
CB-KAFKA     *        hyperv   Running   tcp://10.13.4.228:2376           v19.03.5
```

:pushpin: Dans votre répertoire de travail, lancer les conteneurs

- [ ] lancer les conteneurs (prend quelques minutes)

```
PS > docker-compose up --detach --build
...
...
...
Status: Downloaded newer image for confluentinc/cp-kafka-rest:5.4.0
Creating zookeeper ... done
Creating broker    ... done
Creating schema-registry ... done
Creating connect         ... done
Creating rest-proxy      ... done
Creating ksql-server     ... done
Creating ksql-cli        ... done
Creating ksql-datagen    ... done
```

## :two: Vérifier la santé des conteneurs

- [ ] Vérification


```
PS > docker-compose ps
     Name                   Command                      State                      Ports
----------------------------------------------------------------------------------------------------
broker            /etc/confluent/docker/run      Up                      0.0.0.0:29092->29092/tcp, 0.0.0.0:9092->9092/tcp
connect           /etc/confluent/docker/run      Up (health: starting)   0.0.0.0:8083->8083/tcp, 9092/tcp
ksql-cli          /bin/sh                        Up
ksql-datagen      bash -c echo Waiting for K     Up
                  ...
ksql-server       /etc/confluent/docker/run      Up (healthy)            0.0.0.0:8088->8088/tcp
rest-proxy        /etc/confluent/docker/run      Up                      0.0.0.0:8082->8082/tcp
schema-registry   /etc/confluent/docker/run      Exit 1
zookeeper         /etc/confluent/docker/run      Up                      0.0.0.0:2181->2181/tcp, 2888/tcp, 3888/tcp
```

- [ ] Si un conteneur n'est pas `up`, relancer la commande


```
PS > docker-compose up --detach --build
```

- [ ] Voir le log (trace) du broker avoir la commande suivante (CTRL-C pour arreter)

```
PS > docker-compose logs --follow broker
```

## :ab: Se connecter au `broker` Kafka

:bulb: Dans une autre fenetre Powershell

- [ ]  par <b>docker</b> `exec`

```
PS > docker container exec --interactive --tty broker bash
```

ou plus simplement 

- [ ]  par <b>docker-compose</b> `exec`


```
PS > docker-compose exec broker 
```

## :desktop_computer: Kafka Broker CLI

- [ ] Créer un topic appellé `first_topic`

```
root@broker:/# kafka-topics --zookeeper zookeeper:2181 \
                            --create --replication-factor 1 --partitions 1 --topic first_topic
WARNING: Due to limitations in metric names, topics with a period ('.') or underscore ('_') could collide. 
To avoid issues it is best to use either, but not both.
Created topic first_topic.
```
- [ ]  Liste des `topics` 

```
root@broker:/# kafka-topics --zookeeper zookeeper:2181 --list
__confluent.support.metrics
__consumer_offsets
_confluent-ksql-default__command_topic
_schemas
docker-connect-configs
docker-connect-offsets
docker-connect-status
first_topic
```

# :eight_pointed_black_star:  Suivre le cours en ligne

https://www.linkedin.com/learning/learn-apache-kafka-for-beginners

- [ ] 1. Kafka Theory

- [ ] 3. Command Line Interface (CLI) 101
