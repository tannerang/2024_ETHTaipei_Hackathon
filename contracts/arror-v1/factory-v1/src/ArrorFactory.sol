pragma solidity ^0.8.17;


import "./ArrorERC404.sol";

contract ArrorFactory{


    function createERC404(string memory name_,
    string memory symbol_,
    uint8 decimals_,
    uint256 maxTotalSupplyERC721_) public returns (ERC404) {
        ArrorERC404 newArror = new ArrorERC404(name, symbol, decimals_, maxTotalSupplyERC721_, msg.sender, msg.sender);
        newArror.setTokenURI();
        _createPair(adrress(newArror), address(WETH));
    }

    function _createPair(address tokenA, address tokenB) internal returns (bool) {

    }
}
