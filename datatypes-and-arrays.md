---
title: "Datatypes and Arrays"
keywords: sample homepage
tags: [getting_started]
sidebar: mydoc_sidebar
permalink: datatypes-and-arrays
summary: These brief instructions will help you get started quickly with the solidity development.
---


## Introduction

let us begin with the most basic example. It is fine if you do not understand everything right now, we will go into more detail later.

### A Simple Smart Contract.

<pre>



pragma solidity ^0.4.0;

contract DataTypes {
    
    bool myBool = false;
    
    int8 myInt = -128;
    uint8 myUInt = 255;
    
    string myString;
    uint8[] myStringArr;

    byte myValue;
    bytes1 myBytes1; 
    bytes32 myBytes32;
    
//    fixed256x8 myFixed = 1; // 255.0
//    ufixed myFixed = 1;

    enum Action {ADD, REMOVE, UPDATE}
    
    Action myAction = Action.ADD;
    
    address myAddress;
    
    function assignAddress() {
        myAddress = msg.sender;
        myAddress.balance;
        myAddress.transfer(10);
    }
    
    uint[] myIntArr = [1,2,3];
    
    function arrFunc() {
        myIntArr.push(1);
        myIntArr.length;
        myIntArr[0];
    }
    
    uint[10] myFixedArr;
    
    struct Account {
        uint balance;
        uint dailyLimit;
    }
    
    Account myAccount;
    
    function structFunc() {
        myAccount.balance = 100;
    }
    
    mapping (address => Account) _accounts;
    
    function () payable {
        _accounts[msg.sender].balance += msg.value;
    }
    
    function getBalance() returns (uint) {
        return _accounts[msg.sender].balance;
    }
}
</pre>



