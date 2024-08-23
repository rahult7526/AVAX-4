// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ContentSubscription is Ownable {
    IERC20 public token; 

    struct Creator {
        address creatorAddress;
        uint256 subscriptionFee; 
        uint256 subscriptionDuration;
    }

    struct Subscription {
        uint256 expiryTime;
    }

    mapping(address => Creator) public creators;
    mapping(address => mapping(address => Subscription)) public subscriptions; 

    event Subscribed(address indexed user, address indexed creator, uint256 expiryTime);
    event CreatorRegistered(address indexed creator, uint256 subscriptionFee, uint256 subscriptionDuration);
    event CreatorWithdrawn(address indexed creator, uint256 amount);
    event SubscriptionCancelled(address indexed user, address indexed creator);

    constructor(IERC20 _token) Ownable(msg.sender) {
        token = _token;
    }


    function registerCreator(uint256 _subscriptionFee, uint256 _subscriptionDuration) external {
        require(_subscriptionFee > 0, "Subscription fee must be greater than zero");
        require(_subscriptionDuration > 0, "Subscription duration must be greater than zero");

        creators[msg.sender] = Creator({
            creatorAddress: msg.sender,
            subscriptionFee: _subscriptionFee,
            subscriptionDuration: _subscriptionDuration
        });

        emit CreatorRegistered(msg.sender, _subscriptionFee, _subscriptionDuration);
    }

    function subscribe(address _creator) external {
        Creator memory creator = creators[_creator];
        require(creator.creatorAddress != address(0), "Creator does not exist");

        uint256 amount = creator.subscriptionFee;
        require(token.transferFrom(msg.sender, address(this), amount), "Payment failed");

        uint256 currentExpiry = subscriptions[msg.sender][_creator].expiryTime;
        uint256 newExpiryTime = block.timestamp > currentExpiry ? block.timestamp + creator.subscriptionDuration : currentExpiry + creator.subscriptionDuration;
        
        subscriptions[msg.sender][_creator] = Subscription({
            expiryTime: newExpiryTime
        });

        emit Subscribed(msg.sender, _creator, newExpiryTime);
    }

    function withdrawFunds() external {
        Creator memory creator = creators[msg.sender];
        require(creator.creatorAddress == msg.sender, "You are not a registered creator");

        uint256 balance = token.balanceOf(address(this));
        require(balance > 0, "No funds to withdraw");

        require(token.transfer(msg.sender, balance), "Withdrawal failed");

        emit CreatorWithdrawn(msg.sender, balance);
    }

    function hasAccess(address _creator, address _user) external view returns (bool) {
        return subscriptions[_user][_creator].expiryTime > block.timestamp;
    }

    function cancelSubscription(address _creator) external {
        delete subscriptions[msg.sender][_creator];
        emit SubscriptionCancelled(msg.sender, _creator);
    }
}
