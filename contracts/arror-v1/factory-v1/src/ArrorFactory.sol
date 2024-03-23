pragma solidity ^0.8.17;


import "./ArrorERC404.sol";

contract ArrorFactory{


    function createERC404(string memory name_,
    string memory symbol_,
    uint8 decimals_,
    uint256 maxTotalSupplyERC721_,
    string memory tokenURI1_,
    string memory tokenURI2_,
    string memory tokenURI3_,
    string memory tokenURI4_,
    string memory tokenURI5_) public returns (ArrorERC404) {
        ArrorERC404 newArror = new ArrorERC404(name_, symbol_, decimals_, maxTotalSupplyERC721_, address(this), address(this));
        newArror.setTokenURIs(tokenURI1_, tokenURI2_, tokenURI3_, tokenURI4_, tokenURI5_);
        // _createPair(adrress(newArror), address(WETH));
        return newArror;
        
    }

    function _createPair(address tokenA, address tokenB) internal returns (bool) {

    }
}
