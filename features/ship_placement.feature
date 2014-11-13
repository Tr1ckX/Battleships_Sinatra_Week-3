Feature: This is the ship_placement page for Battleships

  Scenario: Player tranfered from homepage
    Given The player visits the ship placement page
    When Player places the ships
    Then Player should wait for the game to start
