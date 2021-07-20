*** Settings ***
Library    XML
Library    os
Library    Collections

*** Test Cases ***
testcase1
    ${xml_obj}=    parse xml    XML_file.xml
#direct process-first approch
    ${xml_value}=    get element text    ${xml_obj}    .//CD[1]/TITLE
    log to console    ${xml_value}
    should be equal    ${xml_value}    dill diya galla
#indirect process-second approch
    ${xml}=    get element    ${xml_obj}    .//CD[1]/TITLE
    log to console    ${xml.text}
#third approch
    element text should be    ${xml_obj}    dill diya galla    .//CD[1]/TITLE

#check numbers of elements/nodes
    ${ele_num}=    get element count    ${xml_obj}    .//CD
    log to console    ${ele_num}
    should be equal as integers    ${ele_num}    5

#check attribute presence
    element attribute should be    ${xml_obj}    id    50    .//CD[5]

#check values of child element
    ${CHILED_ele}=    get child elements    ${xml_obj}     .//CD[1]
    ${ele_txt}=    get element text    ${CHILED_ele[0]}
    log to console    ${ele_txt}
    should not be empty    ${CHILED_ele}





