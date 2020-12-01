#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}
fn main() {
    let width1 = 30;
    let heighth1 = 50;
    let rect1 = (30, 50);
    let rect2 = Rectangle {
        width: 30,
        height: 50,
    };
    println!(
        "
    The area of the rectangle is: {} square pixels.",
        area(width1, heighth1)
    );
    println!(
        "
    The area of the rectangle is: {} square pixels.",
        area1(rect1)
    );
    println!(
        "The area of the rectangle is {} square pixels.",
        area2(&rect2)
    );

    println!("rect2 is {:?}", rect2);
    println!("rect2 is {:#?}", rect2);
}

fn area1(dimension: (u32, u32)) -> u32 {
    dimension.0 * dimension.1
}

fn area(width1: u32, heighth1: u32) -> u32 {
    width1 * heighth1
}

fn area2(rectangle: &Rectangle) -> u32 {
    rectangle.width * rectangle.height
}
