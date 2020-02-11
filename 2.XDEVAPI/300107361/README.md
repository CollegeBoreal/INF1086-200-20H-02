# Tester son Programme

:1: Avec MySQL Python
```
 $ docker container exec --interactive some-mysqlds mysqlsh --py \
            --host localhost --user joker -ppassword \
            < ~/Developer/INF1086-200-20H-02/2.XDEVAPI/300107361/b300107361.py
WARNING: Using a password on the command line interface can be insecure.
{"Mfr_CommonName": "Lamborghini", "Model": "Aventador", "_id": "2", "country": "Italy"}
