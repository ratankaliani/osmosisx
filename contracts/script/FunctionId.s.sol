// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {TendermintX} from "../src/TendermintX.sol";

// forge script script/TendermintX.s.sol --verifier etherscan --private-key
// forge verify-contract <address> TendermintX --chain 5 --etherscan-api-key ${ETHERSCAN_API_KEY} --constructor-args "0x000000000000000000000000852a94f8309d445d27222edb1e92a4e83dddd2a8"
contract FunctionIdScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        // Use the below to interact with an already deployed ZK light client.
        TendermintX lightClient = TendermintX(
            0xd4a723C4dd8a961ACcbC5a42f05862C63B32B701
        );

        bytes32 stepFunctionId = hex"792454e5ae5a92d41ee3efca398d779e8e813ab72dccf3794437a5c9a8263cb3";
        bytes32 skipFunctionId = hex"a5e533cf115120b79b2908d6ef416bd47c2a7856b1da90bb452a5e58f8b96413";

        lightClient.updateStepId(stepFunctionId);
        lightClient.updateSkipId(skipFunctionId);
    }
}
