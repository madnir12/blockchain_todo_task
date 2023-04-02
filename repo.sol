// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.6; // compiler version
// praticing array in solidity
contract Array{
   uint [4] public a= [1,2,3,4 ];
   function setter(uint index,uint value) public{
      a[index]=value;
   }  
   function length() public view returns(uint){
      return a.length;
   }
} // ends arraay contract
// praticing constructor
contract Identity {
   string name;
   uint age;
   constructor() public {
       name="Muhammad Madni";
       age=26;
   }
   function getName() view public returns(string memory){
       return name;
   }
   function getAge() view public returns(uint){
      return age;
   } 

    function setAge()public{
        age=age+1;
    }

} // ends identitiy contract
// praticing array with while loop
contract ArrayWithWhile {
    uint [10] public arr;
    uint public count;
    function loop () public {
        while(count<arr.length){
            arr[count]=count;
            count++;
        }
    }

} // ends array with while loop contract
// 
contract ArrayWithForLoop {
    uint[3]public arr;
    uint public cunt;
    function loop () public{
        for(uint i=cunt;i<arr.length;i++){
            arr[cunt]=cunt;
           cunt++;
        }
    }

} // ends array with for loop
// pratcing if else
contract IfElse{
    function check(int x) public pure returns(string memory){
        string memory value;
        if(x > 0){
            value = "greater then value of 0";
        } else if(x==0){
            value = "equal to zero";
        } else {
            value="less than zero";
        }
        return value;

    }
} // ends if else
// praticing struct
struct Student {
    uint roll;
    string name;
} // ends student struct
// this contract is demo of how to use custom data type
contract DemoForStudent {
    Student public s1;
    constructor (uint _roll,string memory _name){
        s1.roll = _roll;
        s1.name = _name;
    }
    //change value
    function change (uint _roll,string memory _name)public {
        Student memory new_student = Student({
            roll: _roll,
            name:_name
        });
        s1 = new_student;
    }
} // ends demo contract
// practicing enum
contract State {
    enum user {allowed,not_allowed,wait}
    user public u1 = user.allowed;
    uint public lottery = 1000;
    function owner() public {
        if(u1 == user.allowed){
            lottery=0;
        }
    }
    function changeOwner() public view {
        u1 == user.not_allowed;
    }
} // ends state contract

contract Mapping {
    mapping(uint => string) public roll_no;
    function setter(uint keys,string memory value) public{
        roll_no[keys] = value;
    }
} // ends mapping
// practicing struct and mapping
contract StructAndMapping {
    struct Student{
        string name;
         uint class;
    }
    mapping(uint => Student) public data;
    function setter(uint _roll  ,string memory _name,uint _class)public {
        data[_roll] = Student(_name,_class);
    }
} // ends struct and mapping contract