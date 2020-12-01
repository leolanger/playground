fn main() {
    let mut s = String::from("hello world");
    let hello = &s[0..5]; //同let hello = &s[..5];
    let world = &s[6..11]; //同let world = &s[6..];
    let word = first_word1(&s[0..5]);
    println!("the first word is: {}", word);
}

fn first_word(s: &String) -> &str {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return &s[0..i];
        }
    }
    &s[..]
}

fn first_word1(s: &str) -> usize {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return i;
        }
    }

    s.len()
}
