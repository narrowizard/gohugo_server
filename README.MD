## summary
gohugo_server is used for running gohugo http server in the docker container.

## usage

```shell
docker run --name gohugo -p 1313:1313 -v your/path/of/hugo/project:/root/hugo narrowizard/gohugo_server
```