resource "aws_vpc" "vpc" {
  cidr_block                       = var.aws_vpc_cidr
  assign_generated_ipv6_cidr_block = true

  tags = {
    Name = var.environment
  }
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_arn" {
  value = aws_vpc.vpc.arn
}

output "ipv6_block" {
  value = aws_vpc.vpc.ipv6_cidr_block
}