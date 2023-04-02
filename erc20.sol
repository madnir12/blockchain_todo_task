// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

 // NO COIN ERC20
contract NDCoinERC20 {
 event Transfer(address indexed from, address indexed to, uint tokens);
 string public constant name = "ND Coin";
 string public constant symbol = "NDN";
uint8 public constant decimals = 18;
} // ENDS NO COIN ERC20
//  MAPPING
contract Mapping{
    mapping(address => uint256) balances;

mapping(address => mapping (address => uint256)) allowed;

uint totalSupply_;


}
// complete token
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract MyCoinERC20 {

    // Transfer event 
    event Transfer(address indexed from, address indexed to, uint tokens);

    // Approval event 
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

    string public constant name = "My Coin";
    string public constant symbol = "MC";
    uint8 public constant decimals = 16;

    // mappings.

    mapping(address => uint256) balances; 

    mapping(address => mapping (address => uint256)) allowed;

    uint256 totalSupply_;

    constructor(uint256 total) {
      totalSupply_ = total;
      balances[msg.sender] = totalSupply_;
    }

    function totalSupply() public view returns (uint256) {
      return totalSupply_;
    }

    function balanceOf(address tokenOwner) public view returns (uint) {
        return balances[tokenOwner];
    }

 function transfer(address receiver, uint numOfTokens) public returns (bool) {
        require(numOfTokens <= balances[msg.sender]);
        balances[msg.sender] -= numOfTokens;
        balances[receiver] += numOfTokens;
        emit Transfer(msg.sender, receiver, numOfTokens);
        return true;
    }

    function approve(address delegate, uint numOfTokens) public returns (bool) {
        allowed[msg.sender][delegate] = numOfTokens;
        emit Approval(msg.sender, delegate, numOfTokens);
        return true;
    }

    function allowance(address owner, address delegate) public view returns (uint) {
        return allowed[owner][delegate];
    }

    function transferFrom(address owner, address buyer, uint numTokens) public returns (bool) {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowed[owner][msg.sender]);

        balances[owner] -= numTokens;
        allowed[owner][msg.sender] -= numTokens;
        balances[buyer] += numTokens;
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
}