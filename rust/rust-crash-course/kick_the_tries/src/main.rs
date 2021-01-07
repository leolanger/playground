struct Person {
    name: String,
    age: u32,
}

impl std::fmt::Display for Person {
    fn fmt(&self, fmt: &mut std::fmt::Formatter<'_>) -> Result<(), std::fmt::Error> {
        write!(fmt, "{} ({} years old)", self.name, self.age)
    }
}

fn main() {
    let alice = Person {
        name: String::from("Alice"),
        age: 30,
    };
    println!("Person: {}", alice);
    println!("Hello, world! {} {} {}", 5, true, "foobar");
}
