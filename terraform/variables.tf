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
  default     = ".ssh-terraform/keypair-test.pub"
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
