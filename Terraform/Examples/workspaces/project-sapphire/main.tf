#OBS: FIRST CREATE A 3 WORKSPACES (us-payroll, uk-payroll, india-payroll)
module "payroll_app" {
    source = "../modules/payroll-app"
    app_region = lookup(var.region, terraform.workspace)
    ami = lookup(var.ami, terraform.workspace)
}