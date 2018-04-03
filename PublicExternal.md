---
title: "Public Vs External"
keywords: sample homepage
tags: [getting_started]
sidebar: mydoc_sidebar
permalink: PublicExternal
summary: These brief instructions will help you get started quickly with the solidity development.
---


## PublicExternal: Introduction

### The Smart Contract

```
This is the smart contract that you should copy and paste into the Remix IDE:

```


<pre>

 
pragma solidity ^0.4.0;

contract ExternalContract {
    function externalCall(string x) external returns (uint) {
        return 123;
    }
    
    function publicCall(string x) public returns (uint) {
        return 123;
    }
}

</pre>
