# NGINX App Protect WAF ChatOps Example
This repo features an example of how [Fluentd](https://www.fluentd.org/) and [Microsoft Teams](https://www.microsoft.com/en-us/microsoft-teams/group-chat-software) can be used to forward log messages from [NGINX App Protect WAF](https://www.nginx.com/products/nginx-app-protect/) to Microsoft Teams for notification purposes.

The Fluentd service runs in a docker container. Configure your NGINX App Protect logging destination to use syslog with a location of `<your docker host>:5140`.

[Generate an Incoming Webhook](https://docs.microsoft.com/en-us/microsoftteams/platform/webhooks-and-connectors/how-to/add-incoming-webhook) for a desired channel in Microsoft Teams.

Edit the `fluent.conf` file and insert your Teams Webhook URL where designated at the `webhook_url` setting.

Build the Fluentd Docker container:

```
docker build -t nap-chatops .
```

Start the Fluentd Docker container:

```
docker run -d -p 5140:5140 nap-chatops
```
