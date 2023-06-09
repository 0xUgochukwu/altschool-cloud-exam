# Altschool Cloud Engineering Exam (Semester 3)

## Overview
A complete CI/CD deployment of two apps to a kubernetes cluster with monitoring and logging using prometheus and grafana.

### Image of all pods running
![Image of all pods running](https://github.com/0xUgochukwu/altschool-cloud-exam/blob/02439018b5b68141575c9138baa95ae19190dc52/pods-list.jpg)

## Prerequisites

Clone the repo by running the following command:
    
    ```git clone https://github.com/0xUgochukwu/altschool-cloud-exam.git```

Then cd into the repo, make sure the host machine you are using has ansible installed, then run the ansible playbook to install all prerequisites needed by the host

    ```ansible-playbook ansible/main.yaml```


Then cd into the terraform folder of the cloned repo and set up the infrastructure using terraform


Once this is successful, you can now use Kubectl and/or Jenkins to deploy the apps 


# ;)
