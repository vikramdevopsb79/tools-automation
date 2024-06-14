variable "instance_type" {}
variable "name" {}
variable "port_no" {}
variable "policy_actions" {}
variable "dummy_policy" {
  default = ["ec2:DescribeInstanceTypes"]
}