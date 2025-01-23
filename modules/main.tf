##----------------------------------------------------------------------------------##
# Description : This Terraform configuration is designed to facilitate the creation of Datadog Synethic Monitoring,
# This synethic monitoring is created for the web browser testing.
##----------------------------------------------------------------------------------##

<html>
<head>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
    <table id="target-table" style="width:100%">
        <tr class="headrow">
            <td data-test="Amount"></td>
            <td data-test="Percentage"></td>
            <td data-test="Item"></td>
            <td data-test="Start Date"></td>
            <td data-test="Quantity"></td>
            <td data-test="Sales Amount"></td>
            <td data-test="Fair"></td>
        </tr>
        <tr class="machine-odd">
            <td class="listexthl" data-test="Amount">100</td>
            <td class="listexthl" data-test="Percentage">10</td>
            <td class="listexthl" data-test="Item">Butter</td>
            <td class="listexthl" data-test="Start Date">10/01/2025</td>
            <td class="listexthl" data-test="Quantity">50</td>
            <td class="listexthl" data-test="Sales Amount">400</td>
            <td class="listexthl" data-test="Fair">500</td>
            <td class="listexthl" data-test="Total Cost">&nbsp</td>
        </tr>
        <tr class="machine-even">
            <td class="listexthl" data-test="Amount">150</td>
            <td class="listexthl" data-test="Percentage">20</td>
            <td class="listexthl" data-test="Item">Rice</td>
            <td class="listexthl" data-test="Start Date">10/02/2026</td>
            <td class="listexthl" data-test="Quantity">150</td>
            <td class="listexthl" data-test="Sales Amount">500</td>
            <td class="listexthl" data-test="Fair">450000</td>
            <td class="listexthl" data-test="Total Cost">2569</td>
        </tr>
    </table>

    <script>
        // Get the table by its ID
        const table = document.getElementById("target-table");

        if (!table) {
            console.error("Table with the specified ID not found.");
            return;
        }

        // Get all rows and filter for those with classes like "machine-odd" or "machine-even"
        const allRows = table.querySelectorAll("tr");
        const rows = Array.from(allRows).filter(row => row.classList.contains('machine-odd') || row.classList.contains('machine-even'));

        console.log("Filtered rows:", rows.length);

        if (rows.length === 0) {
            console.error("No rows with class starting with 'machine-' were found.");
            return;
        }

        // Initialize arrays to store matching and non-matching rows
        const matchingRows = [];
        const nonMatchingRows = [];

        // Iterate over the rows
        rows.forEach(row => {
            const quantity = parseFloat(row.querySelector('[data-test="Quantity"]')?.textContent.trim()) || 0;
            const percentage = parseFloat(row.querySelector('[data-test="Percentage"]')?.textContent.trim()) || 0;
            const fair = parseFloat(row.querySelector('[data-test="Fair"]')?.textContent.trim()) || 0;

            // Calculate the result as quantity * percentage * fair
            const result = quantity * percentage * fair;

            // Compare result with fair
            if (result === fair) {
                matchingRows.push({
                    quantity,
                    percentage,
                    fair,
                    result,
                    rowClass: row.className,
                });
            } else {
                nonMatchingRows.push({
                    quantity,
                    percentage,
                    fair,
                    result,
                    rowClass: row.className,
                });
            }
        });

        // Log results
        console.log("Matching Rows:", matchingRows);
        console.log("Non-Matching Rows:", nonMatchingRows);

        // Store results in localStorage for verification
        localStorage.setItem("matchingRows", JSON.stringify(matchingRows));
        localStorage.setItem("nonMatchingRows", JSON.stringify(nonMatchingRows));

        // Log success message
        console.log("Comparison completed successfully!");
    </script>
</body>
</html>





# Terraform 0.13+ uses the Terraform Registry:
terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
    }
  }
}

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

