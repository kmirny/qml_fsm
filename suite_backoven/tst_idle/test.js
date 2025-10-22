import * as names from 'names.js';

function main()
{
    startApplication("backoven_cmake")
    var t = waitForObject(names.rootWindow)
    var mock = t.sm
    mock.setStandbyActive("false")
    snooze(1)
    mock.setWorkingScreenIdle("false")
    snooze(1)
    test.verify(waitForObjectExists(names.heatingScreen).visible)
}
