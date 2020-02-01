# JSON



# Tools JQ

:o: Install JQ

:a: Windows

```
PS > choco install jq
```

:b: Mac

```
% brew install jq
```



$ curl 'https://api.github.com/users/setrar' | jq '.[0] | {user: .login, where: .location}'
