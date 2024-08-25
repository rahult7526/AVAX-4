// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    event GiftCardRedeemed(address indexed player, string giftCard);

    // GiftCard struct to store details of each game gift card
    struct GiftCard {
        string name;
        uint256 cost; 
    }

    // Mapping to keep track of redeemed gift cards for each player
    mapping(address => string[]) private redeemedGiftCards;

    // Array of available gift cards
    GiftCard[] private giftCards;

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        // Initialize gift cards with their respective costs
        giftCards.push(GiftCard("Valorant Gift Card", 250));
        giftCards.push(GiftCard("PUBG Gift Card", 150)); 
        giftCards.push(GiftCard("Asphalt Gift Card", 100)); 
        giftCards.push(GiftCard("Among Us Gift Card", 50)); 
    }

    // Function to mint new tokens, restricted to the contract owner
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Function to transfer tokens to another user
    function transferNFTTokens(address _receiver, uint amount) external {
        require(balanceOf(msg.sender) >= amount, "Balance is Insufficient");
        approve(msg.sender, amount);
        transferFrom(msg.sender, _receiver, amount);
    }

    // Function to check the balance of the calling user
    function checkBalance() external view returns (uint) {
        return balanceOf(msg.sender);
    }

    // Function to burn tokens from the user's balance
    function burnNFTTokens(uint amount) external {
        require(balanceOf(msg.sender) >= amount, "Balance is Insufficient");
        _burn(msg.sender, amount);
    }
    // Function to display available gift cards and their costs
    function gameStore() public pure returns (string memory) {
    return "1. Valorant Gift Card (250 tokens)\n2. PUBG Gift Card (150 tokens)\n3. Asphalt Gift Card (100 tokens)\n4. Among Us Gift Card (50 tokens)";
}

    // Function to redeem tokens for a specific gift card
    function redeemGiftCard(uint amount) external {
        require(amount >= 50, "Minimum of 50 tokens required to redeem");
        require(balanceOf(msg.sender) >= amount, "Balance is Insufficient");

        // Burn the tokens
        _burn(msg.sender, amount);

        // Determine the gift card based on the amount burned
        for (uint i = 0; i < giftCards.length; i++) {
            if (amount >= giftCards[i].cost) {
                // Record the redeemed gift card
                redeemedGiftCards[msg.sender].push(giftCards[i].name);
                emit GiftCardRedeemed(msg.sender, giftCards[i].name);
                return;
            }
        }
        
        revert("No suitable gift card available for the amount burned");
    }

    // Function to retrieve the list of redeemed gift cards for the calling user
    function getRedeemedGiftCards() external view returns (string[] memory) {
        return redeemedGiftCards[msg.sender];
    }
}
