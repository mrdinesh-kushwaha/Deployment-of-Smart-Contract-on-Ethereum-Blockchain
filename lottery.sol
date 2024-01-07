// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.5.0 < 0.9.0;

contract Lottery {
    address public manager;
    address payable[] public participants;

    // Constructor function is executed only once during contract deployment
    constructor() {
        manager = msg.sender; // Assign the deployer's address as the manager
    }

    // The receive function is a special function that is called when Ether is sent to the contract
    receive() external payable {
        // Accept only transactions with a value of 0.1 ether
        require(msg.value == 0.1 ether);

        // Add the sender's address to the list of participants
        participants.push(payable(msg.sender));
    }

    // Get the current balance of the contract (in wei)
    function getBalance() public view returns (uint) {
        // Only allow the manager to check the balance
        require(msg.sender == manager);
        return address(this).balance;
    }

    // Generate a pseudo-random number based on various factors
    function random() public view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, participants.length)));
    }

    // Select a winner from the participants and transfer the contract's balance to them
    function selectWinner() public {
        // Only allow the manager to select a winner
        require(msg.sender == manager);

        // Require at least 3 participants for a valid selection
        require(participants.length >= 3);

        // Generate a random index based on the number of participants
        uint r = random();
        address payable winner;
        uint index = r % participants.length;
        winner = participants[index];

        // Transfer the contract's balance to the winner
        winner.transfer(getBalance());

        // Reset the participants array for the next round
        participants = new address payable[](0);
    }
}
