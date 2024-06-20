variable "tools" {
  default = {
    vault = {
      name = "vault"
      instance_type = "t3.small"
      port_no       = ["8200"]
      policy_actions = []
    }
    prometheus = {
      name          = "prometheus"
      instance_type = "t3.small"
      port_no       = ["9090", "9093", "9094"]
      policy_actions = [
        "ec2:DescribeInstances",
        "ec2:DescribeAvailabilityZones"
      ]
    }
   grafana = {
     name = "grafana"
     instance_type = "t3.small"
     port_no = ["3000"]
     policy_actions = []
   }
  elk = {
    name          = "elk"
    instance_type = "r7a.large"
    port_no = {
      kibana   = 80
      logstash = 5044
    }
    policy_actions = []
  }
  }
}