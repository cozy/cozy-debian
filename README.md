## Cozy Debian

It is the repository of the Debian files require to build the Debian package of Cozy. 
This package is available on Debian repository of Cozy: debian.cozycloud.cc

## Usage

You need **Debian 8 Jessie (stable)** in order to proceed to theses steps.

```
root@debian-8:~# lsb_release -c
Codename:     jessie
```

If `lsb_release` is not installed, you are probably on a too old version of
Debian. You can see which version like this:

```
root@debian-8:~# cat /etc/debian_version
8.1
```

### Install Instructions

Make sure that `ca-certificates` and `apt-transport-https` are properly installed

```
apt-get install ca-certificates apt-transport-https
```

Import the repository public key
 
```
wget -O - https://debian.cozycloud.cc/cozy.gpg.key 2>/dev/null | apt-key add -
```

Optionally check that the imported key is valid

```
apt-key --keyring /etc/apt/trusted.gpg finger
```

You should read:

```
pub   2048R/2765B235 2014-11-17 [expires: 2016-11-17]
      Key fingerprint = E28C F8B2 ABBF E285 743B  27F1 BCB2 ED5D 2765 B235
uid                  Cozy Debian Packaging <debian-packaging@cozycloud.cc>
sub   2048R/D58A9D35 2014-11-17 [expires: 2016-11-17]
```

Add the Cozy repository to your software sources

```
echo 'deb [arch=amd64] https://debian.cozycloud.cc/debian jessie main' \
> /etc/apt/sources.list.d/cozy.list
```

Install Cozy

```
apt-get update
apt-get install cozy
```
    
Start Nginx service

```
service nginx start
```

Register your Cozy account and enjoy!

```
https://your-cozy-IP/
```

## What is Cozy?

![Cozy Logo](https://raw.github.com/cozy/cozy-setup/gh-pages/assets/images/happycloud.png)

[Cozy](http://cozy.io) is a platform that brings all your web services in the
same private space.  With it, your web apps and your devices can share data
easily, providing you
with a new experience. You can install Cozy on your own hardware where no one
profiles you. 

## Community 

You can reach the Cozy Community by:

* Chatting with us on IRC #cozycloud on irc.freenode.net
* Posting on our [Forum](https://forum.cozy.io/)
* Posting issues on the [Github repos](https://github.com/cozy/)
* Mentioning us on [Twitter](http://twitter.com/mycozycloud)

