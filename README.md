# Deployment-of-Smart-Contract-on-Ethereum-Blockchain
The provided code is a simple implementation of a lottery smart contract written in Solidity, a programming language for developing smart contracts on the Ethereum blockchain. Let's break down the key components and explain the functionality:
Manager: The contract has a manager, initially set to the address that deploys the contract. The manager has special privileges, such as checking the contract's balance and selecting a winner.

Participant Registration: Users can participate in the lottery by sending a transaction with a value of exactly 0.1 ether to the contract. The receive function handles this and adds the participant's address to the participant's array.

Balance Tracking: The getBalance function allows the manager to check the current balance of the contract.

Random Number Generation: The random function uses the keccak256 hash function to generate a pseudo-random number based on the block difficulty, timestamp, and the number of participants.

Winner Selection: The select winner function can only be called by the manager. It requires a minimum of three participants to proceed. A winner is selected based on the generated random number, and the entire contract balance is transferred to the winner's address.

Resetting Participants: After selecting a winner, the participant's array is reset to an empty array, preparing the contract for the next round of the lottery.
