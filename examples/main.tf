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

// Format the output as MM/DD/YYYY
let formattedDate = (nextInvoice.getMonth() + 1).toString().padStart(2, '0') + "/" +
                    nextInvoice.getDate().toString().padStart(2, '0') + "/" +
                    nextInvoice.getFullYear();

console.error("Next Invoice Date:", formattedDate);

