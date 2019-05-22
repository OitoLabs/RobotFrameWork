# Robotframework Test Automation

This repo is for running the test cases written in robotframework script using Dockerfile and virtual enviornment

## Getting Started

To start with this repo you should have docker installed in your local machine for development and testing purposes. 
### Prerequisites

1. Docker
2. Docker-Compose

```
Steps to follow
```
Usages:
```
git clone https://github.hpe.com/amar-khan/robotframework.git
cd robotframework
```
#### Steps to follow-
```
1. stop the docker container
  "./robot.sh stop-test <pro/itg>"
2. build the docker file  
  "./robot.sh rebuild-test <pro/itg>"
3. start docker container 
  "./robot.sh start-test <pro/itg> <.robot file name or else give . for all>"
  ```
#### Testcase Refrences-
https://github.hpe.com/amar-khan/ctf-selenium
