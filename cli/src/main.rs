use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() > 1 {
        match args[1].as_str() {
            "version" => {
                println!("dist-explore CLI v{}", env!("CARGO_PKG_VERSION"));
                return;
            }
            "help" => {
                println!("dist-explore CLI v{}", env!("CARGO_PKG_VERSION"));
                println!();
                println!("USAGE:");
                println!("    cli [COMMANDS]");
                println!();
                println!("COMMANDS:");
                println!("    version    Show version information");
                println!("    help       Show this help message");
                return;
            }
            _ => {}
        }
    }

    println!("CLI tool starting...");
    println!("Running command-line interface");
    println!("Use --help for usage information");
}
