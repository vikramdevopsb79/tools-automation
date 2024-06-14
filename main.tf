module "main" {
  for_each = var.tools
  source   = "./module"
  name  = each.value["name"]
  instance_type = each.value["instance_type"]
  port_no       = each.value["port_no"]
  policy_actions = each.value["policy_actions"]
}