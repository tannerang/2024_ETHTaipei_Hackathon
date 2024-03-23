//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./ArrorERC404.sol";
import "Dyson-Finance-V1/interface/IFactory.sol";

interface IRouter {
    event TransferOwnership(address newOwner);

    function WETH() external view returns (address);
    function DYSON_FACTORY() external view returns (address);
    function CODE_HASH() external view returns (bytes32);
    function owner() external view returns (address);
    function transferOwnership(address _owner) external;
    function rely(
        address tokenAddress,
        address contractAddress,
        bool enable
    ) external;
    function rescueERC20(
        address tokenAddress,
        address to,
        uint256 amount
    ) external;
    function swap(
        address tokenIn,
        address tokenOut,
        uint index,
        address to,
        uint input,
        uint minOutput
    ) external returns (uint output);
    function swapETHIn(
        address tokenOut,
        uint index,
        address to,
        uint minOutput
    ) external payable returns (uint output);
    function swapETHOut(
        address tokenIn,
        uint index,
        address to,
        uint input,
        uint minOutput
    ) external returns (uint output);
    function deposit(
        address tokenIn,
        address tokenOut,
        uint index,
        address to,
        uint input,
        uint minOutput,
        uint time
    ) external returns (uint output);
    function depositETH(
        address tokenOut,
        uint index,
        address to,
        uint minOutput,
        uint time
    ) external payable returns (uint output);
    function withdraw(
        address pair,
        uint index,
        address to
    ) external returns (uint token0Amt, uint token1Amt);
    function withdrawETH(
        address pair,
        uint index,
        address to
    ) external returns (uint token0Amt, uint token1Amt);
    function fairPrice(
        address pair,
        uint token0Amt
    ) external view returns (uint token1Amt);
    function setApprovalForAllWithSig(
        address pair,
        bool approved,
        uint deadline,
        bytes calldata sig
    ) external;
    function withdrawMultiPositions(
        address[] calldata pairs,
        uint[] calldata indexes,
        address[] calldata tos
    )
        external
        returns (uint[] memory token0Amounts, uint[] memory token1Amounts);
    function multicall(
        bytes[] calldata data
    ) external returns (bytes[] memory results);
    function selfPermit(
        address token,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;
    function stakeDyson(
        address to,
        uint amount,
        uint lockDuration
    ) external returns (uint sDYSONAmount);
    function depositToGauge(address gauge, uint amount, address to) external;
    function swapWithMultiHops(
        address[] calldata tokens,
        uint[] calldata indexes,
        address to,
        uint input,
        uint minOutput
    ) external returns (uint output);
    function swapETHInWithMultiHops(
        address[] calldata tokens,
        uint[] calldata indexes,
        address to,
        uint minOutput
    ) external payable returns (uint output);
    function swapETHOutWithMultiHops(
        address[] calldata tokens,
        uint[] calldata indexes,
        address to,
        uint input,
        uint minOutput
    ) external returns (uint output);
}

contract ArrorFactory {
    IFactory internal immutable dysonFactory;
    IRouter internal immutable dysonRouter;

    constructor(address _dysonFactory, address _dysonRouter) {
        dysonRouter = IRouter(_dysonRouter);
        dysonFactory = IFactory(_dysonFactory);
    }

    function createERC404(
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        uint256 maxTotalSupplyERC721_,
        string memory tokenURI1_,
        string memory tokenURI2_,
        string memory tokenURI3_,
        string memory tokenURI4_,
        string memory tokenURI5_,
        address tokenB_
    ) public returns (address) {
        ArrorERC404 newArror = new ArrorERC404(
            name_,
            symbol_,
            decimals_,
            maxTotalSupplyERC721_,
            address(this),
            address(this)
        );
        newArror.setTokenURIs(
            tokenURI1_,
            tokenURI2_,
            tokenURI3_,
            tokenURI4_,
            tokenURI5_
        );
        _createPair(address(newArror), tokenB_);
        return address(newArror);
    }

    function _createPair(address tokenA, address tokenB) internal {
        address pair = dysonFactory.createPair(tokenA, tokenB);
        require(pair != address(0), "Factory: PAIR_EXISTS");
    }
}
