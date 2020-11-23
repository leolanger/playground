mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}
    }
}

mod back_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}
    }
}

pub use crate::back_of_house::hosting;
//pub use crate::front_of_house::hosting;
//不行，重导出相同名称只能一次

pub fn eat_at_restaurant() {
    hosting::add_to_waitlist();
    hosting::add_to_waitlist();
    hosting::add_to_waitlist();
}
