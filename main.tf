provider "aws" {
    region = var.region-virginia
    alias  = "region-virginia"
}

provider "aws" {
    region = var.region-central
    alias  = "region-central"
}

provider "aws" {
    region = var.region-frankfurt
    alias  = "region-frankfurt"
}