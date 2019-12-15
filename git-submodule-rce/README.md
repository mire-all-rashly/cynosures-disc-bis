# Topic
Git `submodule update` RCE'ish
(i.e., CVE-2019-19604).

## Technologies covered
- [git]()
  - https://gitlab.com/gitlab-com/gl-security/disclosures/blob/master/003_git_submodule/advisory.md
  - https://security-tracker.debian.org/tracker/CVE-2019-19604

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
