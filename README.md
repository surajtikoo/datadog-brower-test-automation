
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


### **Configuration Files**
1. browser-steps.tfvars

```hcl
steps = [
   {
    name = "Click login link"
    type = "click"
    use_element_locator = false
    params = {
      element = "{\"multiLocator\":{\"ab\":\"/*[local-name()=\\\"html\\\"][1]/*[local-name()=\\\"body\\\"][1]/*[local-name()=\\\"main\\\"][1]/*[local-name()=\\\"div\\\"][1]/*[local-name()=\\\"div\\\"][1]/*[local-name()=\\\"article\\\"][1]/*[local-name()=\\\"form\\\"][1]/*[local-name()=\\\"div\\\"][2]/*[local-name()=\\\"input\\\"][1]\",\"at\":\"/descendant::*[@name=\\\"user[password]\\\" and @type=\\\"password\\\"]\",\"cl\":\"/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" sign-in__form \\\")]/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" form__control \\\")][2]\",\"clt\":\"/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" sign-in__form \\\")]/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" form__control \\\")][2]\",\"co\":\"[{\\\"text\\\":\\\" password \\\",\\\"textType\\\":\\\"innerText\\\"}]\",\"ro\":\"//*[@id=\\\"user[password]\\\"]\"},\"targetOuterHTML\":\"\\u003cinput type=\\\"password\\\" id=\\\"user[password]\\\" name=\\\"user[password]\\\" placeholder=\\\"Password\\\" autocapitalize=\\\"off\\\" autocomplete=\\\"off\\\" autocorrect=\\\"off\\\" spellcheck=\\\"false\\\" required=\\\"\\\" class=\\\"form__control\\\" a\",\"url\":\"https://learn.datadoghq.com/users/sign_in\"}"
      value   = ""
    }
    element_user_locator_key = "no_path"
    
  },
  {
    name                = "Input Username"
    type                = "typeText"
    use_element_locator = true
    params = {
      element    = "{\"multiLocator\":{\"ab\":\"/*[local-name()=\\\"html\\\"][1]/*[local-name()=\\\"body\\\"][1]/*[local-name()=\\\"main\\\"][1]/*[local-name()=\\\"div\\\"][1]/*[local-name()=\\\"div\\\"][1]/*[local-name()=\\\"article\\\"][1]/*[local-name()=\\\"form\\\"][1]/*[local-name()=\\\"div\\\"][1]/*[local-name()=\\\"input\\\"][1]\",\"at\":\"/descendant::*[@name=\\\"user[email]\\\" and @value=\\\"\\\"]\",\"cl\":\"/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" sign-in__form \\\")]/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" form__control \\\")][1]\",\"clt\":\"/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" sign-in__form \\\")]/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" form__control \\\")][1]\",\"co\":\"[{\\\"text\\\":\\\" email \\\",\\\"textType\\\":\\\"innerText\\\"}]\",\"ro\":\"//*[@id=\\\"user[email]\\\"]\"},\"targetOuterHTML\":\"<input type=\\\"email\\\" id=\\\"user[email]\\\" name=\\\"user[email]\\\" value=\\\"\\\" placeholder=\\\"Email\\\" autocapitalize=\\\"off\\\" autocomplete=\\\"off\\\" autocorrect=\\\"off\\\" spellcheck=\\\"false\\\" required=\\\"\\\" class=\\\"form__control\\\" aria\",\"url\":\"https://learn.datadoghq.com/users/sign_in\"}"
      value      = "test@gmail.com" # "{{ USERNAME  }}@gmail.com" replace this with your glbal variable
    }
    element_user_locator_key = "signin_username"
  },
]
```
2. config.tfvars

```hcl
env                        = "dev"
app_name                   = "testapp"
testing_endpoint_url       = "https://XXXXXX.com"
signin_username_xpath      = "//*[@id=\"user[email]\"]"
signin_password_xpath      = "//*[@id=\"user[password]\"]"
signin_button_xpath        = "//*[@id=\"sign_in_bd50597424\"]/div[5]/button"
test_executation_frequency = "86400" // This is miliseconds.It means 1 day
executation_day            = "6"     // This means 5 day
executation_start_time     = "13:30"
executation_end_time       = "13:31"
executation_status         = "live"
executation_time_zone      = "Europe/Amsterdam"

xpaths = {
    no_path         =  ""
    signin_username = "//*[@id='email']"
    signin_password = "//*[@id='password']"
    submit_button   = "//*[@id='submit_button']"
  }
```
---

## **Command to Run**
terraform apply -var-file=config.tfvars -var-file=browser-steps.tfvars -var "datadog_api_key=your_api_key" -var "datadog_app_key=your_app_key"

---

## **Input Variables**
| **Variable**    | **Description**                                    | **Type**    | **Default** | **Required** |
|------------------|----------------------------------------------------|-------------|-------------|--------------|
| `test_name`      | Name of the synthetic browser test.                | `string`    | `null`      | Yes          |
| `env`          | Provide the environment name.                | `string`         | Yes          |
| `signin_username_xpath`      | username xpath.         | `list`      | `["aws:us-east-1"]` | Yes |
| `signin_password_xpath` | signin user xpath.                      | `string`    | `xxxxxx`         | No           |
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

