// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {}

    // Redeemable items changed from Cards to Cars
    enum Cars {Economy, Sedan, SUV, Sports, Luxury}

    struct Player {
        address toAddress;
        uint amount;
    }
    // To create the queue of players for buying Degen 
    Player[] public players;

    struct PlayerCars {
        uint Economy;
        uint Sedan;
        uint SUV;
        uint Sports;
        uint Luxury;        
    }

    // To store the redeemed cars
    mapping(address => PlayerCars) public playerCars;

    function buyDegen(address _toAddress, uint _amount) public {
        players.push(Player({toAddress: _toAddress, amount: _amount}));
    }

    // Mint tokens for the buyers in the queue
    function mintToken() public onlyOwner {
        // Loop to mint tokens for buyers in queue
        while (players.length != 0) {
            uint i = players.length - 1;
            if (players[i].toAddress != address(0)) { // Check for non-zero address
                _mint(players[i].toAddress, players[i].amount);
                players.pop();
            }
        }
    }
    
    // Transfer tokens to another player
    function transferDegen(address _to, uint _amount) public {
        require(_amount <= balanceOf(msg.sender), "Low Degen balance");
        _transfer(msg.sender, _to, _amount);
    }

    // Redeem different cars
    function redeemCars(Cars _car) public {
        if (_car == Cars.Economy) {
            require(balanceOf(msg.sender) >= 10, "Low Degen balance");
            playerCars[msg.sender].Economy += 1;
            burn(10);
        } else if (_car == Cars.Sedan) {
            require(balanceOf(msg.sender) >= 20, "Low Degen balance");
            playerCars[msg.sender].Sedan += 1;
            burn(20);
        } else if (_car == Cars.SUV) {
            require(balanceOf(msg.sender) >= 30, "Low Degen balance");
            playerCars[msg.sender].SUV += 1;
            burn(30);
        } else if (_car == Cars.Sports) {
            require(balanceOf(msg.sender) >= 40, "Low Degen balance");
            playerCars[msg.sender].Sports += 1;
            burn(40);
        } else if (_car == Cars.Luxury) {
            require(balanceOf(msg.sender) >= 50, "Low Degen balance");
            playerCars[msg.sender].Luxury += 1;
            burn(50);
        } else {
            revert("Invalid car selected");
        }
    }

    // Function to burn tokens
    function burnDegen(address _of, uint amount) public {
        _burn(_of, amount);
    }

    // Function to check the token balance
    function checkBalance() public view returns (uint) {
        return balanceOf(msg.sender);
    }
}
