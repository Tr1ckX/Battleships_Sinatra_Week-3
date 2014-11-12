Feature: This is the homepage for Battleships

  Scenario: Player arrives to the page
    Given I visit the homepage
    When I fill in my name
    And I click on register
    Then I should be passed to the ship placement page
    And see a greeting message with the player's name.
