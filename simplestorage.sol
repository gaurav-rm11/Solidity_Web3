/* pragma solidity ^0.8.7;

contract SimpleStorage{
   function helo() public pure returns (string memory){
      return "hello world";
   }
    uint256 favno;
    function store(uint256 _favno) public {
        favno = _favno;
    }

    //view and pure functions dont spend gas
     //view allow only view no modification
     //pure doesn't allow view or modification
     //but if a gas causing function call view or pure function it costs gas.
    function retrive() public pure returns(uint _favno) {
        return _favno;
    }
    struct people{
        string name;
        uint256 age;
    }
    //map
     mapping(uint256 => string) public map;
    //calldata, memory, storage are temporary variables 
    people[] public People;
    function addperson(string memory _name, uint256 _age) public  {
        People.push(people(_name,_age));
        map[_age] = _name;
    }       
}
*/

// I'm a comment!
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;
// pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;

contract SimpleStorage {

    uint256 favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }
    // uint256[] public anArray;
    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }
    
    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}