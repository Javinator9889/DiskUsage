# DiskUsage
*DiskUsage command for listing files, folders and more and get how much space they are using*

**DiskUsage** is a simple but powerful program to retrieve *information about used space* in your disk. It can list **files**, **folders** and more to give you the view you need of your disk.

And it *does not need* any other third party program: it is using **basic Unix commands** with specific sintax (you can see what is doing by [clicking here](https://github.com/Javinator9889/DiskUsage/blob/master/dusage#L43)


## How to install

**NOTICE THAT THIS PROGRAM WILL ONLY WORK ON UNIX BASED SYSTEMS**

1. Download *autorun.sh* file to your system


[![CircleCI](https://img.shields.io/badge/Download%20-autorun.sh-green.svg)](https://goo.gl/LDAL3Q) **(Right click - Save link as...)**

### Directly from Terminal (if you are root)
```bash
  su
  apt-get update
  apt-get upgrade
  wget https://goo.gl/LDAL3Q && mv LDAL3Q autorun.sh && chmod +x autorun.sh #You can get this file without root, it is for simplifying
  ./autorun.sh
```

### See available options for using this program
```bash
   ./autorun.sh -h
```
![BASH EXECUTION](https://raw.githubusercontent.com/Javinator9889/DiskUsage/master/info.png)

### Manually installation

If **you do not have sudo or root**, there is an available method for you to use *DiskUsage*:
```bash
   cd
   wget https://goo.gl/LDAL3Q && mv LDAL3Q autorun.sh && chmod +x autorun.sh
   ./autorun.sh -c
   export PATH=$PATH:/home/$USER/DiskUsage
```
If everything is OK, if you run ```which dusage``` your *home folder* and execution file shoudl appear

------------------

## How to use

### Invoke command
```bash
   dusage
```
This option will display usage in current folder, with *human readable format*. Also, you can use ```dusage -h``` or ```dusage --help``` to get available commands and options

### Different arguments

+ **-r | --reverse**: by *default*, this program shows files in ascending order: **lower files** are at top and **bigger files** at bottom. With this option enabled, you can list files in *reverse order* (**bigger files** at top, **lower files** at bottom)
```bash
   dusage -r
```

+ **-d | --directory** *+ PATH*: if you use **dusage** with no args, it will display current folder usage. If you want to see **how much space is used in another folder/drive**, just add the option *-d* followed by dir to be checked
```bash
   dusage -d /var
   Showing space usage in: /var

   +------+-----------+
   | Size | Directory |
   +------+-----------+

   0       /var/lock
   0       /var/run
   4,0K    /var/local
   4,0K    /var/opt
   16K     /var/lost+found
   16K     /var/tmp
   52K     /var/spool
   68K     /var/mail
   11M     /var/backups
   24M     /var/log
   346M    /var/www
   444M    /var/lib
   991M    /var/cache
```

+ **-f | --file**: basically, instead of showing *folders*, **dusage** will show *what files are using space* in current dir
```bash
   dusage -f
```

+ **-tos | --Terms**: displays *Terms of Service* and usage instructions of this program. Must have a look and **accept them**

**Finally**, it is also possible to combine those commands: *you can list* a directory showing **files** in **reverse order**; current dir **in reverse order** and **files**, etc. Just keep in mind some combinations are not possible, like ```dusage -f -h``` or *giving an non-existing path* ```dusage -d /invented/dir/or/path```.
And program is **always** giving a warning that says: *It is higly recommended to run this program as sudo or SuperUser*. This is for avoiding this problem:
   
![ACCESS DENIED](https://raw.githubusercontent.com/Javinator9889/DiskUsage/master/denied.png)

## Terms of Service and Conditions

**dusage  Copyright (C) 2017  Javinator_9889**

This program comes with ABSOLUTELY NO WARRANTY; for details click link below

This is free software, and you are welcome to redistribute it

under certain conditions.

For more information, please click link below: 
https://goo.gl/nAjgpH
