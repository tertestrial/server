Feature: run Tertestrial without configuration

  Scenario: run
    When I run "tertestrial"
    Then it prints
      """
      Tertestrial is online, Ctrl-C to exit
      """
