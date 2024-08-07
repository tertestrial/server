Feature: run all tests in a file

  Background:
    Given file ".testconfig.json" with content
      """
      {
        "actions": [
          {
            "type": "testFile",
            "files": "**/*.rs",
            "run": "echo testing file {{file}}"
          }
        ]
      }
      """
    And Contest is running

  Scenario: receiving a matching file
    When receiving the command '{ "command": "testFile", "file": "foo.rs" }'
    Then it prints
      """
      executing: echo testing file foo.rs
      testing file foo.rs
      """

  Scenario: receiving a file that doesn't match an existing rule
    When receiving the command '{ "command": "testFile", "file": "foo.go" }'
    Then it prints
      """
      Error: cannot determine command for trigger: testFile foo.go
      Please make sure that this action is listed in your configuration file
      """
    # ensure the server is still running and functional
    When receiving the command '{ "command": "testFile", "file": "foo.rs" }'
    Then it prints
      """
      executing: echo testing file foo.rs
      testing file foo.rs
      """
