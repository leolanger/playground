fn main() {
    let s1 = String::from("hello");
    let len = calculate_length(&s1);
    println!("The length of '{}' is {}", s1, len);
}

fn calculate_length(s: &String) -> usize {
    //s 是对 String 的引用
    s.len()
} //s 离开了作用域，但因为并没有引用值所有权，所以无事发生。
