# This makefile create and delete apache Pod object
# login_apache and login_ubuntu log in to containers
#
# The Pod includes different kind of functionality related
# to an intrest of a learning.


create:
	# kubectl create -f apache-config.yaml
	kubectl create -f ubuntu-server.yaml
	kubectl create -f web-server-blue.yaml
	kubectl create -f web-server-green.yaml
	kubectl create -f ingress.yaml
	kubectl create -f service-blue.yaml
	kubectl create -f service-green.yaml

delete:
	# kubectl delete Pod apache-config
	kubectl delete Deployment web-server-blue
	kubectl delete Deployment web-server-green
	kubectl delete Deployment ubuntu-server
	kubectl delete Ingress ingress
	kubectl delete Service blue-page
	kubectl delete Service green-page

login_ubuntu:
	kubectl exec -it apache-config --container ubuntu -- \
	/bin/bash

login_apache:
	kubectl exec -it apache-config --container ubuntu -- \
	/bin/bash
