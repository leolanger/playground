#[derive(Debug)]
enum UsState {
    Alabama,
    Alaska,
    //...
}
enum Coin {
    Penny,
    Nickel,
    Dime,
    Quarter(UsState),
}
fn main() {
    value_in_cents(Coin::Quarter(UsState::Alaska));
}

fn value_in_cents(coin: Coin) -> u8 {
    match coin {
        Coin::Penny => 1,
        Coin::Nickel => 5,
        Coin::Dime => 10,
        Coin::Quarter(state) => {
            println!("State Quarter from {:?}", state);
            25
        }
    }
}
