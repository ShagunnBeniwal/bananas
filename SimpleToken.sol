// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title SimpleToken - a basic ERC-20 token (deployed as "Bananas" / "BNNA")
/// @notice Think of this contract as a shared notebook that records
///         how many tokens each address owns.
contract SimpleToken {
    // ---- Token details (set once, at deployment) ----
    string public name;                 // e.g. "Bananas"
    string public symbol;               // e.g. "BNNA"
    uint8 public constant decimals = 18; // like ETH: 1 token = 10^18 smallest units
    uint256 public totalSupply;         // total tokens that exist

    // ---- The "notebook" ----
    // balanceOf[address] => how many tokens that address owns
    mapping(address => uint256) public balanceOf;
    // allowance[owner][spender] => how many of owner's tokens spender may use
    mapping(address => mapping(address => uint256)) public allowance;

    // ---- Events (logs that show up on Etherscan) ----
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /// @notice Runs once when the contract is deployed.
    /// @param _name          Token name, e.g. "Bananas"
    /// @param _symbol        Token symbol, e.g. "BNNA"
    /// @param _initialSupply Number of whole tokens to create, e.g. 1000000
    constructor(string memory _name, string memory _symbol, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _initialSupply * 10 ** decimals;
        balanceOf[msg.sender] = totalSupply; // the deployer gets every token
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    /// @notice Send your own tokens to another address.
    function transfer(address to, uint256 value) public returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }

    /// @notice Allow `spender` to use up to `value` of your tokens.
    function approve(address spender, uint256 value) public returns (bool) {
        require(spender != address(0), "Cannot approve the zero address");
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    /// @notice Used by an approved spender to move tokens from `from` to `to`.
    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        require(allowance[from][msg.sender] >= value, "Allowance too low");
        allowance[from][msg.sender] -= value;
        _transfer(from, to, value);
        return true;
    }

    /// @dev Shared logic for transfer and transferFrom.
    function _transfer(address from, address to, uint256 value) internal {
        require(to != address(0), "Cannot send to the zero address");
        require(balanceOf[from] >= value, "Not enough tokens");
        balanceOf[from] -= value;
        balanceOf[to] += value;
        emit Transfer(from, to, value);
    }
}
