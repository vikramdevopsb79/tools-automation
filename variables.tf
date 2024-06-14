variable "tools" {
  default = {
    vault = {
      name = "vault"
      instance_type = "t3.small"
      port_no       = "8200"
      policy_actions = []
    }
    prometheus = {
      name          = "prometheus"
      instance_type = "t3.small"
      port_no       = "9090"
      policy_actions = [
        "ec2:DescribeInstances",
        "ec2:DescribeAvailabilityZones"
      ]
    }
  }
}