pragma solidity ^0.4.11;

contract LoveLocks{

  LoveLock[] public lovelocks;

	struct LoveLock{

		bytes32 personA;
		bytes32 personB;
    bytes32 message;
    uint8 xPos;
    uint8 yPos;

	}

  function addLoveLock(bytes32 _personA, bytes32 _personB, bytes32 _message, uint8 _xPos, uint8 _yPos) public returns (bool success){

    LoveLock memory newLoveLock;
    newLoveLock.personA = _personA;
    newLoveLock.personB = _personB;
    newLoveLock.message = _message;
    newLoveLock.xPos = _xPos;
    newLoveLock.yPos = _yPos;
    lovelocks.push(newLoveLock);
    return true;

  }

  function getLoveLocks() public constant returns (bytes32[], bytes32[], bytes32[], uint8[],uint8[]) {

    uint length = lovelocks.length;

    bytes32[] memory personsA = new bytes32[](length);
    bytes32[] memory personsB = new bytes32[](length);
    bytes32[] memory messages = new bytes32[](length);
    uint8[] memory xPoses = new uint8[](length);
    uint8[] memory yPoses = new uint8[](length);


    for (uint i = 0; i < lovelocks.length; i++){

      LoveLock memory currentLoveLock;
      currentLoveLock = lovelocks[i];

      personsA[i] = currentLoveLock.personA;
      personsB[i] = currentLoveLock.personB;
      messages[i] = currentLoveLock.message;
      xPoses[i] = currentLoveLock.xPos;
      yPoses[i] = currentLoveLock.yPos;

    }

    return (personsA,personsB,messages,xPoses,yPoses);
  }
}
