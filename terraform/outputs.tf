output "public_ip" {
  value = aws_instance.my_instance_test.public_ip
}

output "private_ip" {
  value = aws_instance.my_instance_test.private_ip
}
