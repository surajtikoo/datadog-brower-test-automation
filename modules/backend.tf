terraform {
  backend "local" {
    path = "./terraform.tfstate" # This defines where your state file will be stored
  }
}