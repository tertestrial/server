Feature: create example config file as part of setup

  Scenario:
    When I run "contest setup"
    Then it exits with no output
    And it creates file ".testconfig.json" with content
      """
      {
        "actions": [
          {
            "type": "testAll",
            "run": "echo test all files"
          },
          {
            "type": "testFile",
            "file": "\\.rs$",
            "run": "echo testing file {{file}}"
          },
          {
            "type": "testFileLine",
            "file": "\\.ext$",
            "run": "echo testing file {{file}} at line {{line}}"
          }
        ],
        "options": {
          "beforeRun": {
            "clearScreen": false,
            "newlines": 2
          },
          "afterRun": {
            "newlines": 1,
            "indicatorLines": 2,
            "indicatorBackground": true,
            "printResult": true
          }
        }
      }
      """
