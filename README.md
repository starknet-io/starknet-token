## StarkNet Token

This repository contains the solidity files implementing the StarkNet token and related contracts.
This repository and this README file do not relate to any other aspect of StarkNet or StarkNet Token.

### Introduction
The __StarkNet Token__ is an ERC20 Solidity contract.

#### Basic info
Name:     __StarkNet Token__

Symbol:   __STRK__

Decimals: __18__ 

####
The StarkNet Token is a straightforward implementation of the OpenZeppelin reference code.

The access control is following OpenZeppelin AccessControl:
Privileged Roles :
1. DEFAULT_ADMIN_ROLE is an admin role for MINTER_ROLE
2. MINTER_ROLE: is allowed to mint.

### Locked tokens considerations ###
The grants are locked for regulatory reasons.
The lock is enforced by the {LockedTokenGrant} contract.

Global unlock time is shared between all the grants. It's maintained by a centralized contract {LockedTokenCommon}.

The {LockedTokenCommon} contract is also used to deploy the {LockedTokenGrant} and provide them with funds in an atomic manner.

### 1. Locked Token Grants
- A Locked Token grant is a grant of locked tokens, granted to a recipient address.
- They are deployed from `LockedTokenCommon`
- The balance transferred to them is from an approved pool, not from the balance of the LockedTokenCommon itself.
- LockedTokenGrant allows gradual release of tokens to the recipient address.
A locked grant has the following properties:
  -- Start time - the start time when the release of the locked grant starts
  -- Grant amount - the amount of tokens in the grant.
Once the grant start time passes, the locked tokens gradually release at a fixed rate,
over a duration of 4 years.
- A recipient address can receive up to 1 locked token grant.
See _Global time-lock_ and _Exemption from lock_ for "modification" of this behavior.

`LOCKED_GRANT_ADMIN_ROLE` is a role defined on the `LockedTokenCommon` contract.
Account holding `LOCKED_GRANT_ADMIN_ROLE` permission can grant locked tokens.

### 2. Gradual Release
The locked token grant releases gradually and evenly across 4 years
starting from the grant start time.
Before the grant start time, it's 100% locked.

### 3. Global time-lock
The `LockedTokenCommon` maintains a global time-lock
i.e. a common time-lock for all the grants that were allocated by this contract.
Before the global time-lock expires - __ALL__ the locked token grants are __100%__ locked,
__regardless__ of their start time.
- The global time-lock can be changed by an admin. To perform that,
  the admin must hold the `GLOBAL_TIMELOCK_ADMIN_ROLE` rights on the `LockedTokenCommon` contract.
- The global time-lock can be reset to a new timestamp as long as the following conditions are met:
i. The new timestamp is in the future with at least a minimal margin.
ii. The new timestamp does not exceed the global time-lock upper bound.
iii. The global time-lock has not expired yet.

### 4. Exemption from lock
Staking is exempted from locking.
Exact mechanism for StarkNet Token staking is TBD.


### Repository structure:
__src/starkware/isd/third_party__ : OpenZeppelin reference code (v4.7.3).

__src/starkware/isd/solidity__ : StarkNet Token and related contracts solidity source files.

### Build instructions:
`solc-0.8.16 --base-path src/ src/starkware/isd/solidity/StarkNetToken.sol  --optimize-runs=1000000`

