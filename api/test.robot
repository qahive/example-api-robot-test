*** Settings ***
Library    RequestsLibrary
Library    RPA.Excel.Files
Library    Process
Library    Collections


*** Test Cases ***
Call Post Cancel Withdrawal Test
    Open Workbook    ${CURDIR}//test.xlsx
    Set Active Worksheet    Mobile -All Data
    ${rows}    Set Variable    0
    @{rowsData}=    Read Worksheet
    FOR    ${data}    IN    @{rowsData}
        ${rows}    Evaluate    ${rows}+1
        &{rowData}    Convert To Dictionary    ${data}
        Log    ${rowData.A}
    END
