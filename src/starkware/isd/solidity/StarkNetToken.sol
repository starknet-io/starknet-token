// SPDX-License-Identifier: Apache-2.0.
pragma solidity ^0.8.16;

import "starkware/isd/third_party/open_zeppelin/access/AccessControl.sol";
import "starkware/isd/third_party/open_zeppelin/token/ERC20/extensions/ERC20Votes.sol";

string constant NAME = "StarkNet Token";
string constant SYMBOL = "STRK";

contract StarkNetToken is ERC20Votes, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor() ERC20Permit(NAME) ERC20(NAME, SYMBOL) {
        _grantRole(DEFAULT_ADMIN_ROLE, _msgSender());
    }

    function mint(address account, uint256 amount) external onlyRole(MINTER_ROLE) returns (bool) {
        _mint(account, amount);
        return true;
    }
}
