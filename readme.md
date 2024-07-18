

# Docker image with the MSSQL integration for New Relic

A stand-alone newrelic infrastructure container with MSSQL integration.

[Microsoft SQL Server monitoring integration | New Relic Documentation](https://docs.newrelic.com/es/docs/infrastructure/host-integrations/host-integrations-list/microsoft-sql/microsoft-sql-server-integration/)

Already built images can be found here:

[davidbcn86/nri-mssql general | Docker Hub](https://hub.docker.com/repository/docker/davidbcn86/nri-mssql/general)

## **Environment variables**

| Name            | Description                         | Default Value |
| --------------- | ----------------------------------- | ------------- |
| MSSQL_HOSTNAME  | Database hostname                   | Empty         |
| MSSQL_USERNAME  | Database username                   | Empty         |
| MSSQL_PASSWORD  | Database password                   | Empty         |
| MSSQL_PORT      | Database port                       | 1433          |
| NRI_LOGLEVEL    | Log level for the NRI agent         | info          |
| NRI_LICENSE_KEY | License key for the NRI integration | Empty         |

To make sure that the inventory and metrics make any sense in NewRelic you need to change the **servername**. You can customize the SERVERNAME using the MSSQL_SERVERNAME env setting in the Windows MSSQL images:

[windowscontainers/sqlserver2022base at master · david-garcia-garcia/windowscontainers (github.com)](https://github.com/david-garcia-garcia/windowscontainers/tree/master/sqlserver2022base)

## Integration configuration and custom queries

The integration configuration file is located at:

```bash
/etc/newrelic-infra/integrations.d/mssql-config.yml
```

See the official documentation on how to extend/improve this integration.
