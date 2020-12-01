//不能修改借用的变量
//fn main() {
//    let s = String::from("hello");
//
//    change(&s);
//}
//
//fn change(some_string: &String) {
//    some_string.push_str(", world");
//}

//可变引用,但是在特定作用域的特定数据只能有一个可变引用。
fn main() {
    let mut s = String::from("hello");
    change(&mut s);

    //以下错误
    //let r1 = &mut s;
    //let r2 = &mut s;
    let r1 = &mut s;
} //r1 在这里离开了作用域，所以可以创建一个新的引用
  //let r2 = &mut s;

fn change(some_string: &mut String) {
    some_string.push_str(", world");
}
