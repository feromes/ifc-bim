# IFC Bim Basic Environment

Very basic test environmente to deal with IFCfiles / OpenBIM
Sometimes is hard to get start with programming, this repository aimed to let this tasks easier, providing a minimal software environment to get start deling with IFCFiles.

## How to use it

You must having Docker isntalled on your computer. For more information visit [Docker WebSite](https://docs.docker.com/docker-for-windows/install/)

Now you can run the command:

```
docker run -p 8888:8888 feromes/ifc-bim
```

If evertything works fine you should be able to click in a link showed in command line to open your jupyter notebook instance running on port 8888

## Get access to your own files

Of course you want to create and deal with your files, but when you shutdown your containner everthing will go :(

But we can mapping a folder to work with inside our containner, just mounting our volume when start the containner, like that?

```
docker run -p 8888:8888 -v c:\Users:/root/users feromes/ifc-bim
```

Remember to change `c:\Users` with your folder. And you have to be able to share files already, [check this documentation out](https://docs.microsoft.com/en-us/visualstudio/containers/troubleshooting-docker-errors?view=vs-2019) in order to get well.

