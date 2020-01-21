# Python X DEV API


:pushpin: Utilisation de `MySQL JS`

```
$ docker container exec --interactive some-mysqlds mysqlsh --mysqlx \
                        --host localhost --user etudiants -petudiants_1 \
                   < ~/Developer/INF1086-200-20H-02/2.XDEVAPI/300098957/b300098957.sh
WARNING: Using a password on the command line interface can be insecure.
{
    "_id": "1", 
    "age": 19, 
    "name": "Laurie"
}
```


:pushpin: Utilisation de `MySQL Python`

```
$ docker container exec --interactive some-mysqlds mysqlsh --py \
                        --host localhost --user etudiants -petudiants_1 \
                   < ~/Developer/INF1086-200-20H-02/2.XDEVAPI/300098957/b300098957.py
WARNING: Using a password on the command line interface can be insecure.
{"_id": "1", "age": 19, "name": "Laurie"}
```
