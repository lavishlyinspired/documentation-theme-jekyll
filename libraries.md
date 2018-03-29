---
title: "Import and Libraries"
keywords: sample homepage
tags: [getting_started]
sidebar: mydoc_sidebar
permalink: libraries
summary: These brief instructions will help you get started quickly with the solidity development.
---


## Introduction

let us begin with the most basic example. It is fine if you do not understand everything right now, we will go into more detail later.

### A Simple Smart Contract

<pre>
pragma solidity ^0.4.0;

library IntExtended {
    
    function increment(uint _self) returns (uint) {
        return _self+1;
    }
    
    function decrement(uint _self) returns (uint) {
        return _self-1;
    }
    
    function incrementByValue(uint _self, uint _value) returns (uint) {
        return _self + _value;
    }
    
    function decrementByValue(uint _self, uint _value) returns (uint) {
        return _self - _value;
    }
}

contract TestLibrary {
    using IntExtended for uint;
    
    function testIncrement(uint _base) returns (uint) {
        // calling increment using a library way to call a function, using uint parameter.
        return IntExtended.increment(_base);
      
    }
    
    function testDecrement(uint _base) returns (uint) {
        return IntExtended.decrement(_base);
    }
    
    function testIncrementByValue(uint _base, uint _value) returns (uint) {
        return _value.incrementByValue(_value);
    }
    
    function testDecrementByValue(uint _base, uint _value) returns (uint) {
        return _base.decrementByValue(_value);
    }
    function testIncrement2(uint _base) returns (uint) {
       // another possible way to call a function, using uint parameter.
        return _base.increment();
    }
}
</pre>

## Keywords and Concepts

### Keywords
``
library
_self
import
using
``

### Concepts



