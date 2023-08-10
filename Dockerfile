FROM python:latest

# Install Ansible
RUN pip install ansible

# Set the working directory
WORKDIR /ansible

# Copy the playbook and inventory files to the container
COPY playbook.yaml inventory.ini ./
