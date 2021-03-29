resource "aws_nat_gateway" "nat_gateway" {
  count = var.nat_gateway_enabled ? var.nat_gateway_count : 0
  allocation_id = aws_eip.nat_gateway_eip[count.index].id
  subnet_id     = aws_subnet.nat_gateway_subnets[count.index].id

  tags = {
    Name = "nat-gateway"
  }
}

resource "aws_route" "route_private_egress" {
  count = var.nat_gateway_enabled ? 1 : 0
  route_table_id = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat_gateway[0].id
}