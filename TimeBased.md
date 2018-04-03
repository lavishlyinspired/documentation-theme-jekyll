---
title: "Time Based Events"
keywords: sample homepage
tags: [getting_started]
sidebar: mydoc_sidebar
permalink: TimeBased
summary: These brief instructions will help you get started quickly with the solidity development.
---


## TimeBased: Introduction

### The Smart Contract

```
This is the smart contract that you should copy and paste into the Remix IDE:

```


<pre>

    pragma solidity ^0.4.0;

    contract TimeBased {
    
    mapping(address => uint) public _balanceOf;
    mapping(address => uint) public _expiryOf;
    
    uint private leaseTime = 600;
    
    modifier expire(address _addr) {
        if (_expiryOf[_addr] >= block.timestamp) {
            _expiryOf[_addr] = 0;
            _balanceOf[_addr] = 0;
        }
        _;
    }
    
    function lease()
        public
        payable
        expire(msg.sender)
        returns (bool) {
        require(msg.value == 1 ether);
        require(_balanceOf[msg.sender] == 0);
        _balanceOf[msg.sender] = 1;
        _expiryOf[msg.sender] = block.timestamp + leaseTime;
        return true;
    }
    
    function balanceOf() 
        public
        returns (uint) {
        return balanceOf(msg.sender);        
    }
    
    function balanceOf(address _addr)
        public
        expire(_addr)
        returns (uint) {
        return _balanceOf[_addr];
    }
    
    function expiryOf() 
        public
        returns (uint) {
        return expiryOf(msg.sender);        
    }
    
    function expiryOf(address _addr)
        public
        expire(_addr)
        returns (uint) {
        return _expiryOf[_addr];
    }
    }
 </pre>
    
    
   <pre>
   
     pragma solidity ^0.4.0;
    interface AlarmWakeUp {
    function callback(bytes _data) public;
    }

    contract AlarmService {
    
    struct TimeEvent {
        address addr;
        bytes data;
    }
    
    mapping(uint => TimeEvent[]) private _events;
    
    function set(uint _time) 
        public 
        returns (bool) {
        TimeEvent _timeEvent;
        _timeEvent.addr = msg.sender;
        _timeEvent.data = msg.data;
        _events[_time].push(_timeEvent);
    }
    
    function call(uint _time) 
        public {
        TimeEvent[] timeEvents = _events[_time];
        for(uint i = 0; i < timeEvents.length; i++) {
            AlarmWakeUp(timeEvents[i].addr).callback(timeEvents[i].data);
        }
    }
    }

    contract AlarmTrigger is AlarmWakeUp {
    
    AlarmService private _alarmService;
    
    function AlarmTrigger() {
        _alarmService = new AlarmService();
    }
    
    function callback(bytes _data) 
        public {
        // Do something
    }
    
    function setAlarm() 
        public {
        _alarmService.set(block.timestamp+60);
    }
    
    }
   </pre>
