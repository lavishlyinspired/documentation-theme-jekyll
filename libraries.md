---
title: "Getting started with the Solidity Development"
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
---
pragma solidity ^0.4.0;



contract SimpleStorage {

    uint storedData;



    function set(uint x) public {

        storedData = x;

    }



    function get() public constant returns (uint) {

        return storedData;

    }

}
---
</pre>

* Keyword pragma solidity ^0.4.0; means Declare the source file compiler version.the source code is written for Solidity version 0.4.0 or anything newer that does not break functionality (up to, but not including, version 0.5.0). This is to ensure that the contract does not suddenly behave differently with a new compiler version.
* 'contract' has similarities to 'class' in other languages (class variables, inheritance, etc. SimpleStorage is a class name with the first name in Capital Letter.
* The line uint storedData;declares a state variable called storedData of type uint (unsigned integer of 256 bits).
function is a keyword.It is declared each time a new function is created.
* set and get can be used to modify or retrieve the value of the variable.
* 'public' makes externally readable (not writeable) by users or contracts. "private" means that other contracts can't directly query balances but data is still viewable to other parties on blockchain
* constant return (uint)-  The function get() results in the constant  (of type uint256) 



### Steps to execute the above contract in Solidity Remix


* Launch http://remix.ethereum.org
* Create a file SimpleStorage.sol. This filename is same as Contract name.

{% include image.html file="2.png"  alt="2" caption="" %}

* On the right-hand side select run tab.
* Below run tab Select Environment as JavaScript VM.
* Click Create.Leave other fields populated.

{% include image.html file="5.png"  alt="5" caption="" %}

* Contract gets executed with a new contract address. Enter an integer value in the text box beside setter method set label.
* Click Set label
* click getter method get label.

{% include image.html file="8.png"  alt="8" caption="" %}


  You can observe the details of the executed contract on the transaction debugger as shown below.Click on the Details button to expand.
* Transactions SimpleStorage.set method. 
{% include image.html file="10.png"  alt="10" caption="" %}
* Transactions SimpleStorage.get method
{% include image.html file="11.png"  alt="11" caption="" %}
