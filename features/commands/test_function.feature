Feature: test only a specific function

  Background:
    Given file ".testconfig.json" with content
      """
      {
        "actions": [
          {
            "trigger": {
              "command": "testFunction",
              "file": "**/*.ts"
            },
            "run": "echo testing file {{file}}:{{line}}"
          }
        ]
      }
      """
    When I start Tertestrial
    Then it prints
      """
      Tertestrial is online, Ctrl-C to exit
      """

  Scenario: sending a matching file and location
    When a client sends the command '{ "command": "testFunction", "file": "foo.ts", "line": "23" }'
    Then it prints
      """
      executing: echo testing file foo.ts:23
      testing file foo.ts:23
      """

  # TODO: fix the wrong behavior documented by this test
  Scenario: sending a matching file and no location
    When a client sends the command '{ "command": "testFunction", "file": "foo.ts" }'
    Then it prints
      """
      executing: echo testing file foo.ts:{{line}}
      testing file foo.ts:{{line}}
      """

  Scenario: sending a mismatching file
    When a client sends the command '{ "command": "testFunction", "file": "foo.go", "line": "23" }'
    Then it prints
      """
      Error: cannot determine command for trigger: {"command": "testFunction", "file": "foo.go", "line": "23" }
      """