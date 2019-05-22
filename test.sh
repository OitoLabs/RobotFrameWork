#!/bin/bash
result=$(sudo docker logs nocnoc-testsuite | sed -n '/Result-Start/,/Result-End/p')
ip=$(dig +short myip.opendns.com @resolver1.opendns.com)

docker logs nocnoc-testsuite | grep '0 failed'

if [ $? == 0 ]
then
data=":heavy_check_mark: Follow link for more details http://$ip\n"'```'${result}'```'
else
data=":x: Follow link for more details http://$ip\n"'```'${result}'```'
fi

 curl -X POST \
  https://hooks.slack.com/services/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 \
  -H 'Content-Type: application/json' \
  -H 'Postman-Token: 89fd6ee5-58b9-4c41-95b3-e2a2d0b5d2d7' \
  -H 'cache-control: no-cache' \
  -d "{'text': '$data','channel': 'GH0S9UJS3'}"