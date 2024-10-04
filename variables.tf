variable "tools" {
  prometheus = {
    instance_type = "t3.small"
    zone_id = "Z09583601MY3QCL7AJKBT"
    record_type = "A"
    env = "dev"
  }
}