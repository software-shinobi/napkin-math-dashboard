#/bin/sh

##########################################################################
###                                                                    ###
###  Builds and executes the salary calculator docker application      ###
###                                                                    ###
##########################################################################


set -e;


reset;clear;


runningContainerName=paycheck-calculator
containerSourcePort=80
hostTargetPort=9000
containerName=softwareshinobi/paycheck-calculator
containerTag=latest


echo
echo
echo "##########################################################################"
echo "###                                                                    ###"
echo "###  Build the docker image                                            ###"
echo "###                                                                    ###"
echo "##########################################################################"
docker build -t $containerName .


echo
echo
echo "##########################################################################"
echo "###                                                                    ###"
echo "###  List the running Containers (before)                              ###"
echo "###                                                                    ###"
echo "##########################################################################"
docker ps


echo
echo
echo "##########################################################################"
echo "###                                                                    ###"
echo "###  Stop and remove the application specific Container                ###"
echo "###                                                                    ###"
echo "##########################################################################"
{ docker stop $runningContainerName || true; echo "stopped..."; } | tr "\n" " ";echo;
{ docker rm   $runningContainerName || true; echo "removed..."; } | tr "\n" " ";echo;


echo
echo
echo "##########################################################################"
echo "###                                                                    ###"
echo "###  Run the container given the parameters specified above            ###"
echo "###                                                                    ###"
echo "##########################################################################"
docker run -d --name $runningContainerName         \
           -p $hostTargetPort:$containerSourcePort \
              $containerName:$containerTag


echo
echo
echo "##########################################################################"
echo "###                                                                    ###"
echo "###  List the running Containers (after)                               ###"
echo "###                                                                    ###"
echo "##########################################################################"
docker ps


echo
echo
echo "##########################################################################"
echo "###                                                                    ###"
echo "###  Sleep to allow container to start                                 ###"
echo "###                                                                    ###"
echo "##########################################################################"
sleep 10


echo
echo
echo "##########################################################################"
echo "###                                                                    ###"
echo "###  curl the contents of the web application                          ###"
echo "###                                                                    ###"
echo "##########################################################################"
curl http://localhost:$hostTargetPort


echo
echo
echo "##########################################################################"
echo "###                                                                    ###"
echo "###  Open the web application in the firefox web broswer               ###"
echo "###                                                                    ###"
echo "##########################################################################"
firefox http://localhost:$hostTargetPort &


echo
echo
echo "##########################################################################"
echo "###                                                                    ###"
echo "###  Finished                                                          ###"
echo "###                                                                    ###"
echo "##########################################################################"

