// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract MyEpicGame {
    struct MoveParams {
        string name;
        uint basePower;
        string pokeType;
        uint accuracy;
    }

    struct CharacterAttributes {
        uint characterIndex;
        string name;
        string imageURI;
        uint hp;
        uint maxHp;
        uint attack;
        uint specialAttack;
        uint defense;
        uint specialDefense;
        uint speed;
        uint bondLevel;
    }

    struct SecondaryCharacterAttributes {
        uint characterIndex;
        string pokeType;
        string ability;
        uint16[] individualValues;
        uint16[] effortValues;
    }

    struct TrainerAttributes {
        string name;
        uint experience;
        string uniqueAbility;
    }

    struct CharacterInitParams {
        string name;
        string imageURI;
        uint hp;
        uint attack;
        uint specialAttack;
        uint defense;
        uint specialDefense;
        uint speed;
        string pokeType;
        string ability;
        uint16[] individualValues;
        uint16[] effortValues;
    }

    struct TrainerInitParams {
        string name;
        uint experience;
        string uniqueAbility;
    }

    CharacterAttributes[] defaultCharacters;
    SecondaryCharacterAttributes[] defaultSecondaryAttributes;
    TrainerAttributes[] trainerAttributes;
    mapping(uint => MoveParams[]) characterMoves;

    constructor(
        
        string[] memory trainerNames,
        uint[] memory trainerExperience,
        string[] memory trainerUniqueAbilities,
        MoveParams[4][] memory characterMovesParams,
        CharacterInitParams[] memory charactersData
    ) {
        require(trainerNames.length == trainerExperience.length && trainerNames.length == trainerUniqueAbilities.length, "Mismatched trainer data lengths.");
        
        for (uint i = 0; i < charactersData.length; i += 1) {
            CharacterAttributes memory newCharacter = CharacterAttributes({
                characterIndex: i,
                name: charactersData[i].name,
                imageURI: charactersData[i].imageURI,
                hp: charactersData[i].hp,
                maxHp: charactersData[i].hp,
                attack: charactersData[i].attack,
                specialAttack: charactersData[i].specialAttack,
                defense: charactersData[i].defense,
                specialDefense: charactersData[i].specialDefense,
                speed: charactersData[i].speed,
                bondLevel: 0
            });

            // Assign moves one by one
            for (uint j = 0; j < 4; j++) {
                characterMoves[i].push(characterMovesParams[i][j]);
            }

            defaultCharacters.push(newCharacter);

            defaultSecondaryAttributes.push(SecondaryCharacterAttributes({
                characterIndex: i,
                pokeType: charactersData[i].pokeType,
                ability: charactersData[i].ability,
                individualValues: charactersData[i].individualValues,
                effortValues: charactersData[i].effortValues
            }));
        }

        for (uint i = 0; i < trainerNames.length; i += 1) {
            trainerAttributes.push(TrainerAttributes({
                name: trainerNames[i],
                experience: trainerExperience[i],
                uniqueAbility: trainerUniqueAbilities[i]
            }));
        }

        for (uint i = 0; i < charactersData.length; i += 1) {
            CharacterAttributes memory c = defaultCharacters[i];
            SecondaryCharacterAttributes memory s = defaultSecondaryAttributes[i];
            console.log("Character initialized: %s with %s HP, img %s", c.name, c.hp, c.imageURI);
            console.log("Secondary attributes: type %s, ability %s", s.pokeType, s.ability);
        }
        // After initializing characters and trainers, log the trainers with their respective pokemons
        for (uint i = 0; i < trainerNames.length; i++) {
            if (i == 0) {
                console.log("Trainer %s has pokemons: %s", trainerNames[i], defaultCharacters[1].name);
            } else if (i == 1) {
                console.log("Trainer %s has pokemons: %s", trainerNames[i], defaultCharacters[2].name);
            } else if (i == 2) {
                console.log("Trainer %s has pokemons: %s", trainerNames[i], defaultCharacters[0].name);
            }
        }
    }
}
