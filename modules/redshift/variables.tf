variable "cluster_identifier" {
  default     = "redshift-cluster"
  type        = string
  description = "custom name of the cluster"
}

variable "cluster_version" {
  description = "Specify your version of Redshift engine cluster"
  type        = string
  default     = "1.0"
  # Note : This version is applies all the nodes of your version
}

variable "cluster_database_name" {
  description = "The name of the database to create"
  type        = string
  default     = "my_database"
}


variable "cluster_master_username" {
  description = "specify your master username"
  type        = string
  default     = "aws_redshift"
}

variable "cluster_master_password" {
  description = "Specify password for master user"
  type        = string
}

variable "cluster_node_type" {
  description = "specify Node Type of Redshift cluster"
  type        = string
  default     = "dc1.large"
  # Valid Values: dc1.large | dc1.8xlarge | dc2.large | dc2.8xlarge | ds2.xlarge | ds2.8xlarge.
}

variable "cluster_number_of_nodes" {
  description = "Number of nodes in the cluster (values greater than 1 will trigger 'cluster_type' of 'multi-node')"
  type        = number
  default     = 1
}


variable "cluster_port" {
  description = "specify your cluster port"
  type        = number
  default     = 5439
}

variable "publicly_accessible" {
  description = "specify whether the custer publicly_accessible or not"
  type        = bool
  default     = false
  # Note : True is not recomended
}

variable "elastic_ip" {
  description = "The Elastic IP (EIP) address for the cluster." # optional
  type        = string
  default     = null
}
variable "app_name" {
  default = "myapp"
}

variable "ingress" {
  type = map(object({
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = {
    "5439" = {
      cidr_blocks = ["0.0.0.0/0"]
      port        = 5439
      protocol    = "tcp"
    }
  }
}

variable "subnet_ids" {
  description = "choose subnets for deploying redshift cluster"
}
variable "vpc_id" {
  description = "choose vpc id"
}