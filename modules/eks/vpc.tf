#
# VPC Resources

variable "cluster-name" {}
variable "eks-vpc" {}
variable "aws-region" {}

/*
resource "aws_internet_gateway" "eks" {
  vpc_id = "${var.eks-vpc}"

  tags = {
    Name = "${var.cluster-name}-eks-igw"
  }
}
*/

/*
resource "aws_route_table" "eks" {
  vpc_id = "${var.eks-vpc}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.eks.id}"
  }
}
*/

/*
resource "aws_route_table_association" "eks-0" {
  subnet_id      = "${var.eks-subnet-0}"
  route_table_id = "${aws_route_table.eks.id}"
}

resource "aws_route_table_association" "eks-1" {
  subnet_id      = "${var.eks-subnet-1}"
  route_table_id = "${aws_route_table.eks.id}"
}
*/
