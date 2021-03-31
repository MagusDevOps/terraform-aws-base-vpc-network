resource "aws_eip" "nat_gateway_eip" {
  count = var.nat_gateway_enabled ? var.nat_gateway_count : 0
  vpc   = true

  tags = {
    Name = "nat-eip-${var.zone_priority[count.index]}"
  }
}