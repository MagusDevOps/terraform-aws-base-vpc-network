resource "aws_route_table" "no-internet" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.environment}-no-internet"
  }
}

output "route_table_no_internet_id" {
  value = aws_route_table.no-internet.id
}