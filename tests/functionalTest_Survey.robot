*** Settings ***
Library           SeleniumLibrary
Library           Collections
Documentation     https://www.freecodecamp.org/learn/responsive-web-design/responsive-web-design-projects/build-a-survey-form

*** Variables ***
${SURVEY PAGE}    C:/Users/R Co/WebSite/A_survey_form/A_survey_form/A_survey_form.html
${BROWSER}        chrome
&{EXPERIENCE}     up to 1 Year=\<1   up to 2 Years=\<2   greater than 3 Years=\>3

*** Test Cases ***
Check open Survey Page
  When Survey Page is opened
  Then The expected title page should be 'Survey Form'
  [Teardown]  Close Browser

Check fill the name
  Given Survey Page is opened
  When User fill the name field with 'Katarzyna'
  Then Element name contains 'Katarzyna'
  [Teardown]  Close Browser

Check fill the email
  Given Survey Page is opened
  When User fill an email field with 'test@test.com'
  Then Element email contains 'test@test.com'
  [Teardown]  Close Browser

Check select age
  Given Survey Page is opened
  When User fill an '30'
  Then Element age contains '30'
  [Teardown]  Close Browser

#zrobić - Check select invalid age
#  When Survey Page is opened
#  Given User fill an '30'
#  Then Element age contains '30'
#  [Teardown]  Close Browser

Check education field
  Given Survey Page is opened
  When Select 'High' education
  Then 'High' education is selected
  [Teardown]  Close Browser

Check industry field
  Given Survey Page is opened
  When Select 'IT' industry
  Then 'IT' industry is selected
  [Teardown]  Close Browser

Check radio button selection
  Given Survey Page is opened
  When Select 'definietly' radio button
  Then 'definietly' radio button is checked
  [Teardown]  Close Browser

Check checkbox selection
  Given Survey Page is opened
  When Select 'up to 1 Year' checkbox
  Then 'up to 1 Year' is checked
  [Teardown]  Close Browser

Check for a comment textarea
  Given Survey Page is opened
  When Insert 'text' into comments textarea
  Then Element Text Should Be 'text'
  [Teardown]  Close Browser

Check the form submition
  Given Survey Page is opened
  When Submit button is clicked
  Then The form is submited
  [Teardown]  Close Browser

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

User fill an '${age}'
    Input Text                                 id=age                ${age}

Element age contains '${age}'
    ${value_age}=    Get Element Attribute     id=age                value
    Should Be Equal As Strings                 ${value_age}          ${age}

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
   Click Button                                Submit

The form is submited
   Page should contain                         Form sent.