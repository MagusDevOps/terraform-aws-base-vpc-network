resource "aws_route_table" "no-internet" {
  vpc_id = aws_vpc.network_hub_vpc.id

  tags = {
    Name = "${var.environment}-no-internet"
  }
}

output "route_table_no_internet_id" {
  value = aws_route_table.no-internet.id
}