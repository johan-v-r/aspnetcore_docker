# .Net Core & Docker (for Windows)
.NET Core is the modular and high performance implementation of .NET for creating web applications and services that run on Windows, Linux and Mac. It is open source and it can share the same code with .NET Framework and Xamarin apps.

## .Net Core SDK & CLI Install Options:
* [Chocolatey](https://chocolatey.org/packages/dotnetcore)
* [Windows Installer](https://www.microsoft.com/net/core#windowscmd)

## Docker
Docker for Windows requires 64bit Windows 10 Pro, Enterprise and Education (1511 November update, Build 10586 or later) and Microsoft Hyper-V.
* [Chocolatey](https://chocolatey.org/packages/docker-for-windows/17.3.0.10296)
* [Windows Installer](https://docs.docker.com/docker-for-windows/install/#download-docker-for-windows)

## VS Code Extensions
* C# for Visual Studio Code (powered by OmniSharp)
* Docker Support for Visual Studio Code
* .NET Core Project Manager (Nuget)


# App Scaffold

By default, `dotnet new` will create a clean _Hello World_ console app.  
Run `dotnet new -all` to see all available templates.

Scaffold an ASP.NET Core Web API by running `dotnet new webapi`

Create package with `dotnet publish -c release -o app`

# Docker Container

## Create a [Dockerfile](https://docs.docker.com/engine/reference/builder/)
In VS Code, open the Command Palette (`F1`) and select _Docker: Add docker files to workspace_, select _.Net Core_ and select your port.

Alter the file to accommodate your app.

```
FROM microsoft/aspnetcore
LABEL Name=johanvr/aspnetcore_docker Version=0.0.1 
ARG source=./app
EXPOSE 5000
COPY $source ./app
WORKDIR /app
ENTRYPOINT dotnet aspnetcore_docker.dll
```

## Build Docker Image

Select _Docker: Build Image_ from VS Code commands, or from a shell run `docker build -t myappname .`

## Run Docker Image

Start an instance of the app and map the ports to expose on the machine
```
docker run -p 5000:5000 johanvr/aspnetcore_docker
```

See a list of running docker image instances with `docker ps`.  
Stop an instance by `docker kill id` (id = _CONTAINER ID_ or random name assigned to instance by docker)

# References
* https://docs.microsoft.com/en-us/dotnet/articles/core/tools/dotnet
* https://github.com/dotnet/dotnet-docker
* https://github.com/aspnet/aspnet-docker/issues/192