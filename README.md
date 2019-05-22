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
git https://github.com/OitoLabs/RobotFrameWork/
cd RobotFrameWork
```
#### Steps to follow-
```
1. stop the docker container
  "./robot.sh stop-test <pro/qa>"
2. build the docker file  
  "./robot.sh rebuild-test <pro/qa>"
3. start docker container 
  "./robot.sh start-test <pro/qa> <.robot file name or else give . for all>"
  ```
#### Testcase Refrences-
git clone https://github.com/OitoLabs/nocnoc-testcases.git
