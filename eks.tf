resource "aws_eks_cluster" "pathnex" {
  name     = "Pathnex-Oct-2026"
  role_arn = "arn:aws:iam::756856629061:role/AmazonEKSClusterRole"
  version  = "1.35"

  upgrade_policy {
    support_type = "STANDARD"
  }

  vpc_config {
    subnet_ids = [
      "subnet-0ca21796ee3af2425",
      "subnet-02ab37fec8bce0bd5"
    ]

    security_group_ids = [
      "sg-0a59aa4d020f7b057"
    ]

    endpoint_public_access  = true
    endpoint_private_access = true

    public_access_cidrs = [
      "0.0.0.0/0"
    ]
  }
  zonal_shift_config {
         enabled = false
        }
}
