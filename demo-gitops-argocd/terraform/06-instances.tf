resource "aws_key_pair" "keypair_test" {
  public_key = file(var.key_pair_public_path)
}

resource "aws_instance" "my_instance_test" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  private_ip                  = var.private_ip
  subnet_id                   = aws_subnet.my_public_subnet_a.id
  key_name                    = aws_key_pair.keypair_test.key_name
  vpc_security_group_ids      = [aws_security_group.accesses.id]
  tags                        = var.instance_tags
  user_data                   = file("bootstrap/startup.sh")

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    delete_on_termination = var.root_volume_delete_on_termination
  }

  depends_on = [
    aws_subnet.my_public_subnet_a,
    aws_internet_gateway.my_igw,
    aws_route_table_association.route_table_association,
    aws_security_group.accesses,
    aws_key_pair.keypair_test
  ]
}