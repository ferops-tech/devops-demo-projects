resource "aws_key_pair" "keypair_test" {
  public_key = file(var.key_pair_public_path)
}