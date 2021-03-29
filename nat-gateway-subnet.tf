resource "aws_subnet" "nat_gateway_subnets" {
  count = var.nat_gateway_enabled ? length(local.zones_keys) : 0
  cidr_block = cidrsubnet(var.aws_cidr_map["nat_gateway"], 4, count.index)
  availability_zone_id = var.zones[var.zone_priority[count.index]]["id"]
  vpc_id = aws_vpc.network_hub_vpc.id

  tags = {
    Name = "nat-gateway-public-${local.zones_keys[count.index]}"
  }
}

resource "aws_route_table_association" "nat_gateway_subnet_route_table" {
  count = var.nat_gateway_enabled ? length(aws_subnet.nat_gateway_subnets) : 0
  route_table_id = aws_route_table.public.id
  subnet_id = aws_subnet.nat_gateway_subnets[count.index].id
}