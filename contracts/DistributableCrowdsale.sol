pragma solidity ^0.4.23;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";
import "openzeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "openzeppelin-solidity/contracts/crowdsale/distribution/FinalizableCrowdsale.sol";
import "./PausableTokenCrowdsale.sol";

/**
* @title DistributableCrowdsale
* @dev This contract distributes tokens to the particular addresses when finishes.
*/
contract DistributableCrowdsale is FinalizableCrowdsale, MintedCrowdsale, PausableTokenCrowdsale {

    using SafeMath for uint256;

    address public teamWallet;

    /**
    * @dev Constructor, set addresses
    * @param _teamWallet Address of the management team
    */
    constructor(address _teamWallet) public {
        teamWallet = _teamWallet;
    }

    /**
    * @dev Override for function that finish a crowdsale
    * Distribute tokens to the addresses and finish minting
    */
    function finalization() internal {
        
        // Get all tokens
        uint256 totalSupply = MintableToken(token).totalSupply();
        // 30% to the team
        uint256 teamTokens = totalSupply.mul(30).div(100);

        require(MintableToken(token).mint(teamWallet, teamTokens)
                && MintableToken(token).finishMinting());

        // Also it unpauses distribution of the token
        unpauseToken();
    }
}