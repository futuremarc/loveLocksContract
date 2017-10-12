pragma solidity ^0.4.4;

contract Relations{

  Relation[] public relations;

	struct Relation{

		bytes32 firstNameA;
		bytes32 lastNameA;
    bytes32 firstNameB;
		bytes32 lastNameB;

	}

  function addRelation(bytes32 _firstNameA, bytes32 _lastNameA, bytes32 _firstNameB, bytes32 _lastNameB) returns (bool success){

    Relation memory newRelation;
    newRelation.firstNameA = _firstNameA;
    newRelation.lastNameA = _lastNameA;
    newRelation.firstNameB = _firstNameB;
    newRelation.lastNameB = _lastNameB;

    relations.push(newRelation);
    return true;

  }

  function getRelations() constant returns (bytes32[], bytes32[], bytes32[], bytes32[]) {

    uint length = relations.length;

    bytes32[] memory firstNamesA = new bytes32[](length);
    bytes32[] memory lastNamesA = new bytes32[](length);
    bytes32[] memory firstNamesB = new bytes32[](length);
    bytes32[] memory lastNamesB = new bytes32[](length);


    for (uint i = 0; i < relations.length; i++){

      Relation memory currentRelation;
      currentRelation = relations[i];

      firstNamesA[i] = currentRelation.firstNameA;
      lastNamesA[i] = currentRelation.lastNameA;
      firstNamesB[i] = currentRelation.firstNameB;
      lastNamesB[i] = currentRelation.lastNameB;

    }

    return (firstNamesA,lastNamesA,firstNamesB,lastNamesB);

  }

}
