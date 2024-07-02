# Random string resource
resource "random_string" "myrandom" {
  length = 16
  upper = false
  special = false
}