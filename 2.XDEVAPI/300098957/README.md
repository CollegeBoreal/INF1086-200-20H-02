# Python X DEV API

### :one: Tester son programme

:pushpin: Utilisation de `MySQL JS` (sans redirection)

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


### :two: Finir son devoir 


:pushpin: Utilisation de `MySQL JS` 


:bulb: utiliser les redirections Unix 1> (stdout) et 2> (stderr)

```
$ docker container exec --interactive some-mysqlds mysqlsh --mysqlx \
                        --host localhost --user etudiants -petudiants_1 \
                   < ~/Developer/INF1086-200-20H-02/2.XDEVAPI/300098957/b300098957.sh 1> b300098957.sh.json 2>/dev/null
```

:pushpin: Utilisation de `MySQL Python`

```
$ docker container exec --interactive some-mysqlds mysqlsh --py \
                        --host localhost --user etudiants -petudiants_1 \
                   < ~/Developer/INF1086-200-20H-02/2.XDEVAPI/300098957/b300098957.py 1> b300098957.py.json 2>/dev/null
```

