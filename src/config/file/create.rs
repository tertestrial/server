use super::JSON_PATH;
use crate::{Result, UserError};
use std::fs;

const EXAMPLE_CONTENT: &str = r#"{
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
}"#;

// creates an example config file on disk
pub fn create() -> Result<()> {
  fs::write(JSON_PATH, EXAMPLE_CONTENT).map_err(|e| UserError::CannotCreateConfigFile { err: e.to_string() })
}
