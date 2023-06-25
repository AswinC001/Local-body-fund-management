// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract Official {
    /*
    

           send Ether
               |
         msg.data is empty?
              / \
            yes  no
            /     \
receive() exists?  fallback()
         /   \
        yes   no
        /      \
    receive()   fallback()
    */
   
    // Function to receive Ether. msg.data must be empty
    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}

    function Received() public view returns (uint) {
        return address(this).balance;
    }
}