#!/bin/bash
robotenv=$(env  | grep robotenv | grep -oe '[^=]*$')
testtarget=$(env  | grep testtarget | grep -oe '[^=]*$')
# testsuite=$(env  | grep testsuite | grep -oe '[^=]*$')
echo "**Setup testing parameter for $robotenv**"
echo "**Testsuite: $testsuite**"
echo "**Test Target: $testtarget**"
echo "Calling script to create virtual display"
chmod +x Scripts/Xvfb.sh
pkill -f Xvfb
sh Scripts/Xvfb.sh start
load_testcases () {
    echo "Loading NocNoc-TestCase"

    if [ ! -d NocNoc-TestCase/.git ]
    then
        git clone "https://github.com/OitoLabs/nocnoc-testcases.git" NocNoc-TestCase
    fi
}

load_testcases
cd NocNoc-TestCase/
git pull
export DISPLAY=:99
echo "Result-Start"
mkdir -p ../nocnoc-report/$testtarget

robot "$testtarget" | tee ../nocnoc-report/output.log

# cp $(find ./ -name "*.html" -o -name "*.log" -o -name "*.xml") ../../"$testsuite"/
cp *.xml *.html *.png ../nocnoc-report/$testtarget
# ls -ltr ../nocnoc-report/$testtarget
echo "Result-End"


result=$(cat /home/robotframework/nocnoc-report/output.log | tr -d \'\")





ip=$(dig +short myip.opendns.com @resolver1.opendns.com)


cat /home/robotframework/nocnoc-report/output.log | grep '| FAIL |'

if [ $? == 0 ]
then
data=":x: Follow link for more details below \n*Report*: http://$ip:8080/$testtarget/report.html\n*Logs*: http://$ip:8080/$testtarget/log.html\n"'```'${result}'```'
else
data=":heavy_check_mark: Follow link for more details below \n*Report*: http://$ip:8080/$testtarget/report.html\n*Logs*: http://$ip:8080/$testtarget/log.html\n"'```'${result}'```'
fi

 curl -X POST \
  https://hooks.slack.com/services/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 \
  -H 'Content-Type: application/json' \
  -H 'Postman-Token: 89fd6ee5-58b9-4c41-95b3-e2a2d0b5d2d7' \
  -H 'cache-control: no-cache' \
  -d "{'text': '$data','channel': 'GH0S9UJS3'}"





