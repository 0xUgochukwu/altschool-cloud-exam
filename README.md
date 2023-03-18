# Altschool Cloud Engineering Exam (Semester 3)

## Overview
A complete CI/CD deployment of two apps to a kubernetes cluster with monitoring using prometheus and grafana.

### Image of all pods running
![Image of all pods running]('https://github.com/0xUgochukwu/altschool-cloud-exam/blob/main/pods-list.jpg')

## Prerequisites

Clone the repo by running the following command:
    
    ```git clone https://github.com/0xUgochukwu/altschool-cloud-exam.git```

Then cd into the repo, make sure the host machine you are using has ansible installed, then run the ansible playbook to install all prerequisites needed by the host

    ```ansible-playbook ansible/main.yaml```

Then use Kubectl to deploy the apps and run the Jenkinsfile to set up monitoring with prometheus and grafana