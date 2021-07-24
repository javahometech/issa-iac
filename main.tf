# module "my_s3_bucket" {
#   source            = "./module/s3"
#   bucket_name       = "my_s3_custom_bucket"
#   enabled           = true
#   create            = true
#   acl               = "private"
#   storage_class     = "STANDARD_IA"
#   lifecycle_enabled = true
# }

module "networking" {
  source = "./modules/networking"
}

# TODO Redshift
# IAM role for the cluster
# S3 bucket for logging

module "redshift_cluster" {
  source                  = "./modules/redshift"
  cluster_identifier      = "myapp"
  cluster_database_name   = "mydb"
  cluster_master_password = "Admin4321"
  cluster_master_username = "myappadmin"
  cluster_node_type       = "dc1.large"
  cluster_number_of_nodes = "1"
  cluster_version         = 1
  cluster_port            = 5439
  publicly_accessible     = false
  elastic_ip              = null
  subnet_ids              = module.networking.pub_sub_ids
  vpc_id                  = module.networking.vpc_id
}

