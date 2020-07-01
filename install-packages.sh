#!/bin/bash

echo "installing kubectl"

KUBECTL_BIN=kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/$KUBECTL_BIN
chmod +x ${KUBECTL_BIN}
sudo mv ${KUBECTL_BIN} /usr/local/bin/${KUBECTL_BIN}

echo "installing terraform"

TERRAFORM_ZIP_FILE=terraform_0.12.9_linux_amd64.zip
TERRAFORM=https://releases.hashicorp.com/terraform/0.12.9
TERRAFORM_BIN=terraform
wget ${TERRAFORM}/${TERRAFORM_ZIP_FILE}
sudo apt install unzip
unzip ${TERRAFORM_ZIP_FILE}
sudo mv ${TERRAFORM_BIN} /usr/local/bin/${TERRAFORM_BIN}
rm -rf ${TERRAFORM_ZIP_FILE}

echo "installing helm"

curl -O https://get.helm.sh/helm-v2.16.1-linux-amd64.tar.gz
tar -zxvf helm-v2.16.1-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
rm -rf helm-v2.16.1-linux-amd64.tar.gz
rm -rf linux-amd64/

echo "installing aws-iam-authenticator"

curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator
curl -o aws-iam-authenticator.sha256 https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator.sha256
openssl sha1 -sha256 aws-iam-authenticator
chmod +x ./aws-iam-authenticator
mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc