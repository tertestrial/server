use super::FileAction;
use super::FileOptions;
use crate::config::{Action, Configuration};
use crate::Result;
use serde::Deserialize;

/// The structure of the configuration file.
#[derive(Deserialize)]
pub struct FileConfiguration {
  actions: Vec<FileAction>,
  options: Option<FileOptions>,
}

impl FileConfiguration {
  pub fn to_domain(self) -> Result<Configuration> {
    let mut actions: Vec<Action> = Vec::with_capacity(self.actions.len());
    for json_action in self.actions {
      actions.push(json_action.to_domain()?);
    }
    Configuration {}

    // let options = self.options.unwrap_or_default();
    // let Some(file_options) = self.options else {
    //   return Ok(Configuration { actions, options.to_domain()? });
    // };
    // Ok(Configuration {
    //   actions,
    //   options: Options {
    //     before_run: match file_options.before_run {
    //       None => defaults.before_run,
    //       Some(file_before_run) => BeforeRun {
    //         clear_screen: file_before_run
    //           .clear_screen
    //           .unwrap_or(defaults.before_run.clear_screen),
    //         newlines: file_before_run
    //           .newlines
    //           .unwrap_or(defaults.before_run.newlines),
    //       },
    //     },
    //     after_run: match file_options.after_run {
    //       None => defaults.after_run,
    //       Some(file_after_run) => AfterRun {
    //         indicator_lines: file_after_run
    //           .indicator_lines
    //           .unwrap_or(defaults.after_run.indicator_lines),
    //         newlines: file_after_run
    //           .newlines
    //           .unwrap_or(defaults.after_run.newlines),
    //       },
    //     },
    //   },
    // })
  }
}
