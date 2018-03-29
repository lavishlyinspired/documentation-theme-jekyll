---
title: "Inheritance in Solidity"
keywords: sample homepage
tags: [getting_started]
sidebar: mydoc_sidebar
permalink: Inheritance
summary: These brief instructions will help you get started quickly with the solidity development.
---


## Inheritance: Introduction

In this chapter, I will be discussing the following topics.

* Visibility  and Modifiers.
* Constructors.
* Abstract Contracts and Interface.
* Visibility  and Modifiers.
* An example illustrating Inheritance in solidity.
* Use remix compiler to debug and run custom contract in the example above.
* Multiple Inheritance and Linearization.
* Inheriting Different Kinds of Members of the Same Name.
* Arguments for Base constructors


## Inheritance in Depth

There could be many documents or online sources available explaining Inheritance in solidity, But I will try to keep the explanation here as simple as I can.
```
In Solidity, inheritance is much similar to inheritance in oriented object programming languages. You’ll first write your base contract and tell that your new contract will inherit from the base one.
```
You also have to know that Solidity supports multiple inheritances by copying code including polymorphism. All function calls are virtual, which means that the most derived function is called, except when the contract name is explicitly given. When a contract inherits from multiple contracts, only a single contract is created on the blockchain, and the code from all the base contracts is copied into the created contract.


### Function Modifiers

They can automatically check a condition prior to executing the function.
### Constructors

A constructor is an optional function with the same name as the contract which is executed upon contract creation.
Constructor functions can be either public or internal.


### Abstract Contracts and Interface

If a contract does not implement all functions it can only be used as an interface.
These abstract contracts are only provided to make the interface known to the compiler. Note the function without a body.
If a contract does not implement all functions it can only be used as an interface.

### Visibility and Modifiers


There are four types of visibilities for functions and state variables.

```
Functions can be specified as being external, public, internal or private, where the default ispublic. For state variables, external is not possible and the default is internal. .
```
* public - all can access
* external - Cannot be accessed internally, only externally
* internal - only this contract and contracts deriving from it can access
* private - can be accessed only from this contract

## Code
### An example illustrating Inheritance in solidity

<pre>
pragma solidity ^0.4.0;
contract Bank{
 uint private value;
 
 function Bank(uint amount){
 value = amount;
 }
 
 function deposit(uint amount)
 {
 value +=amount;
 }
 function withdraw(uint amount)
 {
 value -=amount;
 }
 function balance() returns (uint)
 {
 return value;
 }
}
contract Person is Bank(10){
 string private name;
 uint age;
 function setName(string newName){
 name = newName;
 }
 function getName() returns (string){
 return name;
 }
 function setage(uint newage){
 age = newage;
 }
 function getAge() returns (uint){
 return age;
 
 }
}
</pre>
```
In the above example value is declared private.Hence it can not be accessed by child contract(Person)
```

<pre>
function balance() returns (uint)
{
return value;
}
 
 
```
In the above example if the value is declared internal. it can only be accessed by child contract(Person)
```

contract TestInternal {
 
function balance() returns (uint)
{
return value;

}
 
}
</pre>

## Interface
function loan is declared in Bank contract but is left unimplemented.It should be implemented in the inherited contract before executing the contract, otherwise an error message will be displayed saying

 ```This contract does not implement all functions and thus cannot be created.```
 
```js
function loan() returns (bool);
````
 
### Interface Example
 
 This is how we declare an interface
<pre>
pragma solidity ^0.4.0;
interface Regulator{ 
function loan() returns (bool);
}

contract Bank is Regulator{
uint internal value;
....
....
....
</pre>
 
### Implementation
<pre>
function loan() returns (bool)
 {
 return true;
 }
</pre>

