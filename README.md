---
modeline: " vim: set spell spl=en: "
tags: cool, repository, dude, OS
---

# Vagrant
Cool repository for setting up a virtual machine.

## Instructions
Just be a cool dude and run:

```{bash}
$ ./build.sh
```

...in the root directory of this repository! It will install itself in
`~/os_root/vagrant`, clone the
[OS repository](https://github.uio.no/INF3151-V2019/karlhto_fm) and create a
correctly set up a vagrant box.

## Running the vagrant box
Change directory to `~/os_root/vagrant` and just run:

```{bash}
$ vagrant ssh
```

If your vagrant instance for any reason should go down, do:

```{bash}
$ vagrant up dev
```
