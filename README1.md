## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![MonashBootCamp\Diagrams\project1.drawio or MonashBootCamp\Diagrams\prject1 Diagram.pdf]

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the project1.drawio file may be used to install only certain pieces of it, such as Filebeat.

  - _MonashBootCamp\Ansible\filebeat-config.yml_

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting public to the network.
- _TODO: What aspect of security do load balancers protect?  the system from DDoS attacks by shifting attack traffic. 
What is the advantage of a jump box? The advantage of a jump box is to give access to the user from a single node that can be secured and monitored.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log and system like Apache.
- _TODO: What does Filebeat watch for?_ Logs
- _TODO: What does Metricbeat record?_ Metricbeat helps you monitor your servers by collecting metrics from the system and services running on the server, such as: Apache.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| Red-Web-1|Web Server| 10.0.0.5   | Linux            |
| Red-Web-2|Web Server| 10.0.0.6   | Linux            |
| Red-Web-3|Web Server| 10.0.0.7   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _220.240.146.61_

Machines within the network can only be accessed by Virtual Network.
- _TODO: Which machine did you allow to access your ELK VM? answer is Jump Box, What was its IP address? public 220.240.146.61 or Virtual net(internal) 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses                                 |
|----------|---------------------|------------------------------------------------------|
| Jump Box | Yes                 | port 22/TCP Allow from 220.240.146.61 to any         |
| Jump Box | Yes                 | Port 22/TCP Allow from 10.0.0.4 to Virtual net       |
|          |                     |                      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible? Very simple to set up and use, No special coding skills are necessary to use, fully automated. 

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- ... 
created the VM using Linux.
install the docker container
configure the ansible playbook
copy ansible .yml file to /etc/ansible folder in the jump box.
configure and insert todo things in the .yml files.
check for the sytax error in the .yml files.  
ran the filebeat.yml and meltricbeat.yml files.

- ...

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _10.0.0.5,10.0.0.6,10.0.0.7

We have installed the following Beats on these machines:
- _filebeat and metricbeat.

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._
Filebeat is a lightweight shipper for forwarding and centralizing log data. Installed as an agent on jump box server contrainer, Filebeat monitors the log files from Red-Web servers, collects log events and forwards them to Elasticsearch for indexing.
Metricbeat takes the metrics and statistics that it collects and ships them to the output that we specify, such as Elasticsearch. Metricbeat helps us to monitor our Red-Web servers by collecting metrics from the system and services running on the Red-Web servers, such as: Apache.
### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _____ file to _____.
- Update the _____ file to include...
- Run the playbook, and navigate to Red-Web Servers (via loadbalancer external IP) to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? .yml files are playbook. Where do you copy it? to the /etc/ansibile in the docker container. 
- _Which file do you update to make Ansible run the playbook on a specific machine? ansible.yml
 How do I specify which machine to install the ELK server on versus which to install Filebeat on? in the .yml file we specify the IP address of the server we need to run. we install filebeat on ELK server.
- _Which URL do you navigate to in order to check that the ELK server is running? ELK server public IP address, in my case it is 

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
the host group(s) to which the command should apply (in this case, all)

the inventory (-i, the device or devices to target - without the trailing comma -i points to an inventory file)

the connection method (-c, the method for connecting and executing ansible)

the user (-u, the username for the SSH connection)

the SSH connection method (-k, please prompt for the password)

the module (-m, the Ansible module to run, using the fully qualified collection name (FQCN))

an extra variable ( -e, in this case, setting the network OS value)