use std::env;
use std::process;

use minigrep::{run, Config};
fn main() {
    // 读取命令行参数，及环境变量
    let config = Config::new(env::args()).unwrap_or_else(|err| {
        eprintln!("Problem parsing arguments: {}", err);
        process::exit(1);
    });
    // 根据参数寻找所定的单词
    if let Err(e) = minigrep::run(config) {
        eprintln!("Application error: {}", e);

        process::exit(1);
    }
}
