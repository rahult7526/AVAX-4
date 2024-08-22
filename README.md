# DegenToken Smart Contract

This repository contains the `DegenToken` smart contract, an ERC20 token with functionalities for minting, burning, transferring, and redeeming virtual cars.

## Contract Functions

- **mintToken**: `function mintToken() public onlyOwner`
  - Mints tokens for all players in the queue. Only the owner can call this function.

- **buyDegen**: `function buyDegen(address _toAddress, uint _amount) public`
  - Adds a player to the queue to purchase tokens. Tokens are minted later by the owner using `mintToken`.

- **transferDegen**: `function transferDegen(address _to, uint _amount) public`
  - Transfers tokens from the caller's account to another address.

- **checkBalance**: `function checkBalance() public view returns (uint)`
  - Returns the balance of the caller's account.

- **burnDegen**: `function burnDegen(address _of, uint amount) public`
  - Burns the specified amount of tokens from the specified address.

- **redeemCars**: `function redeemCars(Cars _car) public`
  - Redeems tokens for one of the predefined car types. Each car type requires a different number of tokens.

## Getting Started

### Installing

* Download the contract code from this repository.
* Open it in Remix IDE or any Solidity-compatible development environment.

### Executing Program

#### Prerequisites
- **Remix IDE**: A web-based IDE for Ethereum smart contracts. Access it at [Remix IDE](https://remix.ethereum.org).
- **MetaMask**: A browser extension wallet for interacting with Ethereum-based applications.

#### Deployment on Remix IDE
1. Open Remix IDE in your web browser.
2. Create a new file in Remix IDE and paste the `DegenToken` contract code.
3. Compile the contract using the appropriate Solidity compiler version (0.8.24 or later).
4. Connect MetaMask to Remix IDE by selecting the "Injected Web3" environment in the "Deploy & Run Transactions" tab.
5. Deploy the contract by clicking the "Deploy" button. Choose the appropriate testnet or mainnet through MetaMask.
6. Confirm the deployment transaction in MetaMask and wait for the contract to be deployed. The deployed contract address will be displayed in Remix IDE.

#### Interaction with the Contract
1. After deployment, use the Remix IDE interface to interact with the contract's functions:
   - **Mint Tokens**: Only the contract owner can mint tokens for players in the queue.
   - **Transfer Tokens**: Use the `transferDegen` function to transfer tokens to other addresses.
   - **Check Balance**: Use the `checkBalance` function to view your token balance.
   - **Redeem Cars**: Use the `redeemCars` function to exchange tokens for virtual cars.

#### Connection to Snowtrace (Optional)
1. Visit [Snowtrace](https://snowtrace.io/).
2. Copy the deployed contract address from Remix IDE.
3. Paste the contract address into the Snowtrace search bar to explore contract details and function calls.

## Help

If you encounter any issues or have questions about this project, the following resources are available:

### Documentation
- **Solidity Documentation**: [Visit Solidity Documentation](https://docs.soliditylang.org/)
- **Remix Documentation**: [Visit Remix Documentation](https://remix-ide.readthedocs.io/)

### Contact
If you need further assistance, feel free to reach out:

- **Email**: rahult7526@gmail.com 
- **GitHub Issues**: Report issues or suggest enhancements on our GitHub Issues page.

## License
This project is licensed under the MIT License - see the LICENSE.md file for details.

## Authors
Rahul Tiwary - rahult7526@gmail.com


##### Copyright (c) 2024 rahult7526

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

