use hello_macro::HelloMacro;

struct Pancakes;

impl HelloMacro for Pancakes {
    fn hello_macro() {
        println!("Hello macro!");
    }
}

fn main() {
    Pancakes::hello_macro();
}
