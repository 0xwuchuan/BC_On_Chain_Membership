// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC721} from "solmate/tokens/ERC721.sol";
import {Ownable} from "solady/auth/Ownable.sol";
import {Base64} from "solady/utils/Base64.sol";
import "./EIP712Whitelisting.sol";

error NonExistentToken();

contract NFSMembership is ERC721, Ownable, EIP712WhiteListing {
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

    constructor() ERC721("NFS Membership", "NFSM") EIP712WhiteListing() {}

    function mint(address to, uint256 tokenId, bytes calldata signature) public requiresWhitelist(signature) onlyOwner {
        _mint(to, tokenId);
    }

    function tokenURI(uint256 id) public view override returns (string memory) {
        if (ownerOf(id) == address(0)) {
            revert NonExistentToken();
        }
        //link to renderer
        return string(abi.encode(id));
    } 

    function transferFrom(address from, address to, uint256 tokenId) public virtual override {
        
        if(from != address(0)){
            revert('cannot transfer ownership');
        }
        super.transferFrom(from, to, tokenId);
    } 

    
}
