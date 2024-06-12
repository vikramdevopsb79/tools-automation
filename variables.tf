variable "tools" {
  default = {
    valut = {
      name = "vault"
      instance_type = "t3.small"
      port_no       = "8200"
    }
  }
}