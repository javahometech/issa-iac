locals {
  cluster_type = var.cluster_number_of_nodes > 1 ? "multi-node" : "single-node"
}