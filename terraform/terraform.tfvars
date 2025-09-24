# -----------------------------------------------------------------------------
# terraform.tfvars
# Your environment-specific variable overrides.
# Terraform will automatically load this file to override defaults from variables.tf.
# Keep this file private and do NOT commit it to GitHub if it contains sensitive data.
# -----------------------------------------------------------------------------
vpc_cidr      = "10.1.0.0/16"
public_subnet_cidr = "10.1.0.0/24"
availability_zone = "eu-west-3b"
instance_type = "t3.small"
private_ip    = "10.1.0.10"

root_volume_size = 30
root_volume_type = "gp3"
root_volume_delete_on_termination = true