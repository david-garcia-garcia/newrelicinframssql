#!/bin/bash
set -eo pipefail

rm -f /var/run/newrelic-infra/newrelic-infra.pid

echo "Configuring /etc/newrelic-infra/integrations.d/mssql-config.yml from environment"

HOSTNAME=${MSSQL_HOSTNAME}
USERNAME=${MSSQL_USERNAME}
PASSWORD=${MSSQL_PASSWORD}
PORT=${MSSQL_PORT}

sed -i "s/\${HOSTNAME}/$HOSTNAME/" /etc/newrelic-infra/integrations.d/mssql-config.yml
sed -i "s/\${USERNAME}/$USERNAME/" /etc/newrelic-infra/integrations.d/mssql-config.yml
sed -i "s/\${PASSWORD}/$PASSWORD/" /etc/newrelic-infra/integrations.d/mssql-config.yml
sed -i "s/\${PORT}/$PORT/" /etc/newrelic-infra/integrations.d/mssql-config.yml

: "${NRI_LABEL_ENVIRONMENT:=info}"
: "${NRI_LABEL_ROLE:=info}"
: "${NRI_LABEL_SERVER:=info}"

sed -i "s/\${NRI_LABEL_ENVIRONMENT}/$NRI_LABEL_ENVIRONMENT/" /etc/newrelic-infra/integrations.d/mssql-config.yml
sed -i "s/\${NRI_LABEL_ROLE}/$NRI_LABEL_ROLE/" /etc/newrelic-infra/integrations.d/mssql-config.yml
sed -i "s/\${NRI_LABEL_SERVER}/$NRI_LABEL_SERVER/" /etc/newrelic-infra/integrations.d/mssql-config.yml

echo "Configuring /etc/newrelic-infra.yml from environment"

: "${NRI_LOGLEVEL:=info}"

sed -i "s/\${LOGLEVEL}/$NRI_LOGLEVEL/" /etc/newrelic-infra.yml
sed -i "s/\${NRI_LICENSE_KEY}/$NRI_LICENSE_KEY/" /etc/newrelic-infra.yml

echo "Starting newrelic-infra as a foreground process"

exec /usr/bin/newrelic-infra