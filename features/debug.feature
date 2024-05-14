Feature: run all tests

  Background:
    Given file ".testconfig.json" with content
      """
      {
        "actions": [
          {
            "trigger": {
              "command": "testAll"
            },
            "run": "echo running all tests"
          }
        ]
      }
      """
    When I run "tertestrial debug"
    Then it prints
      """
      using this configuration:
      TRIGGER                  | RUN
      { "command": "testAll" } | echo running all tests
      Options:- beforeRun.clearScreen: false
      """
    And it prints
      """
      Tertestrial is online in debug mode, Ctrl-C to exit
      """

  Scenario: receiving a valid command
    When receiving the command '{ "command": "testAll" }'
    Then it prints
      """
      received from client: { "command": "testAll" }
      """
    When receiving the command '{ "command": "testAll" }'
    Then it prints
      """
      received from client: { "command": "testAll" }
      """
