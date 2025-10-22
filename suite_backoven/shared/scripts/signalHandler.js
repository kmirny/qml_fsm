export function allowSignalHandler(name)
{
    signals[name].activated=true
}

export function waitForSignalHandler(name, timeout=500)
{
    var ok=waitFor(function(){return signals[name].triggered==true},timeout)
    if(ok)
    {
        test.pass("Expected event (2) "+name)
        signals[name].triggered=false
    }
    else
    {
        test.fail("Expected event did not come " + name)
        signals[name].activated=false
        signals[name].triggered=false
    }
}

export function baseHandler(name)
{
    if(signals[name].activated===true)
    {
        test.pass("Event triggered "+name)
        signals[name].activated=false
    }
    else
    {
        test.fail("Unexpected event "+name)
    }
    signals[name].triggered=true
}