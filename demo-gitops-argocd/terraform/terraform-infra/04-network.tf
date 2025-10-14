resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags       = var.vpc_tags
}

resource "aws_subnet" "my_public_subnet_a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.availability_zone
  tags              = var.subnet_tags
  depends_on        = [aws_vpc.my_vpc]
}

resource "aws_internet_gateway" "my_igw" {
  tags = var.igw_tags

}

resource "aws_internet_gateway_attachment" "my_igw_attach" {
  vpc_id              = aws_vpc.my_vpc.id
  internet_gateway_id = aws_internet_gateway.my_igw.id
}

resource "aws_route_table" "route_table_a" {
  vpc_id     = aws_vpc.my_vpc.id
  tags       = var.route_table_tags
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