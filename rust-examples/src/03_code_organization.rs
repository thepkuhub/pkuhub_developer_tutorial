// ===== 3.1 函数/方法 =====

// 定义函数：将计算面积的功能打包
// 函数使用 fn 关键字定义，参数和返回值都需要指定类型
fn calculate_area(length: f64, width: f64) -> f64 {  // 参数类型和返回类型
    let area = length * width;                       // 计算逻辑
    area                                             // Rust 函数默认返回最后一个表达式的值
    // 或者显式使用 return：
    // return area;
}

// 没有返回值的函数（返回单元类型 ()）
// () 是单元类型，表示没有返回值
fn print_greeting(name: &str) {                      // &str 是字符串引用
    println!("你好，{}！欢迎来到 Rust 世界！", name);
}

// 带有多个返回值的函数（使用元组）
fn calculate_rectangle(length: f64, width: f64) -> (f64, f64) {
    let area = length * width;
    let perimeter = 2.0 * (length + width);
    (area, perimeter)                                // 返回元组
}

// 函数参数的所有权和借用
// 函数参数可以获取所有权或借用，这是 Rust 内存安全的关键
fn take_ownership(s: String) {                       // 获取 String 的所有权
    println!("拥有了字符串: {}", s);
}                                                    // s 在这里离开作用域并被丢弃

fn borrow_string(s: &String) {                       // 借用 String
    println!("借用了字符串: {}", s);
}                                                    // s 的所有权仍在调用者

fn main() {
    // 调用函数：使用已定义的功能
    let room_length = 5.0;
    let room_width = 4.0;
    let room_area = calculate_area(room_length, room_width);
    println!("房间面积: {} 平方米", room_area);
    
    // 再次调用：函数可以重复使用
    let garden_area = calculate_area(10.0, 8.0);
    println!("花园面积: {} 平方米", garden_area);
    
    // 调用无返回值的函数
    print_greeting("小明");
    
    // 调用返回多个值的函数
    let (area, perimeter) = calculate_rectangle(6.0, 4.0);
    println!("矩形面积: {}, 周长: {}", area, perimeter);
    
    // 演示所有权
    let my_string = String::from("Hello, Rust!");
    borrow_string(&my_string);                       // 借用，不转移所有权
    println!("还能使用: {}", my_string);            // 仍然可以使用
    
    take_ownership(my_string);                       // 转移所有权
    // println!("{}", my_string);                    // 错误！my_string 的所有权已转移
    
    // 函数总结：
    // - 函数体最后一个表达式的值会作为返回值（不加分号）
    // - 使用 return 可以提前返回
    
    println!();
    
    // ===== 3.2 结构体 =====
    
    // 定义结构体：创建自定义数据类型
    // struct 定义结构体，将相关数据组合在一起
    struct Cat {
        name: String,                                // 字段：猫的名字
        age: u8,                                     // 字段：猫的年龄
        is_sleeping: bool,                           // 字段：是否在睡觉
    }
    
    // 为结构体实现方法，类似于c++或python的class
    // impl 块为结构体实现方法和关联函数
    impl Cat {
        // 关联函数（类似其他语言的静态方法）
        // 关联函数（如 new）通过 :: 调用
        fn new(name: String, age: u8) -> Cat {
            Cat {
                name,                                // 字段名和变量名相同时可以简写
                age,
                is_sleeping: false,
            }
        }
        
        // 方法：第一个参数是 &self
        // &self 表示不可变借用，&mut self 表示可变借用
        fn meow(&self) {                            // 不可变借用 self
            if self.is_sleeping {
                println!("{}正在睡觉，不能喵喵叫...", self.name);
            } else {
                println!("{} 说: 喵喵喵~", self.name);
            }
        }
        
        // 可变方法：需要修改自身
        fn sleep(&mut self) {                        // 可变借用 self
            self.is_sleeping = true;
            println!("{} 开始睡觉了 💤", self.name);
        }
        
        fn wake_up(&mut self) {
            self.is_sleeping = false;
            println!("{} 醒来了！", self.name);
        }
        
        // 另一个方法
        fn introduce(&self) {
            println!("大家好，我是{}，今年{}岁了", self.name, self.age);
        }
    }
    
    // 元组结构体（没有字段名）
    struct Point(f64, f64);                          // 定义一个点
    
    // 单元结构体（没有字段）
    struct Marker;                                   // 通常用作标记
    
    // 使用结构体
    println!("=== 结构体示例 ===");
    
    // 创建结构体实例
    let mut my_cat = Cat::new(String::from("小咪"), 3);
    let your_cat = Cat {
        name: String::from("胖橘"),
        age: 5,
        is_sleeping: true,
    };
    
    // 访问字段
    println!("我的猫叫: {}", my_cat.name);
    
    // 调用方法
    my_cat.introduce();
    my_cat.meow();
    my_cat.sleep();
    my_cat.meow();                                   // 睡着了就不会喵喵叫
    my_cat.wake_up();
    my_cat.meow();                                   // 醒来后又能叫了
    
    println!("\n你的猫叫: {}", your_cat.name);
    your_cat.introduce();
    
    // 使用元组结构体
    let origin = Point(0.0, 0.0);
    println!("\n原点坐标: ({}, {})", origin.0, origin.1);
    
    // 更多结构体方法示例
    println!("\n=== 更多结构体方法示例 ===");
    
    // 定义 User 结构体（来自 01 文件的示例）
    #[derive(Debug)]
    struct User {
        username: String,
        email: String,
        age: u32,
        active: bool,
    }
    
    // User 结构体的方法实现
    impl User {
        // 关联函数（静态方法）
        fn new(username: String, email: String, age: u32) -> User {
            User {
                username,
                email,
                age,
                active: true,
            }
        }

        // 实例方法
        fn is_adult(&self) -> bool {
            self.age >= 18
        }

        // 可变方法
        fn have_birthday(&mut self) {
            self.age += 1;
            println!("生日快乐！现在 {} 岁了", self.age);
        }
        
        // 更多方法示例
        fn deactivate(&mut self) {
            self.active = false;
            println!("用户 {} 已被停用", self.username);
        }
        
        fn get_info(&self) -> String {
            format!("用户: {}, 邮箱: {}, 年龄: {}, 状态: {}", 
                self.username, 
                self.email, 
                self.age, 
                if self.active { "活跃" } else { "未激活" })
        }
    }

    // 使用 User 结构体方法
    let user1 = User::new(
        String::from("赵六"),
        String::from("zhaoliu@example.com"),
        17,
    );
    println!("赵六是成年人吗？{}", user1.is_adult());

    let mut user2 = User::new(
        String::from("钱七"), 
        String::from("qianqi@example.com"), 
        25
    );
    println!("{}", user2.get_info());
    user2.have_birthday();
    user2.deactivate();
    
    // 结构体总结：
    // - 方法通过 . 调用
    // - Rust 有三种结构体：常规结构体、元组结构体、单元结构体
    // - 可以为同一个结构体定义多个 impl 块
    
    // 2. 注释：让代码更易理解
    println!("=== 注释示例 ===");
    
    // 这是单行注释：解释下一行代码的作用
    let pi = 3.14159;                               // 也可以放在代码后面
    
    /* 
       这是多行注释：
       可以写更详细的说明
       比如解释一个复杂的算法
       或者记录重要的设计决策
    */
    
    /// 文档注释（用于生成文档）：
    /// 计算圆的周长
    /// 
    /// # 参数
    /// 
    /// * `radius` - 圆的半径
    /// 
    /// # 返回值
    /// 
    /// 返回圆的周长
    /// 
    /// # 示例
    /// 
    /// ```
    /// let circumference = calculate_circumference(5.0);
    /// assert_eq!(circumference, 31.4159);
    /// ```
    fn calculate_circumference(radius: f64) -> f64 {
        // TODO: 可以考虑使用更精确的 PI 常量
        let pi = 3.14159;
        2.0 * pi * radius
    }
    
    //! 这是模块级文档注释
    //! 通常放在文件开头，描述整个模块的功能
    
    println!("圆的周长（半径=5）: {:.4}", calculate_circumference(5.0));
    
    // 注释总结：
    // - // 单行注释：用于简短的说明
    // - /* */ 多行注释：用于较长的解释
    // - /// 文档注释：生成 API 文档，支持 Markdown
    // - //! 模块文档注释：描述整个模块或 crate
    // - 好的注释解释"为什么"，而不仅仅是"做什么"
    // - Rust 鼓励编写自解释的代码，减少不必要的注释
}