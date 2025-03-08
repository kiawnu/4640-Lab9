packer {

  required_plugins {
    amazon = {
      version = ">= 1.3"
      source  = "github.com/hashicorp/amazon"
    }

    ansible = {
      version = "~> 1"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

source "amazon-ebs" "ubuntu" {
ami_name      = "packer-ansible-nginx"
instance_type = "t2.micro"
region        = "us-west-2"

source_ami_filter {
  filters = {
    # COMPLETE ME complete the "name" argument below to use Ubuntu 24.04
    name                = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250115"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }
  most_recent = true
  owners      = ["099720109477"]
}
  ssh_username = var.ssh_username

}


build {
# COMPLETE ME
# add configuration to: 
# - use the source image specified above
# - use the "ansible" provisioner to run the playbook in the ansible directory
# - use the ssh user-name specified in the "variables.pkr.hcl" file
name = "packer-ansible-nginx"
sources = ["sources.amazon-ebs.ubuntu"]

provisioner "ansible" {

  ansible_env_vars = ["ANSIBLE_HOST_KEY_CHECKING=False"]
  playbook_file = "/home/kiki/BCIT/IT_System_Network_Provisioning/lab9/4640-w9-lab-start-w25/ansible/playbook.yml"
  
 
}

}

