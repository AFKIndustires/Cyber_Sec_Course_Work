## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

Git_hub-AFKIndustries\Cyber_Sec_Course_Work\Azure\Diagrams\VNet_map_diagram.draw.io

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to recreate the entire deployment pictured above. ELK stack and Filebeat&Metricbeat setup YAML files have been created setperatly for ease of use,
Git_hub-AFKIndustries\Cyber_Sec_Course_Work\Azure\Ansible\ELK_stack_setup.yml
Git_hub-AFKIndustries\Cyber_Sec_Course_Work\Azure\Ansible\Install_Filebeat-Metricbeat.yml



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
| Jump Box | Yes                 | 10.0.0.1 10.0.0.2    |
|          |                     |                      |
|          |                     |                      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?_

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- ...
- ...

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_

We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _____ file to _____.
- Update the _____ file to include...
- Run the playbook, and navigate to ____ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._