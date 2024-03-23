//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./ArrorERC404.sol";
import "Dyson-Finance-V1/interface/IFactory.sol";
import "Dyson-Finance-V1/interface/IRouter.sol";

contract ArrorFactory{
    IFactory internal immutable dysonFactory;
    IRouter internal immutable dysonRouter;

    constructor(address _dysonFactory, address _dysonRouter) {
        dysonRouter = IRouter(_dysonRouter);
        dysonFactory = IFactory(_dysonFactory);
    }

    function createERC404(string memory name_,
    string memory symbol_,
    uint8 decimals_,
    uint256 maxTotalSupplyERC721_,
    string memory tokenURI1_,
    string memory tokenURI2_,
    string memory tokenURI3_,
    string memory tokenURI4_,
    string memory tokenURI5_,
    address tokenB_) public returns (address) {
        ArrorERC404 newArror = new ArrorERC404(name_, symbol_, decimals_, maxTotalSupplyERC721_, address(this), address(this));
        newArror.setTokenURIs(tokenURI1_, tokenURI2_, tokenURI3_, tokenURI4_, tokenURI5_);
        _createPair(address(newArror), tokenB_);
        return address(newArror);
    }

    function _createPair(address tokenA, address tokenB) internal  {
        address pair = dysonFactory.createPair(tokenA, tokenB);
        require(pair != address(0), "Factory: PAIR_EXISTS");
    }
}
