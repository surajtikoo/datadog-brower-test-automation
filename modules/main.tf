##----------------------------------------------------------------------------------##
# Description : This Terraform configuration is designed to facilitate the creation of Datadog Synethic Monitoring,
# This synethic monitoring is created for the web browser testing.
##----------------------------------------------------------------------------------##

# Terraform 0.13+ uses the Terraform Registry:
terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
    }
  }
}

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parent Window</title>
</head>
<body>
    <script>
        // Open the popup window
        const popup = window.open('popup.html', 'PopupWindow', 'width=500,height=400');

        if (popup) {
            // Wait for the popup to load
            setTimeout(() => {
                popup.postMessage({
                    country: 'India',
                    capital: 'New Delhi',
                    population: '1.4 billion'
                }, "*");
            }, 2000); // Adjust delay if needed

            // Close the popup after 5 seconds
            setTimeout(() => {
                popup.close();
                console.log("Popup closed automatically!");
            }, 5000);
        } else {
            console.error("Popup blocked!");
        }
    </script>
</body>
</html>


# Configure the Datadog provider
provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

# Define the steps dynamically using locals
locals {
  step_objects = [
    for step in var.steps : merge(
      step,
      step.use_element_locator ? {
        element_user_locator = {
          type  = "xpath"
          value = lookup(var.xpaths, step.element_user_locator_key, null)
        }
      } : {}
    )
  ]
}

# Example Usage (Synthetics Browser test)
resource "datadog_synthetics_test" "datadog_brower_test" {
  name       = "${var.test_name}-${var.test_name}-synthetic-test"
  type       = "browser"
  status     = var.executation_status
  message    = "Notify @qa"
  device_ids = var.device_ids
  locations  = var.test_execution_region
  tags = concat(
    local.default_static_tags,
    [
      "Name:${var.app_name}-synthetic-test",
      "env:${var.env}"
    ]
  )
  request_definition {
    method = "GET"
    url    = var.testing_endpoint_url
  }
  # Loop over the dynamically created browser steps
  dynamic "browser_step" {
    for_each = local.step_objects
    content {
      type = browser_step.value.type
      name = browser_step.value.name
      params {
        element = browser_step.value.params.element
        value   = browser_step.value.params.value

        dynamic "element_user_locator" {
          for_each = try(browser_step.value.element_user_locator, null) != null ? [browser_step.value.element_user_locator] : []
          content {
            value {
              type  = element_user_locator.value.type
              value = element_user_locator.value.value
            }
          }
        }
      }
    }
  }
  browser_variable {
    name = "PASSWORD"
    type = "global"
    id   = "XXXXXXXXXXXXXXXXXXXXXXXXX" # Store the username in global variables and replace the id which you will get there
  }


  browser_variable {
    name = "USERNAME"
    type = "global"
    id   = "XXXXXXXXXXXXXXXXXXXXXXXXX" # Store the password in global variables and replace the id which you will get there
  }
 
  options_list {
    retry {
      count    = "0"
      interval = "300"
    }

    rum_settings {
      client_token_id = "0"
      is_enabled      = "false"
    }

    scheduling {
      timeframes {
        day  = var.executation_day
        from = var.executation_start_time
        to   = var.executation_end_time
      }

      timezone = var.executation_time_zone
    }

    tick_every = var.test_executation_frequency
  }
}

