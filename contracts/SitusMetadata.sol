// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.20;

import {ISitusMetadataStore} from "./interfaces/ISitusMetadataStore.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

/// @title SITUS Metadata contract
/// @author TMO (adapted from Tempe Techie)
/// @notice Contract that returns metadata for SITUS OG contracts.
contract SitusMetadata is ISitusMetadataStore {
    // READ
    function getMetadata(
        address _tldAddress,
        string calldata /* _domainName */,
        string calldata /* _tld */,
        uint256 _tokenId
    ) public pure returns (string memory) {
        return string(
            abi.encodePacked(
                "https://ensitus.xyz/api/metadata/",
                Strings.toHexString(uint160(_tldAddress)),
                "/",
                Strings.toString(_tokenId)
            )
        );
    }
} 