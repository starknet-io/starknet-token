// SPDX-License-Identifier: Apache-2.0.
pragma solidity ^0.8.16;

import "starkware/isd/solidity/IActive.sol";

/*
  This contract is a place holder of no functionality,
  that is expected to be placed behind a proxy.
  It's intentionally of no functionallity, and blocked from receiving funds.
*/
contract StakingContractStub is IActive {
    /*
      Returns false to the isActive query,
      so that callers would know not to interact with it.
    */
    function isActive() external pure override returns (bool) {
        return false;
    }

    /*
      The isFrozen() is required by our Proxy implementation.
    */
    function isFrozen() external pure returns (bool) {
        return false;
    }

    /*
      The initialize() is required when placed behind a Proxy.
    */
    function initialize(bytes calldata data) external {}
}
