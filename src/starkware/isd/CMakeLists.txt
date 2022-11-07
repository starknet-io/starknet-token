python_lib(isd_token_sol
    PREFIX starkware/isd
    FILES
    solidity/StarkNetToken.sol
    third_party/open_zeppelin/access/AccessControl.sol
    third_party/open_zeppelin/access/IAccessControl.sol
    third_party/open_zeppelin/governance/utils/IVotes.sol
    third_party/open_zeppelin/token/ERC20/ERC20.sol
    third_party/open_zeppelin/token/ERC20/extensions/draft-ERC20Permit.sol
    third_party/open_zeppelin/token/ERC20/extensions/draft-IERC20Permit.sol
    third_party/open_zeppelin/token/ERC20/extensions/ERC20Votes.sol
    third_party/open_zeppelin/token/ERC20/extensions/IERC20Metadata.sol
    third_party/open_zeppelin/token/ERC20/IERC20.sol
    third_party/open_zeppelin/utils/Context.sol
    third_party/open_zeppelin/utils/Counters.sol
    third_party/open_zeppelin/utils/cryptography/draft-EIP712.sol
    third_party/open_zeppelin/utils/cryptography/ECDSA.sol
    third_party/open_zeppelin/utils/introspection/ERC165.sol
    third_party/open_zeppelin/utils/introspection/IERC165.sol
    third_party/open_zeppelin/utils/math/Math.sol
    third_party/open_zeppelin/utils/math/SafeCast.sol
    third_party/open_zeppelin/utils/Strings.sol
    LIBS
)

solidity_env(isd_token_sol_env
    SOLC_BIN solc-0.8.16
    OPTIMIZE_RUNS 1000000
    CONTRACTS
    StarkNetToken
    LIBS
    isd_token_sol
)

python_lib(isd_locked_token_sol
    PREFIX starkware/isd
    FILES
    solidity/TimeLockedTokens.sol
    solidity/CommonConstants.sol
    solidity/DelegationSupport.sol
    solidity/GlobalUnlock.sol
    solidity/LockedTokenCommon.sol
    solidity/LockedTokenGrant.sol
    third_party/open_zeppelin/access/AccessControl.sol
    third_party/open_zeppelin/access/IAccessControl.sol
    third_party/open_zeppelin/governance/utils/IVotes.sol
    third_party/open_zeppelin/token/ERC20/IERC20.sol
    third_party/open_zeppelin/utils/Address.sol
    third_party/open_zeppelin/utils/Context.sol
    third_party/open_zeppelin/utils/introspection/ERC165.sol
    third_party/open_zeppelin/utils/introspection/IERC165.sol
    third_party/open_zeppelin/utils/math/Math.sol
    third_party/open_zeppelin/utils/Strings.sol
    LIBS
)

solidity_env(isd_locked_token_sol_env
    SOLC_BIN solc-0.8.16
    OPTIMIZE_RUNS 1000000
    CONTRACTS
    LockedTokenCommon
    LockedTokenGrant
    LIBS
    isd_locked_token_sol
)

python_lib(isd_token_contracts_lib
    PREFIX starkware/isd
    FILES
    contracts.py

    LIBS
    starkware_contracts_utils_lib

    ARTIFACTS
    "${CMAKE_CURRENT_BINARY_DIR}/StakingContractStub.json solidity/StakingContractStub.json"
    "${CMAKE_CURRENT_BINARY_DIR}/StarkNetToken.json solidity/StarkNetToken.json"
    "${CMAKE_CURRENT_BINARY_DIR}/LockedTokenCommon.json solidity/LockedTokenCommon.json"
    "${CMAKE_CURRENT_BINARY_DIR}/LockedTokenGrant.json solidity/LockedTokenGrant.json"
)
add_dependencies(isd_token_contracts_lib isd_token_sol_env isd_locked_token_sol_env)
