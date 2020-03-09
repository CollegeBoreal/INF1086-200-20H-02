# Kafka

## :o: Création de votre répertoire de travail dans `git bash`

### :one: Dans le répertoire `5.Kafka` Créer un répertoire avec comme nom, votre :id:

`$ mkdir ` :id:

### :two: Copier les fichiers se trouvant dans le repretoire `.src` dans votre répertoire

`$ cp -r .src/* `:id:` `

### :three: Envoyer vers github

* soumettre votre répertoire de travail vers github `(git add, commit, push)` 

## :a: Dans votre Serveur Windows du laboratoire

### :one: Création d'une nouvelle machine virtuelle Kafka `CB-KAFKA`

:star: [Installer la VM CB-KAFKA](../K.Kafka)

### :zero: Cloner le cours sur le serveur Windows

```
PS > cd $HOME\Developer
PS > git clone https://github.com/CollegeBoreal/INF1086-200-20H-02.git
```

`PS > cd .\INF1086-200-20H-02\5.Kafka\`:id:



## :a: Création des conteneurs Kafka sur le serveur windows


### :three: Dans votre répertoire, construire l'image `Docker`

```
PS > docker build --tag mssql-server-windows-developer-fti .
```
