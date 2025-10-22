import * as names from 'names.js';

function main()
{
    startApplication("backoven_cmake")
    
    var rootWindow = waitForObject(names.rootWindow)
    var mock = rootWindow.sm

    mock.setStandbyActive("false")
    test.compare(waitForObjectExists(names.blankScreen).visible,false)
    mock.setStandbyActive("true")
    test.compare(waitForObjectExists(names.blankScreen).visible,true)
    snooze(3)
}
