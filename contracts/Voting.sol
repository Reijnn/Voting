pragma solidity ^0.4.10;

contract Voting {
  mapping (bytes32 => uint8) public votesReceived;
  bytes32[] public candidateList;

  function Voting(bytes32[] candidateNames) {
    candidateList = candidateNames;
  }

  function totalVotesFor(bytes32 candidate) returns (uint8) {
    assert(validCandidate(candidate));
    return votesReceived[candidate];
  }

  function getCandidates() returns (bytes32[]) {
    return candidateList;
  }

  function voteForCandidate(bytes32 candidate) {
    assert(validCandidate(candidate));
    votesReceived[candidate] += 1;
  }

  function validCandidate(bytes32 candidate) returns (bool) {
    for(uint i = 0; i < candidateList.length; i++) {
      if (candidateList[i] == candidate) {
        return true;
      }
    }
    return false;
  }
}

