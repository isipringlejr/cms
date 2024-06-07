# Use the official Jenkins image as the base image
FROM jenkins/jenkins:latest

# Switch to root user to install packages
USER root

# Install necessary packages and AWS CLI
RUN apt-get update && \
    apt-get install -y curl unzip && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

# Clean up
RUN rm -rf awscliv2.zip aws

# Switch back to the Jenkins user
USER jenkins

# Expose the Jenkins port
EXPOSE 8080
