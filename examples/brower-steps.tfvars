steps = [
   {
    name = "Click login link"
    type = "click"
    use_element_locator = false
    params = {
      element = "{\"multiLocator\":{\"ab\":\"/*[local-name()=\\\"html\\\"][1]/*[local-name()=\\\"body\\\"][1]/*[local-name()=\\\"main\\\"][1]/*[local-name()=\\\"div\\\"][1]/*[local-name()=\\\"div\\\"][1]/*[local-name()=\\\"article\\\"][1]/*[local-name()=\\\"form\\\"][1]/*[local-name()=\\\"div\\\"][2]/*[local-name()=\\\"input\\\"][1]\",\"at\":\"/descendant::*[@name=\\\"user[password]\\\" and @type=\\\"password\\\"]\",\"cl\":\"/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" sign-in__form \\\")]/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" form__control \\\")][2]\",\"clt\":\"/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" sign-in__form \\\")]/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" form__control \\\")][2]\",\"co\":\"[{\\\"text\\\":\\\" password \\\",\\\"textType\\\":\\\"innerText\\\"}]\",\"ro\":\"//*[@id=\\\"user[password]\\\"]\"},\"targetOuterHTML\":\"\\u003cinput type=\\\"password\\\" id=\\\"user[password]\\\" name=\\\"user[password]\\\" placeholder=\\\"Password\\\" autocapitalize=\\\"off\\\" autocomplete=\\\"off\\\" autocorrect=\\\"off\\\" spellcheck=\\\"false\\\" required=\\\"\\\" class=\\\"form__control\\\" a\"}"
      value   = ""
    }
    element_user_locator_key = "no_path"
    
  },
  {
    name                = "Input Username"
    type                = "typeText"
    use_element_locator = true
    params = {
      element    = "{\"multiLocator\":{\"ab\":\"/*[local-name()=\\\"html\\\"][1]/*[local-name()=\\\"body\\\"][1]/*[local-name()=\\\"main\\\"][1]/*[local-name()=\\\"div\\\"][1]/*[local-name()=\\\"div\\\"][1]/*[local-name()=\\\"article\\\"][1]/*[local-name()=\\\"form\\\"][1]/*[local-name()=\\\"div\\\"][1]/*[local-name()=\\\"input\\\"][1]\",\"at\":\"/descendant::*[@name=\\\"user[email]\\\" and @value=\\\"\\\"]\",\"cl\":\"/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" sign-in__form \\\")]/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" form__control \\\")][1]\",\"clt\":\"/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" sign-in__form \\\")]/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" form__control \\\")][1]\",\"co\":\"[{\\\"text\\\":\\\" email \\\",\\\"textType\\\":\\\"innerText\\\"}]\",\"ro\":\"//*[@id=\\\"user[email]\\\"]\"},\"targetOuterHTML\":\"<input type=\\\"email\\\" id=\\\"user[email]\\\" name=\\\"user[email]\\\" value=\\\"\\\" placeholder=\\\"Email\\\" autocapitalize=\\\"off\\\" autocomplete=\\\"off\\\" autocorrect=\\\"off\\\" spellcheck=\\\"false\\\" required=\\\"\\\" class=\\\"form__control\\\" aria\"}"
      value      = "test@gmail.com" # "{{ USERNAME  }}@gmail.com" replace this with your glbal variable
    }
    element_user_locator_key = "signin_username"
  },
  {
    name                = "Input Password"
    type                = "typeText"
    use_element_locator = true
    params = {
      element    = "{\"multiLocator\":{\"ab\":\"/*[local-name()=\\\"html\\\"][1]/*[local-name()=\\\"body\\\"][1]/*[local-name()=\\\"main\\\"][1]/*[local-name()=\\\"div\\\"][1]/*[local-name()=\\\"div\\\"][1]/*[local-name()=\\\"article\\\"][1]/*[local-name()=\\\"form\\\"][1]/*[local-name()=\\\"div\\\"][2]/*[local-name()=\\\"input\\\"][1]\",\"at\":\"/descendant::*[@name=\\\"user[password]\\\" and @type=\\\"password\\\"]\",\"cl\":\"/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" sign-in__form \\\")]/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" form__control \\\")][2]\",\"clt\":\"/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" sign-in__form \\\")]/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" form__control \\\")][2]\",\"co\":\"[{\\\"text\\\":\\\" password \\\",\\\"textType\\\":\\\"innerText\\\"}]\",\"ro\":\"//*[@id=\\\"user[password]\\\"]\"},\"targetOuterHTML\":\"<input type=\\\"password\\\" id=\\\"user[password]\\\" name=\\\"user[password]\\\" placeholder=\\\"Password\\\" autocapitalize=\\\"off\\\" autocomplete=\\\"off\\\" autocorrect=\\\"off\\\" spellcheck=\\\"false\\\" required=\\\"\\\" class=\\\"form__control\\\" a\"}"
      value      = "XXXXXXXXXXXX" # "{{ PASSWORD  }}" replace this with your glbal variable
    }
    element_user_locator_key = "signin_password"
  },
  {
    name                = "Click Submit Button"
    type                = "click"
    use_element_locator = true
    params = {
      element = "multiLocator\":{\"ab\":\"/*[local-name()=\\\"html\\\"][1]/*[local-name()=\\\"body\\\"][1]/*[local-name()=\\\"main\\\"][1]/*[local-name()=\\\"div\\\"][1]/*[local-name()=\\\"div\\\"][1]/*[local-name()=\\\"article\\\"][1]/*[local-name()=\\\"form\\\"][1]/*[local-name()=\\\"div\\\"][2]/*[local-name()=\\\"input\\\"][1]\",\"at\":\"/descendant::*[@name=\\\"user[password]\\\" and @type=\\\"password\\\"]\",\"cl\":\"/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" sign-in__form \\\")]/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" form__control \\\")][2]\",\"clt\":\"/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" sign-in__form \\\")]/descendant::*[contains(concat(' ', normalize-space(@class), ' '), \\\" form__control \\\")][2]\",\"co\":\"[{\\\"text\\\":\\\" password \\\",\\\"textType\\\":\\\"innerText\\\"}]\",\"ro\":\"//*[@id=\\\"user[password]\\\"]\"},\"targetOuterHTML\":\"\\u003cinput type=\\\"password\\\" id=\\\"user[password]\\\" name=\\\"user[password]\\\" placeholder=\\\"Password\\\" autocapitalize=\\\"off\\\" autocomplete=\\\"off\\\" autocorrect=\\\"off\\\" spellcheck=\\\"false\\\" required=\\\"\\\" class=\\\"form__control\\\" a\"}"
      value   = ""
    }
    element_user_locator_key = "submit_button"
  },
  {
    name                = "Test text is present on the active page"
    type                = "assertPageContains"
    use_element_locator = false
    params = {
      element =  ""
      value   = "homepage"
    }
    element_user_locator_key = "submit_button"
  }
]