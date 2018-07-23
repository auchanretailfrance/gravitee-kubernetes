# Gravitee Helm Chart

## Chart Details

This chart will deploy the following:

- Gravitee UI
- Gravitee API
- Gravitee Gateway

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install --name my-release gravitee
```

## Configuration

The following tables list the configurable parameters of the Gravitee chart and their default values.


### Shared configuration

To configure common functionalities such as:
- chaos testing (see
    [chaoskube](https://github.com/kubernetes/charts/tree/master/stable/chaoskube)
    chart)

| Parameter                  | Description              | Default          |
| -------------------------- | -------------------------| -----------------|
| `chaos.enabled`            | Enable Chaos test        | false            |

- configuration database (see
    [mongodb-replicaset](https://github.com/kubernetes/charts/tree/master/stable/mongodb-replicaset)
    chart)

| Parameter                  | Description                | Default                |
| -------------------------- | ---------------------------| -----------------------|
| `mongodb.hosts`            | MongoDB hosts and ports    | mongo1.my.domain:27017 |
| `mongodb.dbname`           | MongoDB database name      | gravitee               |
| `mongodb.username`         | MongoDB username           | ""                     |
| `mongodb.password`         | MongoDB password           | ""                     |
| `mongodb.options`          | MongoDB additional options | []                     |

- logs database (see [elastichsearch](https://github.com/kubernetes/charts/tree/master/incubator/elasticsearch)
    chart)

| Parameter                  | Description                   | Default                |
| -------------------------- | ------------------------------| -----------------------|
| `elasticsearch.endpoints`  | Elasticsearch hosts and ports | es01.my.domain:9200    |
| `elasticsearch.cluster`    | Elasticsearch cluster name    | ""                     |
| `elasticsearch.index`      | Elasticsearch index name      | ""                     |
| `elasticsearch.username`   | Elasticsearch username        | ""                     |
| `elasticsearch.password`   | Elasticsearch password        | ""                     |



### Gravitee UI

| Parameter                  | Description              | Default          |
| -------------------------- | -------------------------| -----------------|
| `ui.name`                  | UI service name          | `ui`             |

### Gravitee API

| Parameter             | Description       | Default   |
|-----------------------|-------------------|-----------|
| `api.name`            | API service name  | `api`     |

### Gravitee Gateway

| Parameter                    | Description                      | Default        |
| -----------------------      | ---------------------------------| ---------------|
| `gateway.name`               | Gateway service name             | `gateway`      |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f values.yaml gravitee
```

> **Tip**: You can use the default [values.yaml](values.yaml)
