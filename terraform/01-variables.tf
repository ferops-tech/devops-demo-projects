# -----------------------------------------------------------------------------
# 01-variables.tf
# Default values for all configurable parameters in this Terraform project.
# Modify these values only if you want to change the defaults.
# -----------------------------------------------------------------------------
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "availability_zone" {
  description = "The availability zone for the subnet"
  type        = string
  default     = "eu-west-3a"
}

variable "key_pair_public_path" {
  description = "Path to the public key for AWS key pair"
  type        = string
  default     = ".ssh-terraform/aws_keypair_test.pub"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-01324cca1b7747b52"
}

variable "private_ip" {
  description = "Private IP of the EC2 instance"
  type        = string
  default     = "10.0.0.10"
}

variable "vpc_tags" {
  description = "Tags for the VPC"
  type        = map(string)
  default     = { Name = "my-vpc-test" }
}

variable "subnet_tags" {
  description = "Tags for the subnet"
  type        = map(string)
  default     = { Name = "public-subnet-a" }
}

variable "igw_tags" {
  description = "Tags for the Internet Gateway"
  type        = map(string)
  default     = { Name = "main" }
}

variable "route_table_tags" {
  description = "Tags for the Route Table"
  type        = map(string)
  default     = { Name = "route-table-a" }
}

variable "instance_tags" {
  description = "Tags for the EC2 instance"
  type        = map(string)
  default = {
    Name        = "my-server-test"
    Description = "A basic instance for testing purpose"
  }
}

variable "security_group_name" {
  description = "Name for the security group"
  type        = string
  default     = "accesses-to-ec2"
}

variable "security_group_description" {
  description = "Description for the security group"
  type        = string
  default     = "Allows accesses to internal machines from the Internet"
}

variable "root_volume_size" {
  description = "Size of the root EBS volume in GB"
  type        = number
  default     = 25
}

variable "root_volume_type" {
  description = "Type of the root EBS volume (gp3, gp2, io1, etc.)"
  type        = string
  default     = "gp3"
}

variable "root_volume_delete_on_termination" {
  description = "Whether to delete the root volume when the instance is terminated"
  type        = bool
  default     = true
}

variable "user_data_script" {
  description = "Bootstrap script for the EC2 instance"
  type        = string
  default     = "" # Default is empty; provide script via 02-terraform.tfvars (e.g., file("startup.sh"))
}