fn main() {
    // s 在这里无效
    let s = "hello"; // 从此处其，s 有效

    let mut st = String::from("hello"); // 从此处其， st有效
    st.push_str(", world!");
    println!("{}", st);

    let s1 = String::from("hello");
    let s2 = s1;
    //println!("{}, world!", s1);
    //上一段语句无效

    let s3 = String::from("hello");
    let s4 = s3.clone();
    println!("s3 = {}, s4 = {}", s3, s4);

    let s0 = String::from("hello"); //s0进入作用域
    takes_ownership(s0); //s0的值移动到函数里
                         //所以到这里不再有效
    let x = 5; //x进入作用域
    makes_copy(x); //x应该移动到函数里，但是i32可以copy，所以可以继续使用x。
} // 作用域结束，s，st 不再有效；这里x先移出了作用域，然后是s，但s的值已被移走，无事发生。

fn takes_ownership(some_string: String) {
    println!("{}", some_string);
} // 这里，some_string 移出作用域并调用 `drop` 方法。占用的内存被释放

fn makes_copy(some_integer: i32) {
    println!("{}", some_integer);
} // 这里，some_integer 移出作用域。不会有特殊操作
