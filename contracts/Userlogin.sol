// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserContract {
  struct User {
    string username;
    string password;
  }

  mapping(address => User) public users;

  function register(string memory username, string memory password) public {
    require(bytes(users[msg.sender].username).length == 0, "User already exists");
    users[msg.sender] = User(username, password);
  }

  function login(string memory username, string memory password) public view returns (bool) {
    User memory user = users[msg.sender];
    return (keccak256(bytes(user.username)) == keccak256(bytes(username)) && keccak256(bytes(user.password)) == keccak256(bytes(password)));
  }
}
