import * as names from 'names.js';
import * as signalHandler from 'signalHandler.js';

var signalDoTurnOn = "doTurnOnReceived" 

var signals={
    "doTurnOnReceived":
    {
        activated:false,
        triggered: false
    }
}

function allowSignalHandler(name)
{
    signals[name].activated=true
}

function waitForSignalHandler(name, timeout=500)
{
    var ok=waitFor(function(){return signals[name].triggered==true},timeout)
    if(ok)
    {
        test.pass("Expected event "+name)
        signals[name].triggered=false
    }
    else
    {
        test.fail("Expected event did not come " + name)
        signals[name].activated=false
        signals[name].triggered=false
    }
}

function handler(name)
{
    if(signals[name].activated===true)
    {
        signals[name].activated=false
    }
    else
    {
        test.fail("Unexpected event "+name)
    }
    signals[name].triggered=true
}


function onDoTurnOnReceived()
{
    handler(signalDoTurnOn)
}

function main()
{
    startApplication("backoven_cmake")
    var t = waitForObject(names.rootWindow)
    var mock = t.sm

    installSignalHandler(mock,signalDoTurnOn+"()","onDoTurnOnReceived")
    
    allowSignalHandler(signalDoTurnOn)
        
    mouseClick(waitForObject(names.blankScreen))
    waitForSignalHandler(signalDoTurnOn)
}
