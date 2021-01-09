#[derive(Debug)]
struct Foobar(i32);

impl Drop for Foobar {
    fn drop(&mut self) {
        println!("Dropping a Foobar: {:?}", self);
    }
}

fn uses_foobar(foobar: Foobar) {
    println!("I consumed a Foobar: {:?}", foobar);
}

fn main() {
    let x = Foobar(1);
    println!("Before uses_foobar");
    uses_foobar(x);
    println!("After uses_foobar");

    println!("Before a");
    let _a = Foobar(1);
    println!("After a");
    {
        println!("Before b");
        let _b = Foobar(2);
        println!("After b");
    }
    println!("End of main");
}
