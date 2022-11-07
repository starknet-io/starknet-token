// SPDX-License-Identifier: Apache-2.0.
pragma solidity ^0.8.16;

/*
  Interface with a function that indicates whether the contract is active.
*/
interface IActive {
    /*
      Returns true if active.
    */
    function isActive() external view returns (bool);
}
