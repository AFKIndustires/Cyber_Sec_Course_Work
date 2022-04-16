## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

[Network Diagram]Azure\Diagrams\VNet_map_diagram.draw.io

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to recreate the entire deployment pictured above. ELK stack and Filebeat&Metricbeat setup YAML files have been created setperatly for ease of use,

[ELK stack setup YAML file]Azure\Ansible\ELK_stack_setup.yml

[Filebeat & Metribeat install YAML file]Azure\Ansible\Install_Filebeat-Metricbeat.yml



This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting connections to the network.
Load Balancing can mitigate against DDOS (Distributed Denial Of Service) attacks by shifting attack traffic away from the production network.
Coupled with a securely configured jump box provisioner running ansible, this allows sysadmins highly a secure and easy means to configure the systems.
Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.
Filebeat is installed on the host machines and configured in order to export log data to elastic search which we can later view and analyze in Kibiana.
Metricbeat is also used on all of the host VM's, it exports statistics and metrics data about the operating system as well as system services, in this example we have both the Elasticsearch and Kibana modules configured.  

The configuration details of each machine may be found below.

| Name            | Function                   | IP Address | Operating System    |
|-----------------|----------------------------|------------|---------------------|
| Jump Box        | Gateway                    | 10.0.0.4   | Ubuntu Server 18.04 |
| Web 1           | Web Server                 | 10.0.0.5   | Ubuntu Server 18.04 |
| Web 2           | Web Server                 | 10.0.0.6   | Ubuntu Server 18.04 |
| Web 3           | Web Server                 | 10.0.0.7   | Ubuntu Server 18.04 |
| ELK Stack       | Data/log/stats analysis    | 10.1.0.4	| Ubuntu Server 18.04 |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Host Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
*private - personal home use public IP address'

Web Server machines within the network can only be accessed by the ansible docker container found on the jump host provisioner.

The ELK Server VM allows SSH connections via pre-configured key only (ansible container from jump host provisioner), and access from my personal private IP address over https in order to view Kibana Dashboard

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | Personal public IP   |
| Web 1    | Yes                 | Only Via LoadBalancer|
| Web 2    | Yes                 | Only Via LoadBalancer|
| Web 3    | Yes                 | Only Via LoadBalancer|
| ELK stack| Yes                 | 10.0.0.4             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because;
- This allows us to easily scale up if needed with consistent results.
- This also allows us to configure in a different environment very quickly, all that is required is some small changes to the config file to update IP's and passwords to suit the new environment.
- If required the machine can be destroyed and rebuilt very quickly with minimal effort.

The playbook implements the following tasks:
- Installs docker.io and configures some basic settings.
- Installs Python3 language using the pip module.
- Installs Docker module using pip module.
- Config changes to increase virtual memory.
- Downloads ELK container.
- Configures ports for ELK to use.
- Configures systemd to start Docker on boot.


The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Docker ps example](https://github.com/AFKIndustires/Cyber_Sec_Course_Work/blob/main/Azure_ELK-stack/Images/Docker_ps-ELK_stack.jpg)
					
					
### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web 1  - 10.0.0.5
- Web 22 - 10.0.0.6
- Web 3  - 10.0.0.7

We have installed the following Beats on these machines:
- All 3 Webservers have Filebeat and Metricbeat installed for monitoring

These Beats allow us to collect the following information from each machine:
- Metricbeat collects system metrics and statistics and forwards the info to the ELK stack for monitoring.
- Filebeat collects the pre specified system and file logs and forwards onto the ELK stack for monitoring.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:

### Filebeat
- Copy the 'Filebeat_config.yml' file to /etc/ansible/roles/files.
- Update the 'Filebeat_config.yml' file to include the ELK_stack private ip address on lines 1106 and 1806.
- Dont run the playbook just yet, Filebeat and Metricbeat playbook installs both programs at the same time, continue with steps below.

### Metricbeat
- Copy the 'Metricbeat_config.yml' file to /etc/ansible/roles/files.
- Update the 'Metricbeat_config.yml' file to include the ELK_stack private ip address on lines 62 and 96.
- Run the playbook, and navigate to http://20.213.48.129:5601/ to check that the installation worked as expected.


