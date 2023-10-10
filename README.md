# Magellanic Platform - Helm Deployment - Alpha Version

Zero Trust Machine Identity and Access Control with Configuration Management and MultiCloud Access Control.

[Drop us the message](https://www.linkedin.com/company/magellanic), [email](mailto:contact@magellanic.ai) or [visit our website](www.magellanic.ai).

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

### Global values

| Name               | Description                                                            | Value |
| ------------------ | ---------------------------------------------------------------------- | ----- |
| `imageRegistry`    | Image registry for all images                                          | `""`  |
| `imagePullSecrets` | Name of Kubernetes secret to use as credentials to Docker Registry     | `""`  |
| `nameOverride`     | String to partially override template (will maintain the release name) | `""`  |
| `fullnameOverride` | String to fully override template                                      | `""`  |

### Ingress"

| Name                  | Description                                                                                                                      | Value                |
| --------------------- | -------------------------------------------------------------------------------------------------------------------------------- | -------------------- |
| `ingress.name`        | Name of the Ingress                                                                                                              | `magellanic-ingress` |
| `ingress.enabled`     | Enable or Disable Ingress                                                                                                        | `false`              |
| `ingress.class`       | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+)                                                    | `""`                 |
| `ingress.annotations` | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                 |
| `ingress.hosts`       | An array with hostname(s) to be covered with the ingress record                                                                  | `[]`                 |

### Magellanic Core

| Name                                    | Description                                                                      | Value                 |
| --------------------------------------- | -------------------------------------------------------------------------------- | --------------------- |
| `magellanic.replicas`                   | Number of Magellanic Core replicas                                               | `1`                   |
| `magellanic.restartPolicy`              | Restart policy for Magellanic Core                                               | `Always`              |
| `magellanic.jobRestartPolicy`           | Restart strategy for init and migration job                                      | `OnFailure`           |
| `magellanic.labels.app`                 | App name of Magellanic Core                                                      | `magellanic-core`     |
| `magellanic.labels.env`                 | Environment name of Magellanic Core                                              | `prod`                |
| `magellanic.image.name`                 | Name of the image in the registry                                                | `magellanic-backend`  |
| `magellanic.image.tag`                  | Tag of the image                                                                 | `1.2.0`               |
| `magellanic.image.pullPolicy`           | Init container load-dags image pull policy                                       | `Always`              |
| `magellanic.podAnnotations`             | Add extra annotations to the pods                                                | `{}`                  |
| `magellanic.podLabels`                  | Add extra labels to the pods                                                     | `{}`                  |
| `magellanic.volumes`                    | Optionally specify extra list of additional volumes for the Magellanic Core      | `{}`                  |
| `magellanic.volumeMounts`               | Optionally specify extra list of additional volumeMounts for the Magellanic Core | `{}`                  |
| `magellanic.serviceAccount.enabled`     | Enable creation of ServiceAccount                                                | `false`               |
| `magellanic.serviceAccount.annotations` | Additional custom annotations for the ServiceAccount                             | `{}`                  |
| `magellanic.customEnv`                  | Environment Variables for Magellanic Core                                        | `[]`                  |
| `magellanic.services`                   | Primary service configuration                                                    | `[]`                  |
| `magellanic.sessionAffinity`            | Session Affinity for Kubernetes service, can be "None" or "ClientIP"             | `None`                |
| `magellanic.type`                       | Kubernetes Service type                                                          | `ClusterIP`           |
| `magellanicFrontend.enabled`            | Enable Magellanic Web Panel                                                      | `true`                |
| `magellanicFrontend.replicas`           | Number of Magellanic Web Panel replicas                                          | `1`                   |
| `magellanicFrontend.image.name`         | Name of the image in the registry                                                | `magellanic-frontend` |
| `magellanicFrontend.image.tag`          | Tag of the image                                                                 | `1.1.1`               |
| `magellanicFrontend.image.pullPolicy`   | Init container load-dags image pull policy                                       | `IfNotPresent`        |
| `magellanicFrontend.labels.app`         | App name of Magellanic Web Panel                                                 | `magellanic-web-core` |
| `magellanicFrontend.labels.env`         | Environment name of Magellanic Web Panel                                         | `prod`                |
| `magellanicFrontend.customEnv`          | Environment Variables for Magellanic Web Panel                                   | `[]`                  |
| `magellanicFrontend.services`           | Primary service configuration for Magellanic Web Panel                           | `[]`                  |
| `magellanicFrontend.sessionAffinity`    | Session Affinity for Kubernetes service, can be "None" or "ClientIP"             | `None`                |
| `magellanicFrontend.type`               | Kubernetes Service type                                                          | `ClusterIP`           |

### Magellanic Admin

| Name                               | Description                                                          | Value                 |
| ---------------------------------- | -------------------------------------------------------------------- | --------------------- |
| `magellanicAdmin.enabled`          | Enable Magellanic Admin                                              | `true`                |
| `magellanicAdmin.replicas`         | Number of Magellanic Admin replicas                                  | `1`                   |
| `magellanicAdmin.image.name`       | Name of the image in the registry                                    | `magellanic-admin`    |
| `magellanicAdmin.image.tag`        | Tag of the image                                                     | `0.9.2`               |
| `magellanicAdmin.image.pullPolicy` | Init container load-dags image pull policy                           | `IfNotPresent`        |
| `magellanicAdmin.labels.app`       | App name of Magellanic Web Panel                                     | `magellanic-web-core` |
| `magellanicAdmin.labels.env`       | Environment name of Magellanic Web Panel                             | `prod`                |
| `magellanicAdmin.customEnv`        | Environment Variables for Magellanic Web Panel                       | `[]`                  |
| `magellanicAdmin.services`         | Primary service configuration for Magellanic Admin                   | `[]`                  |
| `magellanicAdmin.sessionAffinity`  | Session Affinity for Kubernetes service, can be "None" or "ClientIP" | `None`                |
| `magellanicAdmin.type`             | Kubernetes Service type                                              | `ClusterIP`           |

### Magellanic Remote

| Name                               | Description                          | Value                 |
| ---------------------------------- | ------------------------------------ | --------------------- |
| `guacd.enabled`                    | Enable remote access with Magellanic | `false`               |
| `guacd.replicaCount`               | Number of Magellanic Remote replicas | `1`                   |
| `guacd.guacd.image.repository`     | Number of Magellanic Remote replicas | `magellanic-services` |
| `guacd.guacd.image.tag`            | Number of Magellanic Remote replicas | `mgld-15.3`           |
| `guacd.guacd.image.pullPolicy`     | Number of Magellanic Remote replicas | `IfNotPresent`        |
| `guacd.serviceAccount.create`      | Create Service Account               | `false`               |
| `guacd.serviceAccount.name`        | Name of Service Account              | `""`                  |
| `guacd.podSecurityContext.fsGroup` | Group ID for the pod                 | `2000`                |
| `guacd.securityContext`            | Enable security context              | `{}`                  |
| `guacd.service.type`               | Kubernetes Service type              | `ClusterIP`           |
| `guacd.service.port`               | Kubernetes Service port              | `80`                  |
| `guacd.resources.limits`           | resource limits                      | `{}`                  |
| `guacd.resources.requests`         | resource requests                    | `{}`                  |
| `guacd.nodeSelector`               | Node labels for pods assignment      | `[]`                  |
| `guacd.tolerations`                | Tolerations for pods assignment      | `[]`                  |
| `guacd.affinity`                   | Affinity for pods assignment         | `{}`                  |

### Magellanic Persistence Volume for Ledger

| Name                        | Description                                                                             | Value               |
| --------------------------- | --------------------------------------------------------------------------------------- | ------------------- |
| `persistence.enabled`       | Create volume for Magellanic                                                            | `false`             |
| `persistence.existingClaim` | Name of an existing PVC to use                                                          | `""`                |
| `persistence.storageClass`  | PVC Storage Class for Magellanic                                                        | `""`                |
| `persistence.accessModes`   | PVC Access Mode                                                                         | `["ReadWriteOnce"]` |
| `persistence.size`          | PVC Storage Request                                                                     | `20Gi`              |
| `persistence.selector`      | Selector to match an existing Persistent Volume (this value is evaluated as a template) | `{}`                |

### Neo4J

| Name            | Description                           | Value   |
| --------------- | ------------------------------------- | ------- |
| `neo4j.enabled` | Enable or disable Kubernetes database | `false` |
| `neo4j.values`  | Values for metadata deployment        | `[]`    |

### Redis

| Name            | Description                           | Value   |
| --------------- | ------------------------------------- | ------- |
| `redis.enabled` | Enable or disable Kubernetes database | `false` |
| `redis.values`  | Values for metadata deployment        | `[]`    |

### Metadata - Postgres

| Name               | Description                           | Value   |
| ------------------ | ------------------------------------- | ------- |
| `metadata.enabled` | Enable or disable Kubernetes database | `false` |
| `metadata.values`  | Values for metadata deployment        | `[]`    |

...