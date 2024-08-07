Feature: Starting Contest

  Scenario:
    Given file ".testconfig.json" with content
      """
      {
        "actions": [
          {
            "type": "testAll",
            "run": "echo running all tests"
          }
        ]
      }
      """
    When I run "contest"
    Then it prints
      """
      Contest is online, Ctrl-C to exit
      """
