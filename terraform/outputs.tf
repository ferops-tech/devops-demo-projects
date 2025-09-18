output "app_url" {
  description = "Direct link to the app running on the port defined in the bootstrap:"
  value       = "http://${aws_instance.my_instance_test.public_ip}:8080"
}

output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.my_instance_test.public_ip
}

output "instance_private_ip" {
  value = aws_instance.my_instance_test.private_ip
}

output "startup_note" {
  description = "Wait notice for the web interface"
  value       = "Wait a few minutes for the application to start and the web interface to become reachable."
}
