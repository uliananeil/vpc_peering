#Initiate Peering connection request
resource "aws_vpc_peering_connection" "virginia-central" {
    provider = aws.region-virginia
    peer_vpc_id = aws_vpc.vpc-central.id
    vpc_id = aws_vpc.vpc-virginia.id
    #auto_accept = true
    peer_region = var.region-central
}

resource "aws_vpc_peering_connection" "central-frankfurt" {
    provider = aws.region-central
    peer_vpc_id = aws_vpc.vpc-frankfurt.id
    vpc_id = aws_vpc.vpc-central.id
    #auto_accept = true
    peer_region = var.region-frankfurt
}

resource "aws_vpc_peering_connection" "frankfurt-virginia" {
    provider = aws.region-frankfurt
    peer_vpc_id = aws_vpc.vpc-virginia.id
    vpc_id = aws_vpc.vpc-frankfurt.id
    #auto_accept = true
    peer_region = var.region-virginia
}

#Accept VPC peering request
resource "aws_vpc_peering_connection_accepter" "central-accepter" {
    provider = aws.region-central
    vpc_peering_connection_id = aws_vpc_peering_connection.virginia-central.id
    auto_accept = true
}

resource "aws_vpc_peering_connection_accepter" "frankfurt-accepter" {
    provider = aws.region-frankfurt
    vpc_peering_connection_id = aws_vpc_peering_connection.central-frankfurt.id
    auto_accept = true
}

resource "aws_vpc_peering_connection_accepter" "virginia-accepter" {
    provider = aws.region-virginia
    vpc_peering_connection_id = aws_vpc_peering_connection.frankfurt-virginia.id
    auto_accept = true
}