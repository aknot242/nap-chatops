# NGINX ChatOps Example
This repo features an example of how FluentD and Microsoft Teams can be used to forward log messages from NGINX App Protect to Microsoft Teams for notification purposes.

The FluentD server runs in a docker container. Configure your App Protect logging destination to use syslog with a location of `<your docker host>:5140`.

Build the FluentD Docker container:

```
docker build -t nap-chatops .
```

Start the FluentD Docker container:

```
docker run -d -p 5140:5140 nap-chatops
```