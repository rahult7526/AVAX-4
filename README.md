# DegenToken and ContentSubscription Contracts

## Overview

This repository contains two Solidity smart contracts:

1. **DegenToken**: An ERC20 token contract for creating a custom token named "Degen" with the symbol "DGN".
2. **ContentSubscription**: A subscription management contract allowing users to pay for content subscriptions using an ERC20 token.

## DegenToken

### Description

The `DegenToken` contract implements the ERC20 standard and creates a custom token named "Degen" (symbol: "DGN"). Upon deployment, it mints an initial supply of tokens to the deployer’s address.

### Getting Started

1. **Deploying the Contract:**
   - Use Remix or another Ethereum development environment.
   - Deploy the contract with an initial supply parameter.

2. **Interacting with the Contract:**
   - Perform standard ERC20 operations such as transferring tokens and checking balances.

## ContentSubscription

### Description

The `ContentSubscription` contract allows content creators to set subscription fees and durations. Users can subscribe by paying the fee with an ERC20 token, and creators can withdraw accumulated funds. It also includes functionalities to check access and cancel subscriptions.

### Getting Started

1. **Deploying the Contract:**
   - Compile and deploy the `ContentSubscription` contract using Remix or another Ethereum development environment.
   - Provide an instance of an ERC20 token (e.g., `DegenToken`) as a parameter.

2. **Interacting with the Contract:**
   - **Register a Creator:** Use the function to set the subscription fee and duration.
   - **Subscribe to Content:** Pay the subscription fee to gain access.
   - **Withdraw Funds:** Creators can withdraw accumulated funds.
   - **Check Access:** Verify if a user has an active subscription.
   - **Cancel Subscription:** Cancel a subscription as needed.

### Authors

Rahul Tiwary
rahult7526@gmail.com

### License

This project is licensed under the MIT License - see the LICENSE.md file for details.

