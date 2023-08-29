-----------------------------------------------------
-- Створимо курсовий проект на тему "TerrariaGame" --
-----------------------------------------------------
-- Для початку створимо загальні команди створення, видалення та використання бази данних.
--
--
DROP DATABASE TerrariaGame
--
GO
CREATE DATABASE TerrariaGame
GO
USE TerrariaGame
GO 
---------------------------------------------------------------------------------------
-- Создание таблиц
CREATE TABLE Terraria_Player (
    PlayerID NVARCHAR(100) PRIMARY KEY,
    PlayerName NVARCHAR(100),
    CharacterType NVARCHAR(100),
    Difficulty NVARCHAR(100),
    Health NVARCHAR(100),
    Mana NVARCHAR(100),
    AttackPower NVARCHAR(100),
    Defense NVARCHAR(100),
    Gold NVARCHAR(100),
    Experience NVARCHAR(100)
);
GO

CREATE TABLE Terraria_Locations (
    LocationID INT IDENTITY(1,1) PRIMARY KEY,
    LocationName NVARCHAR(100),
    BiomeType NVARCHAR(100),
    TerrainType NVARCHAR(100),
    Size NVARCHAR(100),
    MainResource NVARCHAR(100),
    Accessible NVARCHAR(100),
    SpecialFeatures NVARCHAR(100),
    Underground NVARCHAR(100),
    FloatingIsland NVARCHAR(100),
    PlayerID NVARCHAR(100) REFERENCES Terraria_Player(PlayerID)
);
GO

CREATE TABLE Terraria_NPCS (
    NPCID INT IDENTITY(1,1) PRIMARY KEY,
    NPCName NVARCHAR(100),
    NPCTitle NVARCHAR(100),
    HomeLocation NVARCHAR(100),
    Profession NVARCHAR(100),
    Dialogue NVARCHAR(100),
    Vendor NVARCHAR(100),
    QuestGiver NVARCHAR(100),
    FriendshipLevel NVARCHAR(100),
    GiftsReceived NVARCHAR(100),
    PlayerID NVARCHAR(100) REFERENCES Terraria_Player(PlayerID),
    LocationID INT REFERENCES Terraria_Locations(LocationID)
);
GO

CREATE TABLE Terraria_Items (
    ItemID INT IDENTITY(1,1) PRIMARY KEY,
    ItemName NVARCHAR(100),
    ItemType NVARCHAR(100),
    Rarity NVARCHAR(100),
    DescriptionItem NVARCHAR(100),
    CraftingMaterials NVARCHAR(100),
    CraftingStation NVARCHAR(100),
    CraftingRecipe NVARCHAR(100),
    Price NVARCHAR(100),
    Consumable NVARCHAR(100),
    PlayerID NVARCHAR(100) REFERENCES Terraria_Player(PlayerID),
    LocationID INT REFERENCES Terraria_Locations(LocationID),
    NPCID INT REFERENCES Terraria_NPCS(NPCID)
);
GO

CREATE TABLE Terraria_Pets (
    PetID INT IDENTITY(1,1) PRIMARY KEY,
    PetName NVARCHAR(100),
    PetType NVARCHAR(100),
    SourcePets NVARCHAR(100),
    Requirements NVARCHAR(100),
    SpecialAbility NVARCHAR(100),
    FavoriteFood NVARCHAR(100),
    Happiness NVARCHAR(100),
    Unlocked NVARCHAR(100),
    Rarity NVARCHAR(100),
    PlayerID NVARCHAR(100) REFERENCES Terraria_Player(PlayerID)
);
GO

CREATE TABLE Terraria_Vehicles (
    VehicleID INT IDENTITY(1,1) PRIMARY KEY,
    VehicleName NVARCHAR(100),
    VehicleType NVARCHAR(100),
    Speed NVARCHAR(100),
    Capacity NVARCHAR(100),
    Fuel NVARCHAR(100),
    CraftingMaterials NVARCHAR(100),
    RequiredBiome NVARCHAR(100),
    SpecialAbilities NVARCHAR(100),
    Mountable NVARCHAR(100),
    PlayerID NVARCHAR(100) REFERENCES Terraria_Player(PlayerID)
);
GO

CREATE TABLE Terraria_Bosses (
    BossID INT IDENTITY(1,1) PRIMARY KEY,
    BossName NVARCHAR(100),
    BossType NVARCHAR(100),
    SpawnLocation NVARCHAR(100),
    Health NVARCHAR(100),
    Damage NVARCHAR(100),
    Defense NVARCHAR(100),
    Attacks NVARCHAR(100),
    Loot NVARCHAR(100),
    SummonItem NVARCHAR(100),
    PlayerID NVARCHAR(100) REFERENCES Terraria_Player(PlayerID),
    LocationID INT REFERENCES Terraria_Locations(LocationID)
);
GO

CREATE TABLE Terraria_Enemies (
    EnemyID INT IDENTITY(1,1) PRIMARY KEY,
    EnemyName NVARCHAR(100),
    EnemyType NVARCHAR(100),
    Habitat NVARCHAR(100),
    Hostile NVARCHAR(100),
    HP NVARCHAR(100),
    Damage NVARCHAR(100),
    Defense NVARCHAR(100),
    Loot NVARCHAR(100),
    RareDropChance NVARCHAR(100),
    LocationID INT REFERENCES Terraria_Locations(LocationID)
);
GO

CREATE TABLE Terraria_Weather (
    WeatherID INT IDENTITY(1,1) PRIMARY KEY,
    WeatherName NVARCHAR(100),
    BiomeType NVARCHAR(100),
    Effects NVARCHAR(100),
    Duration NVARCHAR(100),
    WindSpeed NVARCHAR(100),
    RainChance NVARCHAR(100),
    ThunderstormChance NVARCHAR(100),
    SandstormChance NVARCHAR(100),
    BlizzardChance NVARCHAR(100),
    LocationID INT REFERENCES Terraria_Locations(LocationID)
);
GO

CREATE TABLE Terraria_CraftingRecipes (
    RecipeID INT IDENTITY(1,1) PRIMARY KEY,
    RecipeName NVARCHAR(100),
    CraftingStation NVARCHAR(100),
    ResultItem NVARCHAR(100),
    ResultQuantity NVARCHAR(100),
    PlayerID NVARCHAR(100) REFERENCES Terraria_Player(PlayerID),
    LocationID INT REFERENCES Terraria_Locations(LocationID),
    NPCID INT REFERENCES Terraria_NPCS(NPCID),
    ItemID INT REFERENCES Terraria_Items(ItemID)
);
GO

-- Вставка даних у таблицю Terraria_Player
INSERT INTO Terraria_Player (PlayerID, PlayerName, CharacterType, Difficulty, Health, Mana, AttackPower, Defense, Gold, Experience)
VALUES
    ('player1', 'Player One', 'Warrior', 'Hard', '100', '50', '20', '15', '1000', '5000'),
    ('player2', 'Player Two', 'Mage', 'Normal', '80', '100', '10', '10', '500', '3000'),
    ('player3', 'Player Three', 'Ranger', 'Easy', '120', '75', '25', '12', '1500', '2500'),
    ('player4', 'Player Four', 'Summoner', 'Normal', '90', '80', '15', '8', '800', '4500'),
    ('player5', 'Player Five', 'Warrior', 'Hard', '110', '60', '22', '18', '1200', '4000'),
    ('player6', 'Player Six', 'Mage', 'Normal', '70', '120', '12', '8', '600', '6000'),
    ('player7', 'Player Seven', 'Ranger', 'Easy', '130', '70', '18', '10', '700', '3500'),
    ('player8', 'Player Eight', 'Summoner', 'Normal', '95', '85', '14', '6', '900', '5500'),
    ('player9', 'Player Nine', 'Warrior', 'Hard', '105', '55', '24', '20', '1100', '5200'),
    ('player10', 'Player Ten', 'Mage', 'Normal', '75', '110', '16', '9', '550', '2800');

-- Вставка даних у таблицю Terraria_Locations
INSERT INTO Terraria_Locations (LocationName, BiomeType, TerrainType, Size, MainResource, Accessible, SpecialFeatures, Underground, FloatingIsland, PlayerID)
VALUES
    ('Forest', 'Forest', 'Flat', 'Medium', 'Wood', 'Yes', 'None', 'No', 'No', 'player1'),
    ('Desert', 'Desert', 'Sandy', 'Large', 'Sand', 'Yes', 'Cactus', 'Yes', 'No', 'player2'),
    ('Jungle', 'Jungle', 'Hilly', 'Medium', 'Jungle Spores', 'No', 'Jungle Temple', 'No', 'No', 'player3'),
    ('Snow Biome', 'Snow', 'Icy', 'Small', 'Ice Blocks', 'Yes', 'Ice Castle', 'Yes', 'No', 'player4'),
    ('Ocean', 'Ocean', 'Watery', 'Huge', 'Coral', 'Yes', 'Sunken Ship', 'No', 'Yes', 'player5'),
    ('Underground', 'Cavern', 'Rocky', 'Large', 'Ores', 'No', 'Crystal Hearts', 'Yes', 'No', 'player6'),
    ('Sky Islands', 'Floating', 'Floating', 'Small', 'Clouds', 'No', 'Floating Islands', 'No', 'Yes', 'player7'),
    ('Hell', 'Hell', 'Fiery', 'Huge', 'Hellstone', 'Yes', 'Demon Altar', 'No', 'No', 'player8'),
    ('Corruption', 'Corruption', 'Corrupted', 'Medium', 'Shadow Orbs', 'Yes', 'Ebonstone', 'No', 'No', 'player9'),
    ('Crimson', 'Crimson', 'Bloody', 'Medium', 'Crimtane', 'Yes', 'Crimson Heart', 'No', 'No', 'player10');

	-- Вставка даних у таблицю Terraria_NPCS
INSERT INTO Terraria_NPCS (NPCName, NPCTitle, HomeLocation, Profession, Dialogue, Vendor, QuestGiver, FriendshipLevel, GiftsReceived, PlayerID, LocationID)
VALUES
    ('Guide', 'The Guide', 'Spawn Point', 'Guide', 'Hello, I can help you get started.', 'Yes', 'Yes', 'Friendly', 'Potions', 'player1', 1),
    ('Merchant', 'The Merchant', 'Forest', 'Merchant', 'Buy something or leave me alone.', 'Yes', 'No', 'Neutral', 'Coins', 'player2', 2),
    ('Nurse', 'The Nurse', 'Underground', 'Nurse', 'Need some medical attention?', 'No', 'No', 'Friendly', 'Bandages', 'player3', 6),
    ('Arms Dealer', 'The Arms Dealer', 'Desert', 'Arms Dealer', 'Want to buy some illegal gun parts?', 'Yes', 'No', 'Neutral', 'Bullets', 'player4', 3),
    ('Demolitionist', 'The Demolitionist', 'Forest', 'Demolitionist', 'Watch out for those explosives!', 'Yes', 'No', 'Neutral', 'Dynamite', 'player5', 1),
    ('Dryad', 'The Dryad', 'Jungle', 'Dryad', 'The jungle grows restless...', 'No', 'No', 'Friendly', 'Seeds', 'player6', 3),
    ('Dye Trader', 'The Dye Trader', 'Ocean', 'Dye Trader', 'You need the finest dyes?', 'No', 'No', 'Neutral', 'Dyes', 'player7', 4),
    ('Truffle', 'The Truffle', 'Mushroom Biome', 'Truffle', 'I can sell you mushroom-themed goods.', 'Yes', 'No', 'Friendly', 'Mushrooms', 'player8', 6),
    ('Witch Doctor', 'The Witch Doctor', 'Jungle', 'Witch Doctor', 'I sense a powerful energy around you.', 'No', 'Yes', 'Neutral', 'Insects', 'player9', 3),
    ('Steampunker', 'The Steampunker', 'Snow Biome', 'Steampunker', 'I can provide you with technology from another world.', 'Yes', 'No', 'Neutral', 'Gears', 'player10', 4);

-- Вставка даних у таблицю Terraria_Items
INSERT INTO Terraria_Items (ItemName, ItemType, Rarity, DescriptionItem, CraftingMaterials, CraftingStation, CraftingRecipe, Price, Consumable, PlayerID, LocationID, NPCID)
VALUES
    ('Iron Sword', 'Weapon', 'Common', 'A basic iron sword.', 'Iron Bar', 'Anvil', 'Iron Bar x10', '100', 'No', 'player1', 5, 1),
    ('Topaz Staff', 'Weapon', 'Common', 'A staff set with a topaz gem.', 'Topaz, Wood', 'Anvil', 'Topaz x5, Wood x10', '150', 'No', 'player2', 3, 2),
    ('Healing Potion', 'Potion', 'Common', 'Restores a small amount of health.', 'Gel, Mushroom', 'Bottled Water, Alchemy Table', 'Gel x5, Mushroom x1', '50', 'Yes', 'player3', 6, 3),
    ('Musket', 'Weapon', 'Uncommon', 'A standard musket.', 'Musket Ball, Iron Bar', 'Anvil', 'Musket Ball x20, Iron Bar x10', '250', 'No', 'player4', 3, 4),
    ('Dynamite', 'Explosive', 'Uncommon', 'A bundle of dynamite sticks.', 'Dynamite, Gel', 'Work Bench', 'Dynamite x5, Gel x5', '75', 'Yes', 'player5', 1, 5),
    ('Natures Gift', 'Accessory', 'Rare', 'A gift from the Dryad.', 'Jungle Spores, Stinger', 'Tinkerers Workshop', 'Jungle Spores x10, Stinger x5', '300', 'No', 'player6', 3, 6),
    ('Green Dye', 'Dye', 'Common', 'A bottle of green dye.', 'Mushroom, Gel', 'Dye Vat', 'Mushroom x3, Gel x5', '25', 'No', 'player7', 4, 7),
    ('Autohammer', 'Tool', 'Rare', 'Automatically hammers nearby placed objects.', 'Hallowed Bar, Souls of Might', 'Mythril Anvil', 'Hallowed Bar x10, Souls of Might x5', '500', 'No', 'player8', 4, 8),
    ('Tiki Totem', 'Summoning', 'Uncommon', 'Summons a tiki minion to fight for you.', 'Wood, Vine', 'Mythril Anvil', 'Wood x15, Vine x5', '150', 'No', 'player9', 3, 9),
    ('Steampunk Wings', 'Wings', 'Rare', 'Mechanical wings that emit steam.', 'Feather, Jetpack', 'Tinkerers Workshop', 'Feather x20, Jetpack x1', '800', 'No', 'player10', 4, 10);

-- Вставка даних у таблицю Terraria_Pets
INSERT INTO Terraria_Pets (PetName, PetType, SourcePets, Requirements, SpecialAbility, FavoriteFood, Happiness, Unlocked, Rarity, PlayerID)
VALUES
    ('Buddy', 'Dog', 'Purchased from Pet Merchant', 'Gold Coins', 'Increases player movement speed.', 'Meat', 'Happy', 'Yes', 'Common', 'player1'),
    ('Whiskers', 'Cat', 'Found in a chest', 'None', 'Scares away mice and rats.', 'Fish', 'Excited', 'Yes', 'Uncommon', 'player2'),
    ('Bubbles', 'Fish', 'Reward from Fishing Quest', 'Complete Fishing Quests', 'Grants water breathing to the player.', 'Worm', 'Joyful', 'No', 'Rare', 'player3'),
    ('Spike', 'Hedgehog', 'Purchased from Zookeeper NPC', 'Zoo Tokens', 'Rolls up into a ball when player takes damage.', 'Apples', 'Content', 'Yes', 'Uncommon', 'player4'),
    ('Wiggles', 'Worm', 'Dropped by Giant Worm', 'Defeat a Giant Worm boss', 'Provides extra bait power while fishing.', 'Dirt Block', 'Playful', 'No', 'Rare', 'player5'),
    ('Gusty', 'Parrot', 'Purchased from Pirate', 'Pirate Map', 'Repeats Pirates voice lines.', 'Pirate Food', 'Curious', 'No', 'Uncommon', 'player6'),
    ('Shimmer', 'Fairy', 'Found in Glowing Mushroom biome', 'Explore the Glowing Mushroom biome', 'Illuminates dark areas and increases mining speed.', 'Glowing Mushroom', 'Enchanted', 'Yes', 'Rare', 'player7'),
    ('Lucky', 'Rabbit', 'Obtained by completing a quest', 'Complete a special quest', 'Increases luck, leading to better loot drops.', 'Carrot', 'Playful', 'Yes', 'Uncommon', 'player8'),
    ('Flamey', 'Lava Slime', 'Dropped by Wall of Flesh', 'Defeat the Wall of Flesh boss', 'Provides resistance to fire-based damage.', 'Obsidian', 'Warm', 'No', 'Rare', 'player9'),
    ('Zappy', 'Lightning Bug', 'Found at night in Forest biome', 'Catch a Lightning Bug at night', 'Emits light and occasionally zaps enemies.', 'Glowing Mushroom', 'Energetic', 'Yes', 'Common', 'player10');

	-- Вставка даних у таблицю Terraria_Vehicles
INSERT INTO Terraria_Vehicles (VehicleName, VehicleType, Speed, Capacity, Fuel, CraftingMaterials, RequiredBiome, SpecialAbilities, Mountable, PlayerID)
VALUES
    ('Minecart', 'Ground', 'Fast', '1 Player', 'None', 'Iron Bar, Wood', 'None', 'Quick transportation on tracks.', 'Yes', 'player1'),
    ('Pirate Ship', 'Water', 'Medium', 'Crew', 'Cannonballs', 'Wood, Cannon', 'Ocean', 'Offensive capabilities with cannons.', 'Yes', 'player2'),
    ('Winged Boots', 'Air', 'Moderate', '1 Player', 'None', 'Feather, Cloud', 'Sky Islands', 'Allows limited flight.', 'Yes', 'player3'),
    ('Mushroom Chariot', 'Ground', 'Slow', '2 Players', 'None', 'Mushroom, Wood', 'Mushroom Biome', 'Grows mushrooms on the path.', 'Yes', 'player4'),
    ('Snowmobile', 'Ground', 'Fast', '1 Player', 'Snowballs', 'Ice Block, Metal', 'Snow Biome', 'Shoots snowballs at enemies.', 'Yes', 'player5'),
    ('Submarine', 'Water', 'Slow', '1 Player', 'Air Supply', 'Metal, Glass', 'Ocean', 'Exploration and breathing underwater.', 'Yes', 'player6'),
    ('Drill Pod', 'Ground', 'Very Fast', '1 Player', 'None', 'Metal, Drill', 'Underground', 'Tunnels through blocks.', 'Yes', 'player7'),
    ('Rocket Boots', 'Air', 'Fast', '1 Player', 'None', 'Metal, Jetpack', 'None', 'Allows limited flight.', 'Yes', 'player8'),
    ('Batmobile', 'Ground', 'Fast', '1 Player', 'None', 'Metal, Wheels', 'None', 'Emits a supersonic sonic wave.', 'Yes', 'player9'),
    ('Lava Boat', 'Water', 'Medium', '1 Player', 'Lava Gel', 'Metal, Lava', 'Hell', 'Floats on lava and emits light.', 'Yes', 'player10');

-- Вставка даних у таблицю Terraria_Bosses
INSERT INTO Terraria_Bosses (BossName, BossType, SpawnLocation, Health, Damage, Defense, Attacks, Loot, SummonItem, PlayerID, LocationID)
VALUES
    ('Eye of Cthulhu', 'Flying', 'Corruption or Crimson', '2800', '18', '6', 'Charging, Projectile', 'Demonite Ore, Crimtane Ore', 'Suspicious Looking Eye', 'player1', 9),
    ('Eater of Worlds', 'Segmented', 'Corruption', '3200', '22', '8', 'Contact, Spikes', 'Shadow Scale, Demonite Ore', 'Worm Food', 'player2', 9),
    ('Brain of Cthulhu', 'Flying', 'Crimson', '3400', '20', '10', 'Teleportation, Spikes', 'Tissue Sample, Crimtane Ore', 'Bloody Spine', 'player3', 9),
    ('Skeletron', 'Ground', 'Dungeon', '4400', '30', '12', 'Spin Attack, Hand Slam', 'Bone, Cobweb', 'Clothier Voodoo Doll', 'player4', 9),
    ('Queen Bee', 'Flying', 'Jungle', '3400', '30', '15', 'Contact, Projectile', 'Bee Wax, Bee Keeper', 'Abeemination', 'player5', 3),
    ('Wall of Flesh', 'Segmented', 'Underworld', '8000', '35', '20', 'Laser, Voodoo Doll', 'Pwnhammer, Emblems', 'Guide Voodoo Doll', 'player6', 8),
    ('The Destroyer', 'Flying', 'Hallowed Biome', '16000', '40', '30', 'Lasers, Probes', 'Hallowed Bars, Souls of Might', 'Mechanical Worm', 'player7', 5),
    ('The Twins', 'Flying', 'Hallowed Biome', '20000', '50', '20', 'Eye Lasers, Charges', 'Hallowed Bars, Souls of Sight', 'Mechanical Eye', 'player8', 5),
    ('Skeletron Prime', 'Flying', 'Hallowed Biome', '28000', '70', '30', 'Laser, Rockets', 'Hallowed Bars, Souls of Fright', 'Mechanical Skull', 'player9', 5),
    ('Plantera', 'Stationary', 'Jungle Biome', '30000', '60', '20', 'Spiky Balls, Tentacles', 'Temple Key, Temple Loot', 'Planteras Bulb', 'player10', 3);

-- Вставка даних у таблицю Terraria_Enemies
INSERT INTO Terraria_Enemies (EnemyName, EnemyType, Habitat, Hostile, HP, Damage, Defense, Loot, RareDropChance, LocationID)
VALUES
    ('Zombie', 'Undead', 'Surface', 'Yes', '100', '10', '2', 'Zombie Arm, Gold Coin', 'Low', 1),
    ('Slime', 'Gelatinous', 'Surface', 'Yes', '50', '8', '1', 'Gel, Slime Staff', 'High', 1),
    ('Demon Eye', 'Flying', 'Surface', 'Yes', '80', '12', '3', 'Lens, Demon Eye Banner', 'Medium', 1),
    ('Giant Worm', 'Burrowing', 'Underground', 'Yes', '180', '18', '6', 'Rotten Chunk, Worm Tooth', 'High', 6),
    ('Angry Nimbus', 'Flying', 'Sky Islands', 'Yes', '120', '20', '5', 'Rain Hat, Nimbus Rod', 'Medium', 7),
    ('Cursed Skull', 'Flying', 'Dungeon', 'Yes', '150', '25', '10', 'Cursed Flames, Bone Key', 'Low', 8),
    ('Giant Bat', 'Flying', 'Caverns', 'Yes', '200', '15', '4', 'Bat Wing, Giant Harpy Feather', 'Medium', 6),
    ('Armored Viking', 'Ground', 'Snow Biome', 'Yes', '140', '22', '8', 'Viking Helmet, Viking Banner', 'Medium', 4),
    ('Dark Caster', 'Caster', 'Underground', 'Yes', '130', '28', '5', 'Dark Shard, Cursed Flame', 'Medium', 6),
    ('Lava Slime', 'Gelatinous', 'Underworld', 'Yes', '150', '30', '8', 'Obsidian, Lava Charm', 'Low', 8);

-- Вставка даних у таблицю Terraria_Weather
INSERT INTO Terraria_Weather (WeatherName, BiomeType, Effects, Duration, WindSpeed, RainChance, ThunderstormChance, SandstormChance, BlizzardChance, LocationID)
VALUES
    ('Clear Skies', 'Surface', 'None', 'Infinite', 'Normal', '0', '0', '0', '0', 1),
    ('Rain', 'Surface', 'Reduced visibility, Wet', 'Variable', 'Normal', '100', '10', '0', '0', 2),
    ('Jungle Rain', 'Jungle Biome', 'Reduced visibility, Wet, Faster plant growth', 'Variable', 'Normal', '100', '10', '0', '0', 3),
    ('Snow', 'Snow Biome', 'Reduced visibility, Cold, Snow accumulation', 'Variable', 'Normal', '0', '0', '0', '100', 4),
    ('Blood Moon', 'Surface', 'Increased enemy spawn, Unique enemies', '1 Night', 'Normal', '0', '0', '0', '0', 5),
    ('Sandstorm', 'Desert Biome', 'Reduced visibility, Sand blocks movement', 'Variable', 'Fast', '0', '0', '100', '0', 2),
    ('Blizzard', 'Snow Biome', 'Reduced visibility, Cold, Snow blocks movement', 'Variable', 'Fast', '0', '0', '0', '100', 4),
    ('Thunderstorm', 'Surface', 'Reduced visibility, Wet, Lightning strikes', 'Variable', 'Normal', '100', '100', '0', '0', 7),
    ('Rainbow', 'Sky Islands', 'Colorful sky effects', 'Infinite', 'Normal', '0', '0', '0', '0', 7),
    ('Sandstorm', 'Desert Biome', 'Reduced visibility, Sand blocks movement', 'Variable', 'Fast', '0', '0', '100', '0', 7);

-- Вставка даних у таблицю Terraria_CraftingRecipes
INSERT INTO Terraria_CraftingRecipes (RecipeName, CraftingStation, ResultItem, ResultQuantity, PlayerID, LocationID, NPCID, ItemID)
VALUES
    ('Iron Sword Recipe', 'Anvil', 'Iron Sword', '1', 'player1', 5, NULL, NULL),
    ('Topaz Staff Recipe', 'Anvil', 'Topaz Staff', '1', 'player2', 3, NULL, NULL),
    ('Healing Potion Recipe', 'Alchemy Table', 'Healing Potion', '5', 'player3', 6, NULL, NULL),
    ('Musket Recipe', 'Anvil', 'Musket', '1', 'player4', 3, NULL, NULL),
    ('Dynamite Recipe', 'Work Bench', 'Dynamite', '5', 'player5', 1, NULL, NULL),
    ('Natures Gift Recipe', 'Tinkerers Workshop', 'NaturesGift', '1', 'player6', 3, NULL, NULL),
    ('Green Dye Recipe', 'Dye Vat', 'Green Dye', '5', 'player7', 4, NULL, NULL),
    ('Autohammer Recipe', 'Mythril Anvil', 'Autohammer', '1', 'player8', 4, NULL, NULL),
    ('Tiki Totem Recipe', 'Mythril Anvil', 'Tiki Totem', '1', 'player9', 3, NULL, NULL),
    ('Steampunk Wings Recipe', 'Tinkerers Workshop', 'Steampunk Wings', '1', 'player10', 4, NULL, NULL);
-- Тепер вивидемо наші введенні дані за допомогою запита SELECT 

SELECT * FROM Terraria_Bosses
SELECT * FROM Terraria_CraftingRecipes
SELECT * FROM Terraria_Enemies
SELECT * FROM Terraria_Items
SELECT * FROM Terraria_Locations
SELECT * FROM Terraria_NPCS
SELECT * FROM Terraria_Player
SELECT * FROM Terraria_Vehicles
SELECT * FROM Terraria_Weather
SELECT * FROM Terraria_Pets

-- Представления

-- Представлення з інформацією про предмети і їх доступності у різних NPC-торговців:
CREATE VIEW ItemAvailability AS
SELECT Terraria_NPCS.Vendor, ItemName, ItemType, Rarity, DescriptionItem, Price 
FROM Terraria_Items
INNER JOIN Terraria_NPCS ON Terraria_Items.ItemID = Terraria_NPCS.NPCID
--
DROP VIEW ItemAviability
--
SELECT * FROM ItemAvailability

--  Представлення про боссів які можуть з'явитися в кожному місцеположенні
CREATE VIEW LocationBossInfo AS
SELECT L.LocationName, B.BossName, B.BossType
FROM Terraria_Locations L
INNER JOIN Terraria_Bosses B ON L.LocationID = B.LocationID;
--
DROP VIEW LocationBossInfo
--
SELECT * FROM LocationBossInfo

-- Представлення з інформацією про біоми та еффектах на мапі:
CREATE VIEW BiomeWeatherEffects AS
SELECT L.BiomeType, W.WeatherName, W.Effects
FROM Terraria_Locations L
INNER JOIN Terraria_Weather W ON L.LocationID = W.LocationID;
--
DROP VIEW BiomeWeatherEffects
--
SELECT * FROM BiomeWeatherEffects

-- Процедуры
CREATE PROCEDURE AddPlayer 
    @PlayerID NVARCHAR(50),
    @PlayerName NVARCHAR(50),
    @Health NVARCHAR(50),
    @Mana NVARCHAR(50),
    @DifficultyLevel NVARCHAR(50),
	@CharacterType NVARCHAR(50),
	@AttackPower NVARCHAR(50),
	@Defense NVARCHAR(50),
	@Gold NVARCHAR(50),
	@Experience NVARCHAR(50)
AS
BEGIN
    INSERT INTO Terraria_Player (PlayerID, PlayerName, Health, Mana, Difficulty, CharacterType, AttackPower, Defense, Gold, Experience)
    VALUES (@PlayerID, @PlayerName, @Health, @Mana, @DifficultyLevel, @CharacterType, @AttackPower, @Defense, @Gold, @Experience);
END;
--
 ---------------------------------
	  -- В випадку чого ми видаляємо нашу процедуру
			DROP PROC AddPlayer
			-- Виконаємо цю процедуру
				EXEC AddPlayer @PlayerID = 'Player11', @PlayerName = 'Player Illewen', @Health = '100', @Mana = '100', @DifficultyLevel = 'Normal', @CharacterType = 'Warrior', @AttackPower = '20', @Defense = '30', @Gold = '0', @Experience = '0'
				-- Подивимось результат
					SELECT * FROM Terraria_Player
--
-- Створимо процедуру яка буде міняти еффективність робочого по його імені та фамілії
CREATE PROC ChangeDifficult_Of_Player
  @Name_Player nvarchar(50),
  @Difficult_Player nvarchar(50)
    AS
      UPDATE Terraria_Player
       SET Terraria_Player.Difficulty = @Difficult_Player
      WHERE Terraria_Player.PlayerID = (select PlayerID from Terraria_Player where Terraria_Player.PlayerName = @Name_Player)
	  ---------------------------------
	  -- В випадку чого ми видаляємо нашу процедуру
			DROP PROC ChangeDifficult_Of_Player
			-- Виконаємо цю процедуру
				EXEC ChangeDifficult_Of_Player 'Player Nine','Hard' 
				-- Подивимось результат
					SELECT * FROM Terraria_Player

-- Некластерні індекси для таблиці Terraria_NPCS
CREATE NONCLUSTERED INDEX IX_Terraria_NPCS_Vendor ON Terraria_NPCS(Vendor);

-- Некластерні індекси для таблиці Terraria_Items
CREATE NONCLUSTERED INDEX IX_Terraria_Items_ItemName ON Terraria_Items(ItemType);
CREATE NONCLUSTERED INDEX IX_Terraria_Items_ItemType ON Terraria_Items(ItemType);
CREATE NONCLUSTERED INDEX IX_Terraria_Items_Rarity ON Terraria_Items(Rarity);
CREATE NONCLUSTERED INDEX IX_Terraria_Items_DescriptionItem ON Terraria_Items(DescriptionItem);
CREATE NONCLUSTERED INDEX IX_Terraria_Items_Price ON Terraria_Items(Price);

-- Некластерні індекси для таблиці Terraria_Player
CREATE NONCLUSTERED INDEX IX_Terraria_Player_PlayerName ON Terraria_Player(PlayerName);
CREATE NONCLUSTERED INDEX IX_Terraria_Player_CharacterType ON Terraria_Player(CharacterType);
CREATE NONCLUSTERED INDEX IX_Terraria_Player_Difficulty ON Terraria_Player(Difficulty);
CREATE NONCLUSTERED INDEX IX_Terraria_Player_Health ON Terraria_Player(Health);
CREATE NONCLUSTERED INDEX IX_Terraria_Player_Mana ON Terraria_Player(Mana);
CREATE NONCLUSTERED INDEX IX_Terraria_Player_AttackPower ON Terraria_Player(AttackPower);
CREATE NONCLUSTERED INDEX IX_Terraria_Player_Defense ON Terraria_Player(Defense);
CREATE NONCLUSTERED INDEX IX_Terraria_Player_Gold ON Terraria_Player(Gold);
CREATE NONCLUSTERED INDEX IX_Terraria_Player_Experience ON Terraria_Player(Experience);

-- Некластерні індекси для таблиці Terraria_Weather
CREATE NONCLUSTERED INDEX IX_Terraria_Weather_WeatherName ON Terraria_Weather(WeatherName);
CREATE NONCLUSTERED INDEX IX_Terraria_Weather_BiomeType ON Terraria_Weather(BiomeType);
CREATE NONCLUSTERED INDEX IX_Terraria_Weather_Effects ON Terraria_Weather(Effects);

-- Некластерні індекси для таблиці Terraria_Bosses
CREATE NONCLUSTERED INDEX IX_Terraria_Bosses_BossName ON Terraria_Bosses(BossName);
CREATE NONCLUSTERED INDEX IX_Terraria_Bosses_BossType ON Terraria_Bosses(BossType);


-- Подивимось створені індекси в таблицях
--
select index_type_desc,  page_count,
record_count, avg_page_space_used_in_percent, avg_fragment_size_in_pages
from sys.dm_db_index_physical_stats
(db_id(N'TerrariaGame'), OBJECT_ID(N'Terraria_NPCS'), Null, Null, 'Detailed')
--
select index_type_desc,  page_count,
record_count, avg_page_space_used_in_percent, avg_fragment_size_in_pages
from sys.dm_db_index_physical_stats
(db_id(N'TerrariaGame'), OBJECT_ID(N'Terraria_Items'), Null, Null, 'Detailed')
--
select index_type_desc,  page_count,
record_count, avg_page_space_used_in_percent, avg_fragment_size_in_pages
from sys.dm_db_index_physical_stats
(db_id(N'TerrariaGame'), OBJECT_ID(N'Terraria_Player'), Null, Null, 'Detailed')
--
select index_type_desc,  page_count,
record_count, avg_page_space_used_in_percent, avg_fragment_size_in_pages
from sys.dm_db_index_physical_stats
(db_id(N'TerrariaGame'), OBJECT_ID(N'Terraria_Weather'), Null, Null, 'Detailed')
--
select index_type_desc,  page_count,
record_count, avg_page_space_used_in_percent, avg_fragment_size_in_pages
from sys.dm_db_index_physical_stats
(db_id(N'TerrariaGame'), OBJECT_ID(N'Terraria_Bosses'), Null, Null, 'Detailed')


-- Скрипт реорганізації індексів
alter index all on Terraria_Bosses reorganize
alter index all on Terraria_Bosses rebuild with (fillfactor = 60, sort_in_tempdb = on, statistics_norecompute = on)
--
-- Скрипт реорганізації індексів
alter index all on Terraria_Weather reorganize
alter index all on Terraria_Weather rebuild with (fillfactor = 60, sort_in_tempdb = on, statistics_norecompute = on)
--
-- Скрипт реорганізації індексів
alter index all on Terraria_Player reorganize
alter index all on Terraria_Player rebuild with (fillfactor = 60, sort_in_tempdb = on, statistics_norecompute = on)
--
-- Скрипт реорганізації індексів
alter index all on Terraria_Items reorganize
alter index all on Terraria_Items rebuild with (fillfactor = 60, sort_in_tempdb = on, statistics_norecompute = on)
--
-- Скрипт реорганізації індексів
alter index all on Terraria_NPCS reorganize
alter index all on Terraria_NPCS rebuild with (fillfactor = 60, sort_in_tempdb = on, statistics_norecompute = on)

-- Перевіремо реорганізацію індексів
select index_type_desc, avg_fragment_size_in_pages, avg_fragmentation_in_percent
from sys.dm_db_index_physical_stats (db_id(N'TerrariaGame'), OBJECT_ID(N'Terraria_Bosses'), Null, Null, 'Detailed')
--
select index_type_desc, avg_fragment_size_in_pages, avg_fragmentation_in_percent
from sys.dm_db_index_physical_stats (db_id(N'TerrariaGame'), OBJECT_ID(N'Terraria_Weather'), Null, Null, 'Detailed')
--
select index_type_desc, avg_fragment_size_in_pages, avg_fragmentation_in_percent
from sys.dm_db_index_physical_stats (db_id(N'TerrariaGame'), OBJECT_ID(N'Terraria_Player'), Null, Null, 'Detailed')
--
select index_type_desc, avg_fragment_size_in_pages, avg_fragmentation_in_percent
from sys.dm_db_index_physical_stats (db_id(N'TerrariaGame'), OBJECT_ID(N'Terraria_Items'), Null, Null, 'Detailed')
--
select index_type_desc, avg_fragment_size_in_pages, avg_fragmentation_in_percent
from sys.dm_db_index_physical_stats (db_id(N'TerrariaGame'), OBJECT_ID(N'Terraria_NPCS'), Null, Null, 'Detailed')

-- Створимо бекап бази даних
BACKUP DATABASE TerrariaGame
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\Terraria_LogBackup_24-08-2023.bak' WITH INIT,
NAME = 'Terraria DB Backup',
DESCRIPTION = 'Terraria Database Backup'	
-- Відновимо її за допомогою тільки що створеного бекапа
RESTORE DATABASE TerrariaGame
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\Terraria_LogBackup_24-08-2023.bak'
WITH RECOVERY, REPLACE
-- Створимо також дифференційний бекап який зберігаї всі наші дії після останнього відновлення
DECLARE @DevName nvarchar(max)
SET @DevName = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\Terraria_LogBackup_24-08-2023.bak'
BACKUP DATABASE TerrariaGame TO DISK = @DevName WITH DIFFERENTIAL,NOFORMAT, NOINIT, NAME = N'Terraria DIFF BACKUP', SKIP, NOREWIND, NOUNLOAD, STATS = 10

-- Створенні логінів
CREATE LOGIN PlayerLogin WITH PASSWORD = 'PlayerPassword';
CREATE LOGIN ModeratorLogin WITH PASSWORD = 'ModeratorPassword';
CREATE LOGIN AdminLogin WITH PASSWORD = 'AdminPassword';
GO

-- Створення користувачів
CREATE USER PlayerUser FOR LOGIN PlayerLogin;
CREATE USER ModeratorUser FOR LOGIN ModeratorLogin;
CREATE USER AdminUser FOR LOGIN AdminLogin;
GO

-- Створення ролей
CREATE ROLE PlayerRole;
CREATE ROLE ModeratorRole;
CREATE ROLE AdminRole;
GO

-- Назначення користувачів до ролей
ALTER ROLE PlayerRole ADD MEMBER PlayerUser;
ALTER ROLE ModeratorRole ADD MEMBER ModeratorUser;
ALTER ROLE AdminRole ADD MEMBER AdminUser;
GO

-- Назначення прав користувачам по їх важливості
GRANT SELECT,UPDATE,ALTER,INSERT ON Terraria_Player to PlayerRole
GRANT SELECT,UPDATE,ALTER,INSERT ON Terraria_Items to PlayerRole
GRANT SELECT,INSERT ON Terraria_CraftingRecipes to PlayerRole
GRANT SELECT ON Terraria_NPCS to PlayerRole
GRANT SELECT,INSERT ON Terraria_Vehicles to PlayerRole
--
GRANT SELECT,UPDATE,ALTER,INSERT ON Terraria_Player to ModeratorRole
GRANT SELECT,UPDATE,ALTER,INSERT ON Terraria_Pets to ModeratorRole
GRANT SELECT,UPDATE,ALTER,INSERT ON Terraria_Items to ModeratorRole
--
GRANT SELECT,UPDATE,ALTER,INSERT ON Terraria_Bosses to AdminRole
GRANT SELECT,UPDATE,ALTER,INSERT ON Terraria_CraftingRecipes to AdminRole
GRANT SELECT,UPDATE,ALTER,INSERT ON Terraria_Enemies to AdminRole
GRANT SELECT,UPDATE,ALTER,INSERT ON Terraria_Items to AdminRole
GRANT SELECT,UPDATE,ALTER,INSERT ON Terraria_Locations to AdminRole
GRANT SELECT,UPDATE,ALTER,INSERT ON Terraria_NPCS to AdminRole
GRANT SELECT,UPDATE,ALTER,INSERT ON Terraria_Pets to AdminRole
GRANT SELECT,UPDATE,ALTER,INSERT ON Terraria_Player to AdminRole
GRANT SELECT,UPDATE,ALTER,INSERT ON Terraria_Vehicles to AdminRole
GRANT SELECT,UPDATE,ALTER,INSERT ON Terraria_Weather to AdminRole
-- Ввійдемо під одним із аккаунтів і перевірим доступ в таблицю
--
-- Користувач за допомогою якого перевірим заборону на перегляд таблиці Terraria_Weather
EXECUTE AS LOGIN = 'PlayerLogin'
--
EXECUTE AS LOGIN = 'ModeratorLogin'
EXECUTE AS LOGIN = 'AdminLogin'

-- Перевірим права звичайного робітника
SELECT * FROM Terraria_Weather

-- Для початкту створимо головний ключ шифрування
CREATE MASTER KEY ENCRYPTION BY PASSWORD = '123456789';  

-- Створимо сертифікат
CREATE CERTIFICATE Cert1
WITH SUBJECT = 'Cert1';
GO

-- Створимо сімметричний ключ шифрування на основі сертифіката шифрування
CREATE SYMMETRIC KEY SK_1
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE Cert1;
GO

-- Відкриємо ключ шифрування для роботи з шифруванням і дешифруванням
OPEN SYMMETRIC KEY SK_1
DECRYPTION BY CERTIFICATE Cert1;

-- Зашифруємо наші данні
UPDATE dbo.Terraria_Bosses
SET Defense = ENCRYPTBYKEY(KEY_GUID('SK_1'), Defense);
GO

-- Перевірим шифрування
SELECT * FROM Terraria_Bosses

-- Дешифруємо дані
SELECT BossName, BossType, Defense,
CONVERT(nvarchar(20), DECRYPTBYKEY(Defense))
AS 'Decrypted_Prostoy'
FROM Terraria_Bosses

-- Закриємо симетричний ключ шифрування
CLOSE SYMMETRIC KEY SK_1;