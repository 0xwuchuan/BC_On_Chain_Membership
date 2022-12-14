// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC721} from "solmate/tokens/ERC721.sol";
import {Ownable} from "solady/auth/Ownable.sol";
import {Base64} from "solady/utils/Base64.sol";

error NonExistentToken();

contract NFSMembership is ERC721, Ownable {
    // Token Id => Token dna
    // Encode each of traits into part of the 7 digit token DNA
    // 0            0           0       0000
    // Background | Department | Role | TokenId
    // 9 possible backgrounds
    // 10 possible departments
    // 10 possible roles for each department
    // Total Supply will be 10000 which is more than enough in the short term for the project

    // Token Id -> block minted
    mapping(uint256 => uint256) public blockMinted;

    constructor() ERC721("NFS Membership", "NFSM") {}

    function mint(address to, uint256 tokenId) external onlyOwner {
        _mint(to, tokenId);
    }

    function tokenURI(uint256 id) public view override returns (string memory) {
        if (ownerOf(id) == address(0)) {
            revert NonExistentToken();
        }

        return string(abi.encode(id));
    }
}
