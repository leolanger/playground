mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}
    }
}

pub fn eat_at_restaurant() {
    //Absolute path
    crate::front_of_house::hosting::add_to_waitlist();
    //Relative path
    front_of_house::hosting::add_to_waitlist();
}

//
fn server_order() {}

mod back_of_house {
    fn six_incorrect_order() {
        cook_order();
        super::server_order();
    }
    fn cook_order() {}
}

//
mod back_of_house {
    pub struct Breakfast {
        pub toast: String,
        seasonal_fruit: String,
    }

    impl Breakfast {
        pub fn summer(toast: &str) -> Breakfast {
            Breakfast {
                toast: String::from(toast),
                seasonal_fruit: String::from("peaches"),
            }
        }
    }
}

pub fn eat_at_restaurant() {
    let mut meal = back_of_house::Breakfast::summer("Rye");
    meal.toast = String::from("WHeat");
    println!("I'd like {} toast please", meal.toast);
}
