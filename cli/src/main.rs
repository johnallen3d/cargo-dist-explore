use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    
    if args.len() > 1 && args[1] == "--version" {
        println!("cargo-dist-explore CLI v{}", env!("CARGO_PKG_VERSION"));
        return;
    }
    
    println!("CLI tool starting...");
    println!("Running command-line interface");
    println!("Use --version to see version information");
}