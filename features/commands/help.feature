Feature: display help

  Scenario Outline:
    When I run "tertestrial <OPTION>"
    Then it exits with this output
      """
      auto-run tests from within your code editor

      Usage: tertestrial [COMMAND]

      Commands:
        debug  Print the received triggers from the pipe without running them
        run    Run the given client-side trigger and exit
        setup  Create an example configuration file
        start  Execute the received triggers from the pipe
        help   Print this message or the help of the given subcommand(s)

      Options:
        -h, --help     Print help
        -V, --version  Print version
      """

    Examples:
      | OPTION |
      | -h     |
      | --help |
