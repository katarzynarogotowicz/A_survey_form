*** Settings ***
Library           Selenium2Library
Documentation     https://www.freecodecamp.org/learn/responsive-web-design/responsive-web-design-projects/build-a-survey-form
Suite Setup       Open Browser       ${SURVEY PAGE}    ${BROWSER}
Suite Teardown    Close Browser


*** Variables ***
${SURVEY PAGE}    C:/Users/R Co/WebSite/A_survey_form/A_survey_form/A_survey_form.html
${BROWSER}        Chrome
${COUNT_MIN}      18
${COUNT_MAX}      50
${EL_EDUCATION}   High
${EL_INDUSTRY}    IT
${RADIOBUTTON}    definietly

*** Test Cases ***
Check open page
    Open Survey Page

Check for items are fit requirements
    Check elements html
    Check elements name
    Check elements email
    Select an age with a range
    Check elements dropdown

Check selection
    Check radio button selection
    Check checkbox selection

Check elements textarea
    Check for a textarea

Check the form submition
    Submit the form

*** Keywords ***
Open Survey Page
    Page should contain element        id=title
    Title should be                    Survey Form
    Page should contain element        id=description
    Page should contain                Thank you for taking the time

Check elements html
    Page should contain element        id=survey-form

Check elements name
    Page should contain element        id=name
    Page should contain element        id=name-label
    Page should contain                Name

Check elements email
    Page should contain element        id=email
    Page should contain element        id=email-label
    Page should contain                Email

Select an age with a range
    Page should contain element        id=age
    Page should contain element        id=age-label
    Page should contain                Age
    Get element count                  id=age-label
    Should be true                     ${COUNT_MIN} > 17
    Get element count                  id=age-label
    Should be true                     ${COUNT_MAX}  < 51

Check elements dropdown
    Page should contain element        id=dropdown_e
    Click element                      id=education
    Select from list by label          id=education  ${EL_EDUCATION}
    Click element                      id=industry
    Select from list by label          id=industry   ${EL_INDUSTRY}

Check radio button selection
    Select Radio Button                radiobutton   ${RADIOBUTTON}

Check checkbox selection
    Select Checkbox                    name=checkbox

Check for a textarea
    Click element                      id=comments

Submit the form
    Click Button                       Submit






