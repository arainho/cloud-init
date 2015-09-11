# cloud-init
cloud-init samples to launch new services on OpenStack instances

Providing User Data to Instances
```
$ nova boot --image myUbuntuImage --flavor myFlavorOne --user-data mydata.file
```

some extra info
https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux_OpenStack_Platform/4/html/End_User_Guide/user-data.html
