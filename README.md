# dockerfiles

## multiarch
see https://docs.docker.com/build/building/multi-platform/#getting-started for multi-arch builds

`docker buildx create --name mybuilder --bootstrap --use`


## toolbox usage


```
kubectl run --image=defenestration/toolbox  -it -n default toolbox-abrev bash
```
