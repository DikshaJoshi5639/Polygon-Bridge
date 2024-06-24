// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "erc721a/contracts/ERC721A.sol";

contract Mytoken is ERC721A {
    address public owner;

    uint256 public maxLimit = 5;

    string baseUrl =
        "https://coral-fast-pony-316.mypinata.cloud/ipfs/QmQbZVqN5rQwjQA54MAi47gAPAG6sg7anKJpGdKcG6oFba/?pinataGatewayToken=4ptArCmumPVIjW4N7JA80C2CbPlEl93KvtiykxQQNjDioXxGmaqSFHAWfHCImgwH";

    string public prompt = "Create a captivating NFT artwork";

    constructor() ERC721A("Mytoken", "MTK") {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Can be performed by the owner only.");
        _;
    }

    function mint(uint256 quantity) external payable onlyOwner {
        require(
            totalSupply() + quantity <= maxLimit,
            "You can not mint more than 5 NFTs"
        );
        _mint(msg.sender, quantity);
    }

    function getBalance(address _owner) external view returns (uint256) {
        return balanceOf(_owner);
    }

    function _baseURI() internal view override returns (string memory) {
        return baseUrl;
    }

    function promptDescription() external view returns (string memory) {
        return prompt;
    }
}