resource "aws_instance" "my_instance_test" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  private_ip                  = var.private_ip
  subnet_id                   = aws_subnet.my_public_subnet_a.id
  key_name                    = aws_key_pair.keypair_test.key_name
  vpc_security_group_ids      = [aws_security_group.accesses.id]
  tags                        = var.instance_tags
  depends_on                  = [aws_internet_gateway.my_igw]
  user_data                   = <<-EOF
                                #!/bin/bash
                                dnf -y install dnf-plugins-core git
                                dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
                                dnf install -y docker-ce docker-ce-cli containerd.io
                                mkdir -p /etc/docker
                                cat <<CONFIG > /etc/docker/daemon.json
                                {
                                    "iptables": false
                                }
                                CONFIG
                                systemctl enable --now docker
                                docker network create --driver bridge devops-playground
                                docker run -d -p 8080:5000 --network devops-playground --name flask-app feropstech/flask-app:latest
                                EOF

}