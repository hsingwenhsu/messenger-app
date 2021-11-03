Feature: The user can chat
Scenario: The user wants to chat in the ESaaS room
    Given I am on the home page
    Given the following rooms are created: ESaaS, DB
    Then I should see the following rooms: ESaaS, DB
    Then I press the room of ESaaS