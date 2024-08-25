# DegenToken Contract

## Overview
DegenToken is an ERC20 token with additional features for redeeming in-game gift cards. Users can mint, transfer, burn tokens, and redeem them for game gift cards based on the amount burned.

## Features
- **Mint Tokens:** Contract owner can mint tokens.
- **Transfer Tokens:** Users can transfer tokens to others.
- **Burn Tokens:** Users can burn their tokens.
- **Gift Card Redemption:** Users can redeem tokens for game gift cards.
- **View Redeemed Gift Cards:** Users can view their redeemed gift cards.

## Gift Cards
- **Valorant Gift Card:** 250 tokens
- **PUBG Gift Card:** 150 tokens
- **Asphalt Gift Card:** 100 tokens
- **Among Us Gift Card:** 50 tokens

## Contract Functions
- `mint(address to, uint256 amount)`: Mint tokens to a specified address (owner only).
- `transferNFTTokens(address _receiver, uint amount)`: Transfer tokens to another user.
- `checkBalance()`: View the token balance of the caller.
- `burnNFTTokens(uint amount)`: Burn tokens from the caller's balance.
- `gameStore()`: Display available gift cards and their costs.
- `redeemGiftCard(uint amount)`: Redeem tokens for a gift card.
- `getRedeemedGiftCards()`: View the list of redeemed gift cards by the caller.

## Example Usage
- **Mint Tokens:** `mint(0xYourAddress, 1000)`
- **Transfer Tokens:** `transferNFTTokens(0xReceiverAddress, 100)`
- **Redeem Gift Card:** `redeemGiftCard(150)`
- **View Redeemed Cards:** `getRedeemedGiftCards()`

## Author
Rahul Tiwary - rahult7526@gmail.com

## License
This project is licensed under the MIT License
