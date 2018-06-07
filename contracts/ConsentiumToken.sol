pragma solidity ^0.4.23;

import "openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol";
import "openzeppelin-solidity/contracts/token/ERC20/PausableToken.sol";

/**
 * @title ConsentiumToken
 * @dev ERC20 Token that can be minted and paused.
 * It is meant to be used in a crowdsale contract.
 */

 contract ConsentiumToken is MintableToken, PausableToken {

  string public constant name = "Consentium Coin";
  string public constant symbol = "CSM";
  uint8 public constant decimals = 18;

}