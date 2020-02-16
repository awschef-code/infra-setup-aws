# infra-setup-aws

Create your Infra using Terraform and Docker 

For other reasons I created Docker image from Apline, we could use the image provided by Hashicorp. 

Change the Entrypoint in docker-compose.yml to apply terraform 

### Add AWS credentails to Environment file

`cp aws.env.example aws.env`

Add your real AWS Keys 

### Format your Terraform Code

`docker pull ranjithka/terraform:0.12.17`

`./manage.sh fmt`

`./manage.sh init`

`./manage.sh plan` &&  `./manage.sh apply`


### Key Pair module

Writing Private key in State file is not recomended. Insert the Public key and create key pair in AWS. 

### Docker-compose 

Created docker compose for CI/CD purpose. To execute

`docker-compose up`  - This will initialize and complete the plan 
