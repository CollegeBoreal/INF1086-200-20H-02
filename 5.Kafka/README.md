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

### :one: Dans votre répertoire de travail, construire les images et démarrer les conteneurs avec `docker-compose`

```
PS > docker-compose up --detach --build
```
