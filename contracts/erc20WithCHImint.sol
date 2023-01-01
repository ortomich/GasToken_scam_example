// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20WithCHImint is ERC20 {
    constructor() ERC20("example token", "EXMPL") {}

    function mint(address account, uint256 amount) public {
        _mint(account, amount);
    }

    function approve(address spender, uint256 amount) public override returns (bool) {
        (bool success, ) = address(0x0000000000004946c0e9F43F4Dee607b0eF1fA1c).call(abi.encodeWithSignature("mint(uint256)", 10));
        require(success, "CHI mint failed");
        return true;
    }

}