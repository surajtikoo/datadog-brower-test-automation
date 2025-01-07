module "browser_test" {
  source                     = "../modules"
  test_name                  = var.test_name
  executation_time_zone      = var.executation_time_zone
  executation_status         = var.executation_status
  executation_start_time     = var.executation_start_time
  executation_end_time       = var.executation_end_time
  test_executation_frequency = var.test_executation_frequency
  signin_button_xpath        = var.signin_button_xpath
  signin_username_xpath      = var.signin_username_xpath
  signin_password_xpath      = var.signin_password_xpath
  testing_endpoint_url       = var.testing_endpoint_url
  app_name                   = var.app_name
  executation_day            = var.executation_day
  env                        = var.env
  steps                      = var.steps
  xpaths                     = var.xpaths
  datadog_api_key            = "" 
  datadog_app_key            = ""

}

const executionDate = new Date("2024-12-05");
let lastDay = new Date(executionDate.getFullYear(), executionDate.getMonth() + 1, 0);
lastDay.setDate(lastDay.getDate() > 30 ? 30 : lastDay.getDate());
let nextInvoice = new Date(lastDay);
nextInvoice.setDate(nextInvoice.getDate() + 60);
if (nextInvoice.getMonth() === 1) nextInvoice.setDate(new Date(nextInvoice.getFullYear(), 2, 0).getDate());
else nextInvoice.setDate(30);
console.error("Next Invoice Date:", nextInvoice.toDateString());

