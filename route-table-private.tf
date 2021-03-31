resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.environment}-private"
  }
}

output "route_table_private_id" {
  value = aws_route_table.private.id
}

resource "aws_route" "private_route_table_eigw" {
  route_table_id = aws_route_table.private.id
  destination_ipv6_cidr_block = "::/0"
  egress_only_gateway_id = aws_egress_only_internet_gateway.egress.id
}