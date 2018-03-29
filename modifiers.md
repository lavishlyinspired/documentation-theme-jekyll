---
title: "Modifiers and Error Handling in Solidity"
keywords: sample homepage
tags: [getting_started]
sidebar: mydoc_sidebar
permalink: modifiers
summary: These brief instructions will help you get started quickly with the solidity development.
---

## Modifiers: Introduction

### The Smart Contract

```
This is the smart contract that you should copy and paste into the Remix IDE:
```

<pre>
pragma solidity ^0.4.0;

interface Regulator {
 function checkValue(uint amount) returns (bool);
 function loan() returns (bool);
}

contract Bank is Regulator {
 uint private value;
 address private owner;

 function Bank(uint amount) {
 value = amount;
 owner = msg.sender;
 }
 
 modifier ownerFunc {
 require(owner == msg.sender);
 _;
 }
 function deposit(uint amount) ownerFunc {
 value += amount;
 }
 
 function withdraw(uint amount) ownerFunc {
 if (checkValue(amount)) {
 value -= amount;
 }
 }
 
 function balance() returns (uint) {
 return value;
 }
 
 function checkValue(uint amount) returns (bool) {
 // Classic mistake in the tutorial value should be above the amount
 return value >= amount;
 }
 
 function loan() returns (bool) {
 return value > 0;
 }
}

contract MyFirstContract is Bank(10) {
 string private name;
 uint private age;
 
 function setName(string newName) {
 name = newName;
 }
 
 function getName() returns (string) {
 return name;
 }
 
 function setAge(uint newAge) {
 age = newAge;
 }
 
 function getAge() returns (uint) {
 return age;
 }
}

contract TestThrows {
 function testAssert() {
 assert(1 == 2);
 }
 
 function testRequire() {
 require(2 == 1);
 }
 
 function testRevert() {
 revert();
 }
 
 function testThrow() {
 throw;
 }
}
</pre>

### Obtaining owner's contract address

<pre>
contract Bank is Regulator {
 uint private value;
 address private owner;

 function Bank(uint amount) {
 value = amount;
 owner = msg.sender;
 }
 </pre>
 

### Creating a Modifier


create a modifier that will only allow the owner of the contract to perform an action on the contract it is used.
```
Require is a keyword that checks a condition.
```
 
<pre>
 modifier ownerFunc {
 require(owner == msg.sender);
 _;
 }
</pre>

```
Modifiers can also receive arguments, ie: modifier name(arg1), If the condition is true, _; on the line beneath is where the function body is placed. In other words, the function will be executed.
```

### Using the Modifier
 

Well, we can use it in any function where we only want the smart contract creator to have access
Let's add it to the deposit() and withdraw() function:

<pre>

 function deposit(uint amount) ownerFunc {
 value += amount;
 }
 
 function withdraw(uint amount) ownerFunc {
 if (checkValue(amount)) {
 value -= amount;
 }
 }
 </pre>
 
 
### Debugging in Remix

* If you want to give it a go in the Remix IDE, click the Create button to create the contract. Then, specify 20 in the deposit function text field on the right of the IDE and click on the function name to set it.

* It should work, and to verify, click balance.

* Now, try changing the Account dropdown at the top to a different account than the one used to create the smart contract and repeat the process above.

* You'll notice it won't work this time, the debugger will throw an error.
