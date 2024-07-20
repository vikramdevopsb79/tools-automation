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
  ci-server = {
    name          = "ci-server"
    instance_type = "t3.small"
    port_no = {}
    policy_actions = [
      "ecr:*",
      "eks:DescribeCluster"
    ]
    }
    sonarqube = {
      name = "sonarqube"
      instance_type = "r7a.large"
      port_no = {
        sonarqube = "9000"
      }
      policy_actions = []
    }
  }
}

#policy actions are added to the role to provide the resources access for ec2 instances this added because service discovery need to communicate with AWS
# 9093 for alert manager , 9094 for nginx exporter