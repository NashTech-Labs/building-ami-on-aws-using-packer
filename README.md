# Building Custom AMI on AWS

####About 

HashiCorp Packer is easy to use and automates the creation of any type of machine image. It embraces modern configuration management by encouraging you to use automated scripts to install and configure the software within your Packer-made images

### Pre-requisite:
- You must have AWS account
- To install Packer, follow this [page](https://learn.hashicorp.com/packer/getting-started/install)


##### Steps to follow in order to build ami on AWS
1. Export variables 
    ```bash
   export AWS_ACCESS_KEY_ID=""
   export AWS_SECRET_ACCESS_KEY=""
   export AWS_DEFAULT_REGION=us-east-1
   ```
1. Run the following commands
    ```bash
    packer build -var-file=demo.json building-ami.json
    ```
   