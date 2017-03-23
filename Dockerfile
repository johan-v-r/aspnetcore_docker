
FROM microsoft/aspnetcore
LABEL Name=johanvr/aspnetcore_docker Version=0.0.1 
ARG source=./app
EXPOSE 5000
COPY $source ./app
WORKDIR /app
ENTRYPOINT dotnet aspnetcore_docker.dll
