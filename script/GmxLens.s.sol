// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "utils/BaseScript.sol";
import "lenses/GmxLens.sol";

contract GmxLensScript is BaseScript {
    function deploy() public returns (GmxLens lens) {
        if (block.chainid == ChainId.Arbitrum) {
            vm.startBroadcast();

            lens = new GmxLens(
                IGmxGlpManager(constants.getAddress("arbitrum.gmx.glpManager")),
                IGmxVault(constants.getAddress("arbitrum.gmx.vault"))
            );

            vm.stopBroadcast();
        } else {
            revert("chain not supported");
        }
    }
}
