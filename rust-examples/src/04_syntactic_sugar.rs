

fn main() {
    use std::fs::File;
    let value = Some(3);

    struct User {
        name: String,
        age: u32,
        email: String,
    }
    struct Point(i32, i32);
    let point = Point(1, 2);
    let user1 = User {
        name: String::from("Alice"),
        age: 30,
        email: String::from("alice@example.com"),
    };
    let x0 = 5;
    let y0 = 10;
    // 一、错误处理与可选值操作
    // 1. 使用 `?` 运算符简化错误处理

    fn read_file() -> std::io::Result<File> {
        
        // 传统写法
        let file = match File::open("foo.txt") {
            Ok(file) => file,
            Err(e) => {
                eprintln!("Error opening file: {}", e);
                return Err(e);
            }
        };
        // 语法糖
        let file = File::open("foo.txt")?;
        
        Ok(file)
    }
    // 2. 可选值链式处理 map/and_then 替代嵌套 match

    // 传统
   let result = match Some(3i32) {
       Some(x) => match x.checked_add(1) {
           Some(y) => Some(y),
           None => None,
       },
       None => None,
   };
   // 语法糖
   let result = Some(3i32).and_then(|x| x.checked_add(1));

    // 二、模式匹配相关
    // 1. if let 简化单分支匹配

    // 传统
   match value {
       Some(x) => println!("{}", x),
       _ => (),
   }
   // 语法糖
   if let Some(x) = value {
       println!("{}", x);
   }

    // 2. while let 简化循环匹配

    // 传统
    let mut stack = vec![1, 2, 3];
    loop {
        match stack.pop() {
            Some(x) => print!("{}", x),
            None => break,
        }
    }
   
    // 语法糖
    while let Some(x) = stack.pop() {
        print!("{}", x);
    }

   // 3. 模式匹配检测 matches! 宏替代完整 match

    // 传统
    enum Status {
         Active,
         Inactive,
         Pending,
            Suspended,
    }
    let status = Status::Active;
    let is_active = match status {
        Status::Active => true,
        _ => false,
    };
   // 语法糖
    let is_active = matches!(status, Status::Active);

   // 三、结构体操作
    // 1. 结构体更新语法简化字段赋值
    
    // 传统
    let user2 = User {
        age: 25,
        name: user1.name.clone(),
        email: user1.email.clone(),
    };
    // 语法糖
    let user2 = User {
        age: 25,
        ..user1
    };

    // 2. 结构体字段访问简化

    // 传统
    let a = User { name: String::from("Alice"), age: 30, email: String::from("alice@example.com") };
    // 语法糖
    let a = User { name: String::from("Alice"), age: 30, email: String::from("alice@example.com") };

    // 四、其他
    // 1. 闭包参数类型推断
        
    // 传统
    fn add1(x: i32, y: i32) -> i32 {
        x + y
    }
    // 语法糖
    let awa = |x0: i32, y0: i32| -> i32 { x0 + y0 };

    // 2. 范围操作

    for i in 1..5 {println!("{}", i);}   // 1-4
    for i in 1..=5 {println!("{}", i);}  // 1-5

   // 3. 路径导入合并

    use std::{fs, io, path::Path};

   // 
}