-- Создание процедур 
create proc Proc1
as select * from dbo.Terraria_Player

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

CREATE PROC ChangeDifficult_Of_Player
  @Name_Player nvarchar(50),
  @Difficult_Player nvarchar(50)
    AS
      UPDATE Terraria_Player
       SET Terraria_Player.Difficulty = @Difficult_Player
      WHERE Terraria_Player.PlayerID = (select PlayerID from Terraria_Player where Terraria_Player.PlayerName = @Name_Player)

go
CREATE proc DELETE_NAMEPLAYER
@PlayerName int
as
delete dbo.Terraria_Player
where PlayerName = @PlayerName
-----------------------------------------------------------------------
