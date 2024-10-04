module "tools_monitor" {
  for_each = var.tools
  source = "./module/app"
  component = each.key
  instance_type = each.value["instance_type"]
  zone_id = each.value["zone_id"]
  route_record_type = each.value["record_type"]
  env = each.value["env"]
}