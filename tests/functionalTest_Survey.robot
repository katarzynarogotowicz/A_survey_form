*** Settings ***
Library           SeleniumLibrary
Library           Collections
Documentation     https://www.freecodecamp.org/learn/responsive-web-design/responsive-web-design-projects/build-a-survey-form
Suite Setup       Open Browser        ${SURVEY PAGE}    ${BROWSER}
Suite Teardown    Close Browser
Test Teardown     Reload Page

*** Variables ***
${SURVEY PAGE}    C:/Users/R Co/WebSite/A_survey_form/A_survey_form/A_survey_form.html
${BROWSER}        chrome
&{EXPERIENCE}     up to 1 Year=\<1   up to 2 Years=\<2   greater than 3 Years=\>3

*** Test Cases ***
Check open Survey Page
  The expected title page should be 'Survey Form'

Check fill the name
  User fill the name field with 'Katarzyna'
  Element name contains 'Katarzyna'

Check fill the email
  User fill an email field with 'test@test.com'
  Element email contains 'test@test.com'

Check select age
  User fill an '30' age
  Element age contains '30'

Check select invalid age
  User fill mandatory fields
  User fill an '12' as invalid age
  Submit button is clicked
  Form wasn't submited

Check education field
  Select 'High' education
  'High' education is selected

Check industry field
  Select 'IT' industry
  'IT' industry is selected

Check radio button selection
  Select 'definietly' radio button
  'definietly' radio button is checked
  
Check checkbox selection
  Select 'up to 1 Year' checkbox
  'up to 1 Year' is checked
  
Check for a comment textarea
  Insert 'text' into comments textarea
  Element Text Should Be 'text'
  
Check the form submition
  User fill mandatory fields
  User fill an '30' age
  Submit button is clicked
  The form is submited
  
*** Keywords ***
Survey Page is opened
    Open Browser                               ${SURVEY PAGE}      ${BROWSER}

The expected title page should be '${title}'
    Title should be                            ${title}

User fill the name field with '${name}'
    Input Text	                               id=name	            ${name}

Element name contains '${name}'
    ${value_name}=    Get Element Attribute    id=name              value
    Should Be Equal As Strings                 ${value_name}        ${name}

User fill an email field with '${email}'
    Input Text                                 id=email             ${email}

Element email contains '${email}'
    ${value_email}=    Get Element Attribute   id=email              value
    Should Be Equal As Strings                 ${value_email}        ${email}

User fill an '${age}' age
    Input Text                                 id=age                ${age}

User fill an '${age}' as invalid age
    Input Text                                 id=age                ${age}
    Assign ID to Element   name=age  Kasia_jest_super

Element age contains '${age}'
    ${value_age}=    Get Element Attribute     id=age                value
    Should Be Equal As Strings                 ${value_age}          ${age}

User fill mandatory fields
    User fill the name field with 'Katarzyna'
    User fill an email field with 'test@test.com'

Form wasn't submited
    Page Should Contain Element                  Kasia_jest_super

Select '${level}' education
    Click element                              id=education
    Select from list by label                  id=education          ${level}

'${level}' education is selected
    ${level_edu}=    Get Element Attribute     css=option:checked    label
    Should Be Equal As Strings                 ${level_edu}          ${level}

Select '${industry}' industry
    Click element                              id=industry
    Select from list by label                  id=industry           ${industry}

'${industry}' industry is selected
    ${level_trade}=   Get WebElements         css=option:checked
    ${level_tra}=     Get Element Attribute   ${level_trade}[1]        label
    Should Be Equal As Strings                ${level_tra}             ${industry}

Select '${determination}' radio button
    Select Radio Button                        radiobutton           ${determination}

'${determination}' radio button is checked
    Radio Button Should Be Set To              radiobutton           ${determination}

Select '${exper}' checkbox
    Select Checkbox                            ${EXPERIENCE}[${exper}]

'${exper}' is checked
    Checkbox Should Be Selected                ${EXPERIENCE}[${exper}]

Insert '${text}' into comments textarea
    Input Text                                 id=comments            ${text}

Element Text Should Be '${text}'
    ${value_text}=    Get Element Attribute     id=comments            value
    Should Be Equal As Strings                  ${value_text}          ${text}

Submit button is clicked
   Assign ID to Element                        name=age  Kasia_jest_super
   Click Button                                Submit

The form is submited
   Page Should Not Contain Element             Kasia_jest_super