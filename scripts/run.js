const hre = require("hardhat");

const main = async () => {
  const gameContractFactory = await hre.ethers.getContractFactory("MyEpicGame");
  const characterMoves = [
    [
      { name: "Vine Whip", basePower: 45, pokeType: "Grass", accuracy: 100 },
      { name: "Razor Leaf", basePower: 55, pokeType: "Grass", accuracy: 95 },
      { name: "Solar Beam", basePower: 120, pokeType: "Grass", accuracy: 100 },
      { name: "Sludge Bomb", basePower: 90, pokeType: "Poison", accuracy: 100 },
    ],
    [
      { name: "Water Gun", basePower: 40, pokeType: "Water", accuracy: 100 },
      { name: "Bubble", basePower: 20, pokeType: "Water", accuracy: 100 },
      { name: "Hydro Pump", basePower: 110, pokeType: "Water", accuracy: 80 },
      { name: "Ice Beam", basePower: 95, pokeType: "Ice", accuracy: 100 },
    ],
    [
      { name: "Flamethrower", basePower: 90, pokeType: "Fire", accuracy: 100 },
      { name: "Fire Spin", basePower: 35, pokeType: "Fire", accuracy: 85 },
      { name: "Fire Blast", basePower: 110, pokeType: "Fire", accuracy: 85 },
      { name: "Dragon Rage", basePower: 60, pokeType: "Dragon", accuracy: 100 },
    ],
  ];

  const characterData = [
    {
      name: "Bulbasaur",
      imageURI:
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
      hp: 45,
      attack: 49,
      specialAttack: 65,
      defense: 49,
      specialDefense: 65,
      speed: 45,
      pokeType: "Grass",
      ability: "Overgrow",
      individualValues: [31, 31, 31, 31, 31, 31],
      effortValues: [0, 0, 0, 0, 0, 0],
    },
    {
      name: "Squirtle",
      imageURI:
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png",
      hp: 44,
      attack: 48,
      specialAttack: 50,
      defense: 65,
      specialDefense: 50,
      speed: 43,
      pokeType: "Water",
      ability: "Torrent",
      individualValues: [31, 31, 31, 31, 31, 31],
      effortValues: [0, 0, 0, 0, 0, 0],
    },
    {
      name: "Charmander",
      imageURI:
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png",
      hp: 39,
      attack: 52,
      specialAttack: 43,
      defense: 43,
      specialDefense: 50,
      speed: 65,
      pokeType: "Fire",
      ability: "Blaze",
      individualValues: [31, 31, 31, 31, 31, 31],
      effortValues: [    0, 0, 0, 0, 0, 0
      ],
    },
  ];
const gameContract = await gameContractFactory.deploy(
  ["Misty", "Brock", "Ash"],
  [1000, 2000, 3000],
  ["Water Mastery", "Rock Mastery", "Fire Mastery"],
  characterMoves,
  characterData
);
  
await gameContract.deployed();
  console.log("Contract deployed to address:", gameContract.address);
};
  
const runMain = async () => {
  try {
  await main();
  process.exit(0);
} catch (error) {
  console.log(error);
  process.exit(1);
}
};
  
runMain();
    
        
