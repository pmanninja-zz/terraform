module "frontend" {
  source = "module/frontend-app"

  min_size = 10
  max_size = 20
}