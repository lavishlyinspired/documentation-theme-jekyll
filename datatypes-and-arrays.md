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
---
pragma solidity ^0.4.0;



contract testEvent
{
    address private owner;
     uint private value;
    event addressLogger(address);
    event valueLogger(uint);
    
    modifier isowner()
    {
        require(owner == msg.sender);
        _;
    }
    
     modifier isvalidValue()
    {
        assert(value == msg.value);
        _;
    }
    
    function () payable isowner isvalidValue {
   addressLogger(msg.sender);
   valueLogger(msg.value);    
    }
    
 
   
   
   function testEvent()
   {
       owner = msg.sender;
   }
   
   
}

</pre>



