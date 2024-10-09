pragma solidity ^0.8.0;

contract VotingSystem {
  // Mapping of candidates to vote counts
  mapping (bytes32 => uint256) public votes;

  // Mapping of voters to their chosen candidate
  mapping (address => bytes32) public voterChoices;

  // Array of registered candidates
  bytes32[] public candidates;

  // Event emitted when a vote is cast
  event VoteCast(address voter, bytes32 candidate);

  // Function to register a candidate
  function registerCandidate(bytes32 _candidate) public {
    candidates.push(_candidate);
  }

  // Function to cast a vote
  function vote(bytes32 _candidate) public {
    // Check if voter has already voted
    require(voterChoices[msg.sender] == "", "Voter has already voted");

    // Update voter's choice
    voterChoices[msg.sender] = _candidate;

    // Increment candidate's vote count
    votes[_candidate]++;

    // Emit event
    emit VoteCast(msg.sender, _candidate);
  }

  // Function to get vote count for a candidate
  function getVoteCount(bytes32 _candidate) public view returns (uint256) {
    return votes[_candidate];
  }
}
