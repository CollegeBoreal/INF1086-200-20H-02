# Kafka

## :a: Création des conteneurs Kafka sur le serveur windows

### :one: Creer un répertoire avec comme nom votre :id:

`PS > mkdir ` :id:

### :two: Copier les fichiers se trouvant dans le repretoire `.src` dans votre répertoire

`PS > cp -r .\src\* `:id:` `

### :three: Dans votre répertoire, construire l'image `Docker`

```
PS > docker build --tag mssql-server-windows-developer-fti .
```
