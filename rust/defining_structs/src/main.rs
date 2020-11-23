fn main() {
    struct User {
        username: String,
        email: String,
        sign_in_count: u64,
        active: bool,
    }
    let mut user1 = User {
        email: String::from("user1@example.com"),
        username: String::from("user1"),
        active: true,
        sign_in_count: 1,
    };
    user1.email = String::from("anotheremail@example.com");
    let user2 = User {
        email: String::from("anotheremail@example.com"),
        username: String::from("anothername"),
        active: user1.active,
        sign_in_count: user1.sign_in_count,
    };

    struct Color(i32, i32, i32);
    struct Point(i32, i32, i32);
    let black = Color(255, 255, 255);
    let origin = Point(255, 255, 255);
}
