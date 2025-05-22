// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract Burner is ReentrancyGuard {
    using SafeERC20 for IERC20;

    bytes4 private constant BURN_SELECTOR = 0x42966c68; // burn(uint256)

    event TokensProcessed(
        address indexed token,
        uint256 amount,
        uint256 reward,
        address indexed caller,
        bool wasBurned
    );

    /// @notice Check if the contract holds any tokens of the specified ERC20
    /// @param token The ERC20 token address to check
    /// @return amount The amount of tokens held by the contract
    /// @return reward The amount that would be given as reward (1%)
    function checkBalance(address token) external view returns (uint256 amount, uint256 reward) {
        require(
            token.code.length > 0,
            "Not an ERC20 token"
        );
        
        amount = IERC20(token).balanceOf(address(this));
        reward = amount / 100;
    }

    /// Burns 99 % of held `token`, rewards caller with 1 %.
    /// If token has no burn function, sends to zero address instead.
    function burn(address token) external nonReentrant {
        // Check if token implements required ERC20 functions
        require(
            token.code.length > 0,
            "Not an ERC20 token"
        );
        
        IERC20 t = IERC20(token);
        uint256 balance = t.balanceOf(address(this));
        require(balance > 0, "Nothing to burn");

        uint256 reward = balance / 100;          // 1 %
        uint256 toBurn = balance - reward;       // 99 %

        // Try to burn first
        (bool ok, ) = token.call(
            abi.encodeWithSelector(BURN_SELECTOR, toBurn)
        );

        // If burn fails, send to zero address
        if (!ok) {
            t.safeTransfer(address(0), toBurn);
        }

        if (reward > 0) {
            t.safeTransfer(msg.sender, reward);  // caller incentive
        }

        emit TokensProcessed(token, toBurn, reward, msg.sender, ok);
    }

    receive() external payable { revert(); }
    fallback() external payable { revert(); }
} 