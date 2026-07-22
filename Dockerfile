FROM jenkins/jenkins:2.452.1-lts
USER root
RUN apt-get update && apt-get install -y lsb-release

# Install Docker CLI (optional, in case we want docker inside docker, but here we just need standard Jenkins)
# We will drop down to jenkins user
USER jenkins

# Disable setup wizard
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# Copy plugins.txt and install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

# Copy CasC configuration
ENV CASC_JENKINS_CONFIG=/var/jenkins_home/casc.yaml
COPY casc.yaml /var/jenkins_home/casc.yaml
