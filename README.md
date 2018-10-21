# SandeepSpan
[![Build Status](https://travis-ci.org/sandeepspan/integrate.svg?branch=master)](https://travis-ci.org/sandeepspan/integrate)

This repository was created with a mindset to have options explored for [travis CI](https://travis-ci.org/) with [Github]([https://github.com/). Intention was to get an environment creted for developer which can be used for speeding up the development activities with minimal involvement of Infrastructure resources.

# Tech
To use this repository ahead one should be aware of below terminologies/Technology stack
  - Travis CI - [Click Here](https://travis-ci.org/)
  - GitHub - [Click Here](https://guides.github.com/activities/hello-world/)
  - Ansible - [Click Here](https://docs.ansible.com/ansible/latest/user_guide/intro_getting_started.html)
  - Ansible Roles [Click Here](https://docs.ansible.com/ansible/2.5/user_guide/playbooks_reuse_roles.html)
  - Molecule [Click Here](https://molecule.readthedocs.io/en/latest/)
  - NodeJs [Click Here](https://nodejs.org/en/docs/guides/getting-started-guide/)
  - Docker [Click Here](https://docs.docker.com/get-started/)

# Installation
###   Getting your CI setup ready
To start using GitHb, make sure
 - You have registered for an account using [Link](https://github.com/join)
 - You create your project using reference  [Link](https://guides.github.com/activities/hello-world/)

To start using Travis CI, make sure you have:
  - A [GitHub](https://github.com/) account.
  - Owner permissions for a project hosted on GitHub Owner Permissions [Link](https://help.github.com/categories/importing-your-projects-to-github).

To get started with Travis CI, you must:
 - Go to Travis-ci.com and Sign up with GitHub.
 - Accept the Authorization of Travis CI. You’ll be redirected to GitHub.
 - Click the green Activate button, and select the repositories you want to use with Travis CI.

Final Step would be to download content of this repo including `.travis.yml` file which is a pre-requisit to get your CI setup functional on [travis CI](https://travis-ci.org/) and [Github]([https://github.com/) using [docker](https://docs.docker.com/get-started/) service.

Once you are through with above all points without errors, your CI setup should be ready for first commit. [ [reference Link](https://gist.github.com/mindplace/b4b094157d7a3be6afd2c96370d39fad) ]

### Getting your development server ready
To get started using your windows machine for development using this repo, go ahead and install these tools:
  - VirtualBox [Link](https://www.virtualbox.org/wiki/Downloads)
  - Vagrant [Link](https://www.vagrantup.com/downloads.html)
  - Mobaxterm (MobaXterm X server and SSH client) [Link](http://mobaxterm.mobatek.net/download.html)
  - centos/7 CentOS Linux 7 x86_64 Vagrant Box [Link](https://atlas.hashicorp.com/centos/boxes/7)

Create your first project folder and call it `C:\dummyproject\`

Modify VirtualBox Default VM path to `C:\virtualbox-images`

set VAGRANT_HOME to same path as `C:\virtualbox-images`

Follow below steps on Windows Command Prompt or Unix Prompt
```
$ pwd
/drives/d/virtualbox-images
$ vagrant init centos/7
$ vagrant up --provider virtualbox
```
Follow below steps on Mobax Term Console or Unix Prompt
```
$ ssh -p 2222 vagrant@127.0.0.1 -i   /drives/d/virtualbox-images/.vagrant/machines/default/virtualbox/private_key
[vagrant@localhost ~]$ sudo yum install git
[vagrant@localhost ~]$ git clone https://github.com/sandeepspan/integrate.git
[vagrant@localhost ~]$ cd integrate
[vagrant@localhost integrate]$ bash -x bootstrap.sh
```
All installation should be completed without errors if you have reached this step. Now its time to use molecule using docker.
```
[vagrant@localhost integrate]$ cd roles/emoji-app
[vagrant@localhost emoji-app]$ sudo molecule test
[vagrant@localhost emoji-app]$ sudo molecule lint
[vagrant@localhost emoji-app]$ sudo molecule converge
[vagrant@localhost emoji-app]$ sudo molecule destroy

```

# Brief explaination
below points can be considered for overall thought process followed for understanding mindset of this case study.
- ansible used here to take advantage on configuration management, application deployment, task automation front.
- vagrant used here to take advantage of opensource cost effective virtualization environment creation for developer
- molecule used here to take advantage of docker based testing of your code base through ansble roles
- goss or flake used here for carrying out infra unit test executions, but yet to get added with proper test cases. 
- developer can utilize molecule effectively on his vagrant box as it has capability to perform execution of deployment and unit testing of deployment using simple yaml based programing similar to one used in ansible.
- on vagrant box developer can simple test deployment using below steps of molecule once deployment and unit test logic is in place in required ansible playbook files
- To perform synatx validations for your code 
```
[vagrant@localhost emoji-app]$ sudo molecule lint
```
- To perform docker creation if not already and then deploying on docker 
```
[vagrant@localhost emoji-app]$ sudo molecule converge
```
- To perform unit test execution on created docker using flake or goss framework 
```
[vagrant@localhost emoji-app]$ sudo molecule verify
```
- To perform docker destroy once all development is completed on your vagrant box 
```
[vagrant@localhost emoji-app]$ sudo molecule destroy
```
- To per end to end exection using molecule, i.e. performing synatx validations --> getting docker created --> deploying on docker --> verifying docker installation --> destroying docker 
```
[vagrant@localhost emoji-app]$ sudo molecule test
```
- Once molecule execution is completed without errors or warnings changes can be committed to REPO to get CI sequence evaluated to get your build GREEN, This saved some efforts of getting into failuer of build due to small small errors which can be detected using molecule based command execution. 

# To Do
If time permits i would like to explore below points to get this case study taken ahead.
- add more detailed deployment steps for Nodejs based application, as i am still learning nodejs usage.
- add more tests to validate deployed application, may be goss/flake or other framework usage for this
- explore other options of free tier of AWS instance usage using available ansible orchestration options
- explore vault like feture of ansible for secrete values storage such as application username/password, AWS access Key/Secrete Key etc in the CI CD flow, may be hashicorp valut or consul
- add monitors using prometheus to get CI based stattistics captured in to centralised prometheus server for future analysis, as i am still learning prometheus usage for metric collection.
- add notification mechanism for CICD success or failuers, may be slack or email notifications
  

# License
----
MIT
