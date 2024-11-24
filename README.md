
# **Datadog Synthetic Browser Test Terraform Module**

## **Overview**
This Terraform module simplifies the creation of Datadog Synthetic Browser Tests by dynamically generating all required steps based on user input. The module focuses on defining test steps, locations, and parameters, reducing repetitive configuration and making test creation faster and more efficient.

---

## **Features**
- Dynamically generates steps for browser tests.
- Scalable and reusable for multiple test configurations.
- Easy integration with existing Terraform workflows.
- Supports exporting and reusing tests created via the Datadog console.

---

## **Challenges**
One of the known challenges is defining the `element` attribute for browser test steps. Datadog's Terraform documentation lacks clear guidance on constructing this attribute. This needs to be improved in future.  

### **Workaround**
To handle this, follow these steps:
1. **Create Tests in the Datadog Console**  
   Use the console to identify and configure the required elements for your test.

2. **Export Configuration via Terraformer**  
   Export the created test using [Terraformer](https://github.com/GoogleCloudPlatform/terraformer) to extract accurate definitions for the `element` attribute.

3. **Use Exported Configuration**  
   Take the exported structure and use it as an input for this module, ensuring your `element` attributes are correctly defined.

---

## **Getting Started**

### **Prerequisites**
- Install [Terraform](https://www.terraform.io/downloads) (version >= 1.3.0).
- Set up Datadog API and Application keys as environment variables:
  ```bash
  export DATADOG_API_KEY="your_api_key"
  export DATADOG_APP_KEY="your_app_key"
  ```

---

### **Usage Example**
Here’s how to use the module:

```hcl
module "browser_test" {
  source                     = "../modules"
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
```

---

## **Input Variables**
| **Variable**    | **Description**                                    | **Type**    | **Default** | **Required** |
|------------------|----------------------------------------------------|-------------|-------------|--------------|
| `test_name`      | Name of the synthetic browser test.                | `string`    | `null`      | Yes          |
| `steps`          | List of steps for the browser test.                | `list(map)` | `[]`        | Yes          |
| `locations`      | List of Datadog locations to run the test.         | `list`      | `["aws:us-east-1"]` | Yes |
| `retry_attempts` | Number of retries on failure.                      | `number`    | `2`         | No           |
| `tags`           | Tags for the synthetic test.                       | `list`      | `[]`        | No           |

---

### **Step Configuration**
Each step in the `steps` variable should include:
- `name`: The name of the step (e.g., "Open Homepage").
- `type`: The type of step (e.g., `navigate`, `typeText`, `click`).
- Additional step-specific parameters like `url`, `target`, and `value`.

---

## **Outputs**
| **Output**          | **Description**                                    |
|----------------------|----------------------------------------------------|
| `test_id`            | The ID of the created synthetic browser test.      |
| `test_public_url`    | The public URL of the browser test in Datadog.     |

---

## **Best Practices**
1. Use the Datadog console to identify complex elements, then export configurations via Terraformer.
2. Group related tests using tags (e.g., `environment`, `team`).
3. Regularly review test steps for accuracy as application structures change.

