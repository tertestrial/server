# Tertestrial Server Configuration

Run <code type="tertestrial-command">tertestrial setup</code> in the root
directory of your codebase to generate Tertestrial's configuration file
(<code type="repo/existing-file">.testconfig.json</code>). This file tells the
Tertestrial server which actions it should perform when it receives messages
from a Tertestrial client. Actions look like this:

- the `trigger` block describes the command sent by the Tertestrial client
- the `run` block defines the console command to run

Below is an example configuration file for JavaScript developers who use
[Mocha](https://mochajs.org) for unit testing:

**.testconfig.json**

```json
{
  "actions": [
    {
      "trigger": {},
      "run": "mocha"
    },
    {
      "trigger": {
        "filename": ".js$",
        "line": "d+"
      },
      "command": "mocha {{filename}}:{{line}}"
    }
  ]
}
```
