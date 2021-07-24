resource "aws_redshift_cluster" "my_redshift_cluster" {
  cluster_identifier     = "${var.app_name}-${terraform.workspace}-cluster"
  database_name          = var.cluster_database_name
  master_username        = var.cluster_master_username
  master_password        = var.cluster_master_password
  node_type              = var.cluster_node_type
  cluster_type           = local.cluster_type
  number_of_nodes        = var.cluster_number_of_nodes
  cluster_version        = var.cluster_version
  port                   = var.cluster_port
  publicly_accessible    = var.publicly_accessible
  elastic_ip             = var.elastic_ip
  vpc_security_group_ids = aws_security_group.redshift_sg.id
}
resource "aws_redshift_subnet_group" "subnet_group" {
  name       = "${var.app_name}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    environment = terraform.workspace
  }
}
resource "aws_security_group" "redshift_sg" {
  name        = "${var.app_name}-${terraform.workspace}-cluster-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress
    content {
      description = "opening port ${ingress.value.port} for redshift"
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.app_name}-${terraform.workspace}-cluster-sg"
  }
}