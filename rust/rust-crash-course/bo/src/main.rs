#[derive(Debug)]
struct Foobar(i32);

impl Drop for Foobar {
    fn drop(&mut self) {
        println!("Dropping a Foobar: {:?}", self);
    }
}

fn uses_foobar(foobar: Foobar) {
    println!("I consumed a Foobar: {:?}", foobar);
}

fn uses_foobar1(foobar: &Foobar) {
    println!("I consumed a Foobar: {:?}", foobar);
}

fn main() {
    {
        let x = Foobar(1);
        println!("Before uses_foobar");
        uses_foobar(x);
        println!("After uses_foobar");
    }

    //
    {
        println!("Before a");
        let _a = Foobar(1);
        println!("After a");
        {
            println!("Before b");
            let _b = Foobar(2);
            println!("After b");
        }
        println!("End of main");
    }

    //

    {
        let alpha = Foobar(3);
        println!("Beffor uses_foobar1");
        uses_foobar1(&alpha);
        uses_foobar1(&alpha);
        println!("After uses_foobar1");
    }

    //

    {
        let x = Foobar(4);
        let y = &x;
        println!("Before uses_foobar1");
        uses_foobar1(&x);
        uses_foobar1(y);
        println!("After uses_foobar");
    }

    //

    {
        let mut x = Foobar(5);
        let y = &mut x;
        println!("Before uses_foobar");
        //        uses_foobar1(&x); // will fail!
        uses_foobar1(y);
        println!("After uses_foobar");
    }
}
