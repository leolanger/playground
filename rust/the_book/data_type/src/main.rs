fn main() {
    let tup = (500, 6.4, 1);
    let (x, y, z) = tup;
    println!("The value of y is: {}", y);

    let tup1 = (500, 6.4, 1);
    let five_hundred = tup1.0;
    let six_point_four = tup1.1;
    let one = tup1.2;
    println!("{}, {}, {}", five_hundred, six_point_four, one);

    let a = [1, 2, 3, 4, 5];
    let months = ["January", "February", "March", "April", "May", "June", "July",
              "August", "September", "October", "November", "December"];
    let b: [i32; 5] = [1, 2, 3, 4, 5];
    let c = [3;5];
    let first = c[0];
    let second = c[1];
    println!("{}, {}", first, second);
}
