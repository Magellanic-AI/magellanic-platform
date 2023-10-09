# Magellanic Platform

Zero Trust Machine Identity and Access Control with Configuration Management

## Image

## Docker Compose

### Usage

```bash
MAGELLANIC_IMAGE_REGISTRY=REGISTRY_URL docker compose up -d
```

### Configuration

## Helm

### Usage

```bash
export NAMESPACE=magellanic
helm -n $NAMESPACE upgrade --install magellanic-platform \
  . -f values.yaml
```

### Values
