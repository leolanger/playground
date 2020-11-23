fn main() {
    println!("Hello, world!");

    another_function(5, 6);

    let a = 5;
    let b = {
        let a = 3;
        a + 1
    };      // {}也是表达式，会返回值，且此时结尾没有分号，如果有分号变成语句，无返回值。
    println!("The value of b is:{}", b);

    let c = five();
    println!("The value of c is:{}", c);

    let d = plus_one(5);
    println!("The value of d is:{}", d);
}

fn plus_one(x: i32) -> i32 {
    x + 1
}

fn five() -> i32{
    5
}
fn another_function(x: i32, y: i32) {
    println!("The value of x is: {}", x);
    println!("The value of y is: {}", y);
    println!("Another function");

}
