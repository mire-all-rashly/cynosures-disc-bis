# Topic
Sudo restriction bypass
(i.e., CVE-2019-14287).

## Technologies covered
- [sudo](https://www.sudo.ws/sudo.html)
  - https://www.sudo.ws/alerts/minus_1_uid.html

## Runtime Information
Generally, this assumes from the source directory unless otherwise stated.

### Dependencies
You may be able to get by with less, but ideally:
- make
- docker

### Running
```
make && make run
```

### Cleanup
```
make clean
```
