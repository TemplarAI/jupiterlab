# jupiterlab

## Build

```
docker build -t owodunni/jupiterlab .
```

## Push

```
docker push owodunni/jupiterlab
```

## Deploy kubernetes

```
microk8s kubectl apply -f jupiterlab-service.yaml -f jupiterlab-deployment.yaml
```