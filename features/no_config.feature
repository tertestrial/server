Feature: run Tertestrial without configuration

  @this
  Scenario: run
    Given Tertestrial is running
    Then it prints:
      """
      xxx
      """
