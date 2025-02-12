variable "datadog_api_key" {
  description = "provide the datadog api key"
  type        = string
}
variable "xpaths" {
}
variable "steps" {
}
variable "test_name" {
  description = "provide the test name"
  type        = string
}
variable "datadog_app_key" {
  description = "provide the datadog app key"
  type        = string
}
variable "testing_endpoint_url" {
  description = "provide testing endpoint url"
  type        = string
}
variable "env" {
  description = "provide the environment to deploy the code"
  type        = string
}
variable "app_name" {
  description = "provide the application name"
  type        = string
}
variable "device_ids" {
  description = "List of device IDs"
  type        = list(string)
  default     = ["chrome.laptop_large"]
}
variable "test_execution_region" {
  description = "List of device IDs"
  type        = list(string)
  default     = ["aws:eu-central-1"]
}
variable "signin_username_xpath" {
  description = "username xpath"
  type        = string
}
variable "signin_password_xpath" {
  description = "password x-path"
  type        = string
}
variable "signin_button_xpath" {
  description = "signin-xpath"
  type        = string
}
variable "executation_day" {
  description = "executation of the job"
  type        = number
}
variable "executation_start_time" {
  description = "executation of the job start time"
  type        = string
}
variable "executation_end_time" {
  description = "executation of the job end time"
  type        = string
}
variable "executation_status" {
  description = "executation status"
  type        = string
}
variable "executation_time_zone" {
  description = "executation time zone"
  type        = string
}
variable "test_executation_frequency" {
  description = "executation frequency"
  type        = number
}



