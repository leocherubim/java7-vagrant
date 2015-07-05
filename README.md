# VAGRANT + Java 7 + Tomcat 8
This project consists of a single vagrant box with shell script provisioning for Java development environment and DevOps.

In this box, are present:

- Git
- Heroku-Toolbelt
- PostgreSQL 9
- MySQL 5
- Java 7
- Tomcat 8
- Maven 3

All variables environment are configured (JAVA_HOME, CATALINA_HOME, M2_REPO).
To startup CATALINA_HOME:

$ CATALINA_HOME/bin/startup.sh

And to shutdown:

$ CATALINA_HOME/bin/shutdown.sh

To compile maven:

$ mvn compile
