resource "aws_eks_node_group" "pathnex-NG" {
  cluster_name    = aws_eks_cluster.pathnex.name
  node_group_name = "pathnex-ng"

  node_role_arn = "arn:aws:iam::756856629061:role/AmazonEKSNodeRole"

  subnet_ids = [
    "subnet-0ca21796ee3af2425",
    "subnet-02ab37fec8bce0bd5"
  ]

  version        = "1.35"
  ami_type       = "AL2023_x86_64_STANDARD"
  capacity_type  = "SPOT"
  instance_types = ["t3.small"]
  disk_size      = 20

  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 2
  }

  tags = {
  "k8s.io/cluster-autoscaler/enabled"          = "true"
  "k8s.io/cluster-autoscaler/Pathnex-Oct-2026" = "owned"
  }
  
  lifecycle {
  ignore_changes = [
    scaling_config[0].desired_size
  ]
  }



  update_config {
    max_unavailable = 1
    update_strategy = "DEFAULT"
  }

  remote_access {
    ec2_ssh_key = "GPathnex.pem"

    source_security_group_ids = [
      "sg-0a59aa4d020f7b057"
    ]
  }
}
