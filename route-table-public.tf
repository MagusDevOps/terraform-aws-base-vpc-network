resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.environment}-public"
  }
}

output "route_table_public_id" {
  value = aws_route_table.public.id
}

resource "aws_route" "public_route_table_igw_ipv6" {
  route_table_id              = aws_route_table.public.id
  gateway_id                  = aws_internet_gateway.internet_gateway.id
  destination_ipv6_cidr_block = "::/0"
}

resource "aws_route" "public_route_table_igw" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.internet_gateway.id
  destination_cidr_block = "0.0.0.0/0"
}