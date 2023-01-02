resource "aws_route" "route_to_app_vpc_in_default_vpc" {
  route_table_id            = var.default_vpc_route_table
  destination_cidr_block    = var.vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
}