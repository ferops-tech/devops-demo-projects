resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my-vpc-test"
  }
}
resource "aws_subnet" "my_public_subnet_a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "public-subnet-a"
  }
}
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "route_table_a" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "route-table-a"
  }
  depends_on = [aws_internet_gateway.my_igw]
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.route_table_a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_igw.id
}

resource "aws_route_table_association" "route_table_association" {
  subnet_id      = aws_subnet.my_public_subnet_a.id
  route_table_id = aws_route_table.route_table_a.id
}

resource "aws_key_pair" "keypair_test" {
  public_key = file(".ssh-terraform/keypair-test.pub")
}
resource "aws_security_group" "ssh-access" {
  name        = "ssh-access"
  description = "Allows SSH access to machines on the Internet"
  vpc_id      = aws_vpc.my_vpc.id
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "my_instance_test" {
  ami                         = "ami-09621783a4144ea60"
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  private_ip                  = "10.0.0.10"
  subnet_id                   = aws_subnet.my_public_subnet_a.id
  tags = {
    Name        = "my-server-test"
    Description = "A basic instance for testing purpose"
  }
  key_name               = aws_key_pair.keypair_test.key_name
  vpc_security_group_ids = [aws_security_group.ssh-access.id]
  depends_on             = [aws_internet_gateway.my_igw]
}
