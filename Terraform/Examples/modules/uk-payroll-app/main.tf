module "us_payroll" {
  source     = "../payroll-app"
  app_region = "eu-west-2"
  ami        = ""
}