module "frontend" {
  source = "module/frontend-app"

  min_size = 1
  max_size = 3
}
