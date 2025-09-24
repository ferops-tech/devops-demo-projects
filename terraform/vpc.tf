resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags       = var.vpc_tags
}

resource "aws_subnet" "my_public_subnet_a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.availability_zone
  tags              = var.subnet_tags
  depends_on = [aws_vpc.my_vpc]
}

resource "aws_internet_gateway" "my_igw" {
  tags   = var.igw_tags

}

resource "aws_internet_gateway_attachment" "my_igw_attach" {
  vpc_id              = aws_vpc.my_vpc.id
  internet_gateway_id = aws_internet_gateway.my_igw.id
}
