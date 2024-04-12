access_key = "AKIA6EMAYEYNUJ5UICEF"
secret_key = "WdFczSeC27znA7RbxfnsJgaJ3uN6VWIrfb1KUaQ"
CORRECT ONE 

#provider.tf 
provider "aws"{
    region = "ap-south-1a"
    access_key = "AKIA6EMAYEYN6WB6YNMM"
    secret_key = "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"
}

#main.tf
resource "aws_instance" "AWSEC2INSTANCE"   {
    ami  = "ami-099b3d23e336c2e83"
    instance_type = "t2.micro"
    security_groups = ["launch-wizard-4"] 
    key_name = "tcsputty"
    tags={
        Name = "terraform server"
    }
}

#main.tf
resource "aws_security_group" "security group creating by tf"{
name = "security group by tf"
description = "this is sg created by automatically through TF"
vpc_id = "vpc-fd74849932"

ingress{
    description = "enabling the inbound rule"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_block = ["0.0.0.0/0"]
      }
}


# correct syntax 
# main.tf
resource "aws_instance" "tfserver" {
  ami             = "ami-0550c2ee59485be53"
  instance_type   = "t3.micro"
  security_groups = ["launch-wizard-1"]
  key_name        = "tf_keypair"
  sensitive       = true
}

#provider.tf
provider "aws" {
  region     = "eu-north-1"
  access_key = "AKIA6EMAYEYNUJ5UICEF"
  secret_key = "WdFczSeEC27znA7RbxfnsJgaJ3uN6VWlrfb1KUaQ"
}

#preconditions 

output "api_base_url" {
  value = "https://${aws_instance.example.private_dns}:8433/"

  # The EC2 instance must have an encrypted root volume.
  precondition {
    condition     = data.aws_ebs_volume.example.encrypted
    error_message = "The server's root volume is not encrypted."
  }
}

#sensitive value 
#Suppressing Values in CLI Output
output "db_password" {
  value       = aws_db_instance.db.password 
  description = "The password for logging in to the database."
  sensitive   = true
}

#dependencies 
#Explicit Output Dependencies
-->Terraform analyzes the value expression for an output value and automatically determines a set of
  dependencies, but in less-common cases there are dependencies that cannot be recognized implicitly.
--> In these rare cases, the depends_on argument can be used to create additional explicit dependencies
    the dependencies of that output value allow Terraform to correctly determine the dependencies between 
    resources defined in different modules

# Dependencies example 

output "instance_ip_addr" {
  value       = aws_instance.server.private_ip
  description = "The private IP address of the main server instance."

  depends_on = [
    # Security group rule must be created before this IP address could
    # actually be used, otherwise the services will be unreachable.
    aws_security_group_rule.local_access,
  ]
}

#fileprovisioner.tf
resource "aws_instance" "instancemsg"
{
  ami = "ami_0jkfjsajojsl"
  instance_type = "t2.micro"
}

provisioner "file"
{
  source = "local/path/to/localfile.txt"
  destination = "/path/on/remote/instance/file.txt"
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("~/.ssh/id.rsa")
  }
}

#remote-exec.tf
resource "aws_instance" "examplemsg"
{
  ami = "ami_830nksdnfksadfjlasj"
  instance_type = "t2.medium"
}
provisioner "remote-exec"{  # installing list of packages
  inline = [
    "sudo yum update -y",
    "sudo yum install -y httpd",
    "sudo systemctl start httpd"
  ]
  connection = {
    type ="ssh"
    user = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host = aws_instance.examplemsg.public_ip
  }
}

#local_exec.tf
resource "null_instance" "example"{
  triggers = {
    always_run = "$(timestamp())"
  }
  provisioner "local_exec"{
    command = "echo 'this is local execution command'"
  }
}

# remotebackend.tf
terraform {
  backend "s3"{
    bucket = "your-teraform-state-bucket"
    key = "path/to/your/terraform.tfstate"
    region = "us-east-1"
    encrypt = "true"
    dynamodb_table = "your-dynamodb-table"
    }
}


I’m going to create a VPC, 1 public subnet, 1 private subnet, 1 Internet gateway, 1 security group and 1 EC2. 
It will be a NGINX in this EC2. In addition, I need to create Custom Route Tables and associate them with subnets. 
All this infrastructure will be in London region

vars.tf --> vars.rf file we use to store varibles of the terraform secipt
variable "aws_region"{
  default = "eu-west-2"
}


provider.tf file we create

provider "aws"{
  region = "$(var.aws_region)"

}

vpc.tf file we create

resource "aws_vpc" "prod_vpc"{
  cidr_block = "10.10.0.0/16"
  enable_dns_support = "true"
  enable_dns_hostsupport = "true"
  enable_classiclink = "false"
  instance_tenancy = "default"
  tags{
    name = "prod_vpc"
  }
}


PUBLIC SUBNET CREATION 
resource "aws_subnet" "prod_subnet_public_1"{
  vpc_id = "$(aws_vpc.prod_vpc.id)"
  cidr_block = "10.10.0.0/16"
  map_public_ip_on_launch = "true"  --> it will becomes a pulbic subnet if we give true
  availabity_zone = "eu_west_2a"
  tags{
    name = "prod_subnet_public_1"
  }
}

create a IGW

resource "aws_internet_gateway" "prod_igw"{
  vpc_id = "$(aws_vpc.prod_vpc_id)"
  tags{
    name = "prod_igw"
  }
}

network.tf
resource "aws_route_table" "prod_public_crt"{
vpc_id = "$(aws_vpc.main_vpc.id)"
route {
  cidr_block ="0.0.0.0/0"  // this subnet can reach any where 
  gateway_id = "$(aws_internet_gateway.prod__igw.id)"
}
tags{
  name = "prod_public_crt"
}
}





