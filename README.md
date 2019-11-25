# sshd-server
 
A simple Dockerized SSH server, built on top of [official Ubuntu](https://registry.hub.docker.com/_/ubuntu/) `18.04` image.   

The main reason of this container is to give a simple ssh server where you can define a root password and you are ready to go.   
This is of course very insicure if you expose it to the public network, so in that case you can use keys instead.   
This container supports both modes with environment variables (so no need to mount volumes or run commands manually).   


## Environment Variables  
You can use two different environment variables:   

`ROOT_PASSWORD`: Access to this container with a specific password    
`ROOT_PUB_KEY`: Access to this container with keys   

Keep in mind that if `ROOT_PUB_KEY` is enabled, you cannot access with password.    
Both envs are deleted after the start of the container, so it's not possible to read them from inside the container.   

## Run example with ROOT_PASSWORD env

```
$ sudo docker run -d -e ROOT_PASSWORD=test123 --name sshd-server1 -p 123:22 leen15/sshd-server 

$ ssh root@localhost -p 123
root@localhost's password: # The password is `test123`
root@sshd-server1 $
```

## Run example with ROOT_PUB_KEY env

```
$ sudo docker run -d -e ROOT_PUB_KEY="ssh-rsa YOUR-PUBLIC-KEY" --name sshd-server1 -p 123:22 leen15/sshd-server

$ ssh root@localhost -p 123
root@sshd-server1 $ # You are in with your key.
```

## License

This project is released under the terms of the [MIT license](http://en.wikipedia.org/wiki/MIT_License).
