resource "aws_vpc" "vpc-virginia" {
    provider = aws.region-virginia
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "vpc-virginia"
    }
}

resource "aws_vpc" "vpc-central" {
    provider = aws.region-central
    cidr_block = "10.1.0.0/16"
    tags = {
        Name = "vpc-central"
    }
}

resource "aws_vpc" "vpc-frankfurt" {
    provider = aws.region-frankfurt
    cidr_block = "10.2.0.0/16"
    tags = {
        Name = "vpc-frankfurt"
    }
}