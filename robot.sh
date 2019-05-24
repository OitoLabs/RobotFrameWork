#!/bin/bash

CMD="$2_$1"
# testsuite="$3"
testdir="$3"
containername="$5"
servicename="$6"
echo "**Docker Compose $1 for $2**"
echo "**Docker Container $5 for Service $6**"
op="$1"

shift 2

case "${CMD}" in
    pro_start-test)
        docker rm nocnoc-testsuite
        # robotenv=pro  testtarget="${testdir}" docker-compose --name test123 -f docker-compose.yml up
        docker-compose run  -e testtarget="${testdir}" -e testsuite="${testsuite}" -e robotenv="pro" --name "${containername}" -d "${servicename}"
        ;;
    pro_stop-test)
        docker-compose -f docker-compose.yml stop
        docker-compose -f docker-compose.yml rm
        ;;
    pro_rebuild-test)
        docker-compose -f docker-compose.yml build
        ;;
    qa_start-test)
        docker rm -f nocnoc-testsuite
        robotenv=qa  testtarget="${testdir}" docker-compose -f docker-compose.yml up -d
        ;;
    qa_stop-test)
        docker-compose -f docker-compose.yml stop
        docker-compose -f docker-compose.yml rm
        ;;
    qa_rebuild-test)
        docker-compose -f docker-compose.yml build
        ;;
    *)
        echo
        echo "Usage: $0 start-test|stop-test|rebuild-test pro|qa"
        echo
        exit 1
esac


