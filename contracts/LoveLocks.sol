pragma solidity ^0.4.11;

contract LoveLocks{

  LoveLock[] public lovelocks;

	struct LoveLock{
    bytes8 color;
	  bytes32 personA;
    bytes32 personB;
    bytes32 message1;
    bytes32 message2;
    bytes32 message3;
    bytes32 message4;
    uint8 xPos;
    uint8 yPos;
    address id;
	}

  function addLoveLock(bytes8 _color, bytes32 _personA, bytes32 _personB, bytes32 _message1, bytes32 _message2, bytes32 _message3,bytes32 _message4, uint8 _xPos, uint8 _yPos, address _id) public returns (bool success){
    LoveLock memory newLoveLock;
    newLoveLock.color = _color;
    newLoveLock.personA = _personA;
    newLoveLock.personB = _personB;
    newLoveLock.message1 = _message1;
    newLoveLock.message2 = _message2;
    newLoveLock.message3 = _message3;
    newLoveLock.message4 = _message4;
    newLoveLock.xPos = _xPos;
    newLoveLock.yPos = _yPos;
    newLoveLock.id = _id;
    lovelocks.push(newLoveLock);
    return true;
  }

  function getLoveLocks() public constant returns (bytes8[], bytes32[], bytes32[], uint8[],uint8[],address[]) {
    uint length = lovelocks.length;
    bytes8[] memory colors = new bytes8[](length);
    bytes32[] memory personsA = new bytes32[](length);
    bytes32[] memory personsB = new bytes32[](length);
    uint8[] memory xPoses = new uint8[](length);
    uint8[] memory yPoses = new uint8[](length);
    address[] memory ids = new address[](length);

    for (uint i = 0; i < lovelocks.length; i++){

      LoveLock memory currentLoveLock;
      currentLoveLock = lovelocks[i];

      colors[i] = currentLoveLock.color;
      personsA[i] = currentLoveLock.personA;
      personsB[i] = currentLoveLock.personB;
      xPoses[i] = currentLoveLock.xPos;
      yPoses[i] = currentLoveLock.yPos;
      ids[i] = currentLoveLock.id;
    }
    return (colors, personsA,personsB,xPoses,yPoses,id);
  }

  function getLoveLockMsgs() public constant returns ( bytes32[], bytes32[], bytes32[], bytes32[]) {
    uint length = lovelocks.length;
    bytes32[] memory messages1 = new bytes32[](length);
    bytes32[] memory messages2 = new bytes32[](length);
    bytes32[] memory messages3 = new bytes32[](length);
    bytes32[] memory messages4 = new bytes32[](length);

    for (uint i = 0; i < lovelocks.length; i++){

      LoveLock memory currentLoveLock;
      currentLoveLock = lovelocks[i];

      messages1[i] = currentLoveLock.message1;
      messages2[i] = currentLoveLock.message2;
      messages3[i] = currentLoveLock.message3;
      messages4[i] = currentLoveLock.message4;

    }
    return (messages1,messages2,messages3,messages4);
  }

}
