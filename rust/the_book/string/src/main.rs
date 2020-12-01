fn main() {
    let mut s = String::new();

    let data = "intial contents";
    let s1 = data.to_string();
    //该方法也可
    let s1 = "intial contents".to_string();

    let s2 = String::from("intial contents");

    let mut s3 = String::from("foo");
    s3.push_str("bar");

    let mut s4 = String::from("foo");
    let s5 = "bar";
    s4.push_str(s5);
    println!("s5 is {}", s5);

    let mut s6 = String::from("lo");
    s6.push('l');

    let s7 = String::from("hello, ");
    let s8 = String::from("world!");
    let s9 = s7 + &s8; // 注意 s1 被移动了，不能继续使用

    let s10 = String::from("tic");
    let s11 = String::from("tac");
    let s12 = String::from("toe");
    let s13 = format!("{}-{}-{}", s10, s11, s12);

    for c in "नमस्ते".chars() {
        println!("{}", c);
    }
    for b in "नमस्ते".bytes() {
        println!("{}", b);
    }
}
