fn main() {
    enum IpAdderKind {
        v4,
        v6,
    }
    let four = IpAdderKind::v4;
    let six = IpAdderKind::v6;

    struct IpAddr {
        kind: IpAdderKind,
        address: String,
    }

    let home = IpAddr {
        kind: IpAdderKind::v4,
        address: String::from("127.0.0.1")
    }
    let loopback = IpAddr {
        kind: IpAdderKind::v6,
        address: String::from("::1"),
    }

    //另一种方法
    enum IpAddr {
        V4(String),
        V6(String),
    }
    let home = IpAddr::V4(String::from("127.0.0.1"));
    let loopback = IpAddr::V6(String::from("::1"));

    //另一种情况
    enum IpAddr {
        V4(u8, u8, u8, u8),
        V6(String),
    }
    let home = IpAddr::V4(127, 0, 0, 1);
    let loopback = IpAddr::V6(String::from("::1"));

    enum Message {
        Quit,
        Move { x: i32, y: i32},
        Write(String),
        ChangeColor(i32, i32, i32),
    }


    enum Option<T> {
        Some(T),
        None,
    }
    let some_number = Some(5);
    let some_string = Some("a string");
    let absent_number: Option<i32> = None;
}

