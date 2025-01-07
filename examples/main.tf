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


// Define the execution date
const executionDate = new Date("2024-10-10");

// Determine the last day of the month, considering only up to the 30th
let lastDayOfMonth = new Date(executionDate.getFullYear(), executionDate.getMonth() + 1, 0);
if (lastDayOfMonth.getDate() > 30) {
    lastDayOfMonth.setDate(30);
}
console.log("Last Date of the Month:", lastDayOfMonth.toDateString());

// Calculate the next invoice date by adding 60 days
const nextInvoiceDate = new Date(lastDayOfMonth);
nextInvoiceDate.setDate(nextInvoiceDate.getDate() + 60);

// Adjust the next invoice date to the 30th if it falls to the 29th
if (nextInvoiceDate.getDate() === 29) {
    nextInvoiceDate.setDate(30);
}
console.log("Next Invoice Date:", nextInvoiceDate.toDateString());



