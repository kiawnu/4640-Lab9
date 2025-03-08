# 4640-w9-lab-start-w25
### By Kian Abdollahi, Ernest Law, Ian Macdonald

##### Generating/Importing Key

```
ssh-keygen -t ed25519 -C "lab 9" -f aws

./import_lab_key /home/kiki/.ssh/aws.pub

```

##### Packer commands

```
packer init .
packer validate .
packer build . 


```

##### Terraform commands

```
terraform init
terraform validate 
terrform plan -out plan1
terraform apply 
terraform destroy
