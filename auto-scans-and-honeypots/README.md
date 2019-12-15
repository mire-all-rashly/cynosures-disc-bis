# Topic
Auto-scans and Honeypots
(i.e., why performing credentialed scans on entire subnets can be bad).

## Technologies covered
- [OpenCanary](https://opencanary.readthedocs.io/latest)

## Runtime Information
Generally, this assumes from the source directory unless otherwise stated.

### Dependencies
You may be able to get by with less, but ideally:
- make
- docker
- tmux

### Running
```
make && make run
```

Once inside the tmux session, examine the following (just some):
- Get some port lists:
  - nmap opencanary
- 21
  - ftp opencanary
  - nmap --script brute -p 21 opencanary
- 22
  - ssh opencanary
  - nmap --script brute -p 22 opencanary
- 23
  - ncat opencanary 23
  - nmap --script brute -p 23 opencanary
- 69
  - tftp opencanary
- 80 and 8080
  - lynx opencanary
  - lynx opencanary:8080
- 1433 and 3306
  - mycli --host opencanary
  - nmap --script brute -p 1433 opencanary
  - nmap --script brute -p 3306 opencanary
- 9418
  - git clone git://opencanary/test.git
  - git clone git@opencanary:test

You can also examine RDP, SNMP, a more elaborate web, etc, but they will
require some other means as the "scanner" box does not have specific tools for
those.

### Cleanup
```
make clean
```
