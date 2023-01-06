output "vpc_id" {
  value = aws_vpc.main.id
}
output "app_subnets_ids" {
  value = aws_subnet.app_subnets.*.id
}

output "app_subnets_cidr" {
  value = aws_subnet.app_subnets.*.cidr_block
}