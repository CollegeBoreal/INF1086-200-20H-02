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



```
% curl 'https://api.github.com/users/collegeboreal' | jq '. | { nom: .login, lieu: .location}'
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  1427  100  1427    0     0   9266      0 --:--:-- --:--:-- --:--:--  9206
{
  "nom": "CollegeBoreal",
  "lieu": "Toronto, Canada"
}
```

