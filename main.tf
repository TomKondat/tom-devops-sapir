terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

# Create a VPC
resource "aws_vpc" "tom-kondat-dev-vpc" {

  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "tom-kondat-dev-vpc"
  }

}

resource "aws_subnet" "tom-kondat-k8s-subnet" {
  vpc_id     = aws_vpc.tom-kondat-dev-vpc.id
  cidr_block = "10.0.0.0/27"

  tags = {
    Name = "tom-kondat-k8s-subnet"
  }
}
