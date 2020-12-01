use std::io;
use std::cmp::Ordering; 
use rand::Rng;
fn main() {
    println!("Guess the number!");
    let secret_number = rand::thread_rng().gen_range(1,101);
    println!("The secret number is: {}",secret_number);
    loop {
        println!("Please input your guess");
        let mut guess = String::new();  // 创建了一个可变变量，当前它绑定到一个新的 String 空实例上
        io::stdin().read_line(&mut guess)
            .expect("Failed to read line");
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => continue,
        };
        println!("You guessed: {}",guess);  //{}为占位符

        match guess.cmp(&secret_number){
            Ordering::Less => println!("Too small!"),
            Ordering::Greater => println!("Too big!"),
            Ordering::Equal => {
                println!("You win!");
                break;
            }
        }
    }
}
