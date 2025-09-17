resource "aws_security_group" "ssh-access" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}