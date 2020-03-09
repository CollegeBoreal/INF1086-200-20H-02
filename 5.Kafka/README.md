# Kafka

## :o: Création d'une machine virtuelle Kafka sur le serveur windows

[Installer la VM CB-KAFKA](../K.Kafka)

## :a: Création des conteneurs Kafka sur le serveur windows

### :zero: Cloner le cours sur le serveur Windows

```
PS > git clone https://github.com/CollegeBoreal/INF1086-200-20H-02.git
```

### :one: Creer un répertoire avec comme nom votre :id:

`$ mkdir ` :id:

### :two: Copier les fichiers se trouvant dans le repretoire `.src` dans votre répertoire

`$ cp -r .src/* `:id:` `

### :three: Dans votre répertoire, construire l'image `Docker`

```
PS > docker build --tag mssql-server-windows-developer-fti .
```
