variable "tools" {
  default = {
    vault = {
      name = "vault"
      instance_type = "t3.small"
      port_no       = "8200"
    }
  }
}