Feature: run Tertestrial without configuration

  @this
  Scenario: run
    Given I start Tertestrial
    Then it prints
      """
      Error: Configuration file not found
      """
    And it exits
