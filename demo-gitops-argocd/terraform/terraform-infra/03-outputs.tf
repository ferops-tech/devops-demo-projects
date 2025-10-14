output "argocd_url" {
  description = "Direct link to ArgoCD"
  value       = "http://${aws_instance.my_instance_test.public_ip}:30080"
}

output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.my_instance_test.public_ip
}

output "startup_note" {
  description = "Wait notice for the web interface"
  value       = "Wait a few minutes for the application to start and the web UI to be reachable. In the meantime, you can observe the logs with the above command."
}

output "logs_command" {
  description = "Command to see logs"
  value       = "ssh -i ~/.ssh/aws_keypair_test -o IdentitiesOnly=yes ec2-user@${aws_instance.my_instance_test.public_ip} tail -f /var/log/cloud-init-output.log"
}
