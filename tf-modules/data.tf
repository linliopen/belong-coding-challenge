# The AWS availability zones
data "aws_availability_zones" "available" {
  filter {
    name   = "zone-name"
    values = ["*2a*", "*2b*", "*2c*"]
  }
}

# The AWS region currently being used.
data "aws_region" "current" {}

# The AWS account id
data "aws_caller_identity" "current" {}

# The AWS partition (commercial or govcloud)
data "aws_partition" "current" {}
