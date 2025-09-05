provider "aws" {
    region = "ap-south-1"
}

data "aws_eks_cluster" "eks" {
    name = var.cluster_name
}

data "aws_eks_cluster_auth" "eks" {
    name = var.cluster_name
}

provider "kubernetes" {
    host = data.aws_eks_cluster.eks.endpoint
    cluster_ca_certificate = 
}