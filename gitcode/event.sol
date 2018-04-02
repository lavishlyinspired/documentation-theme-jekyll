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
    
    function deposit ()  payable isowner isvalidValue {
   addressLogger(msg.sender);
   valueLogger(msg.value);    
    }
    
 
   
   
   function testEvent()
   {
       owner = msg.sender;
   }
   
   
}

