// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 
  
import './Ownable.sol'; 

contract ARNSeedSale is  Ownable{

    address public founder;    
    uint seedSaletokenPrice = 0.00035714285 ether;  
    uint public raisedAmount;  

    uint public seedSalehardCap = 100000;
    uint public seedSalesoftCap = 19600;
    uint public seedSaleCount = 0;
    uint public seedSaleStart = 0;  
    uint public seedSaleEnd =0 ; 
    uint public maxInvestment = 1 ether;
    uint public minInvestment = 0.01 ether;
    address payable public depositAddress;

    mapping(address => uint) public investments; 
    mapping(address => uint) public userShare; 
    mapping(address => uint) public tokenbalances; 

    mapping(address => mapping(address => uint)) allowed;

    event SeedSale(address investor, uint value); 

    enum State { beforeStart, running, afterEnd, halted} // ICO states 
    State public seedSaleState;

    constructor(address payable _deposit){
        depositAddress = _deposit; 
        founder = msg.sender;  
        seedSaleState =State.beforeStart;
        tokenbalances[founder] = seedSalehardCap;
    }

     modifier onlyAdmin(){
        require(msg.sender == founder, 'Only Admin Can Call');
        _;
    }    

    function setSeedSaleEnd(uint256 timetoend) public onlyAdmin{ 
       require(seedSaleStart != 0, 'Seed sale not started'); 
        seedSaleEnd=seedSaleStart + timetoend;
    } 

    function haltseedSale() public onlyAdmin{
        seedSaleState = State.halted;
    }    
    
    function setSeedSaleStart() public onlyAdmin{
        seedSaleState = State.running;
        seedSaleStart=block.timestamp;
    } 

    function getSeedSaleCurrentState() public view returns(State){
        if(seedSaleState == State.halted){
            return State.halted;
        }else if(block.timestamp < seedSaleStart){
            return State.beforeStart;
        }else if(block.timestamp >= seedSaleStart && block.timestamp <= seedSaleEnd){
            return State.running;
        }else{
            return State.afterEnd;
        }
    }

     function seedSale()  payable public {  
        require(seedSaleState == State.running,'Seed Sale not running now');
        require(msg.value >= minInvestment && msg.value <= maxInvestment  && investments[msg.sender]<= maxInvestment);
        require(seedSaleCount <= seedSalehardCap);
        
        raisedAmount += msg.value;
        uint tokens = msg.value / seedSaletokenPrice; 
        investments[msg.sender] += msg.value;  

        userShare[msg.sender] = 100 * investments[msg.sender]/raisedAmount;
        seedSaleCount += tokens;
        depositAddress.transfer(msg.value);
        emit SeedSale(msg.sender, tokens); 
    } 
    
      
}