resource "aws_subnet" "transit_gateway_subnets" {
  count = var.transit_gateway_attachment_enabled ? length(local.zones_keys) : 0
  cidr_block = cidrsubnet(var.aws_cidr_map["transit_gateway"], 4, count.index)
  availability_zone_id = var.zones[var.zone_priority[count.index]]["id"]
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "transit-gateway-${local.zones_keys[count.index]}"
  }
}

resource "aws_route_table_association" "transit_gateway_subnet_association" {
  count = var.transit_gateway_attachment_enabled ? length(local.zones_keys) : 0
  route_table_id = aws_route_table.public.id
  subnet_id = aws_subnet.transit_gateway_subnets[count.index].id
}