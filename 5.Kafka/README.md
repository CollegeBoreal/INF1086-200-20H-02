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

- [ ] lancer les conteneurs

```
PS > docker-compose up --detach --build
```

- [ ] Vérifier les conteneurs
