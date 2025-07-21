// ===== 1.1 变量与常量 =====

fn main() {
    // 变量：可以改变值的容器（需要用 mut 关键字）
    let mut score = 85; // 声明一个可变变量，初始值为85
    println!("初始分数: {}", score);

    score = 95; // 修改变量的值
    println!("更新后的分数: {}", score);

    // 不可变变量：默认情况下变量是不可变的
    let age = 25; // 声明一个不可变变量
    println!("年龄: {}", age);
    // age = 26;                     // 错误！不能修改不可变变量

    // =>遮蔽概念的讲解

    // 常量：编译时就确定的值，永远不可变
    // 常量（const）在编译时就确定值，必须指定类型，命名通常用大写
    const PI: f64 = 3.14159; // 常量必须指定类型
    println!("圆周率: {}", PI);

    // Rust 中变量默认是不可变的（immutable），需要 mut 关键字才能修改
    // 不可变性是 Rust 安全性的重要特性，防止数据被意外修改

    // ===== 1.2 数据类型 =====

    // 整数类型：i32（32位有符号整数）是默认类型
    let count: i32 = 42; // 显式指定类型
    let temperature = -10; // 类型推断为 i32
    let big_number: u64 = 1_000_000; // u64：无符号64位整数，下划线提高可读性
    println!(
        "计数: {}, 温度: {}°C, 大数: {}",
        count, temperature, big_number
    );

    // 浮点数类型：f64（64位）是默认类型
    let price = 29.99; // 类型推断为 f64
    let pi: f32 = 3.14; // f32：32位浮点数
    println!("价格: ${}, PI值: {}", price, pi);

    // 字符串类型：&str（字符串切片）和 String（可增长字符串）
    let greeting = "Hello, World!"; // &str：字符串字面量
    let mut name = String::from("Alice"); // String：堆上分配的字符串
    name.push_str(" Smith"); // 可以修改 String
    println!("问候语: {}, 姓名: {}", greeting, name);

    // 布尔类型：bool
    let is_raining = true; // 真
    let _is_sunny: bool = false; // 加上 _ 前缀表示故意不使用
    let is_adult = age >= 18; // 表达式结果也是布尔值
    println!("正在下雨吗? {}, 是成年人吗? {}", is_raining, is_adult);

    // 字符类型：char（Unicode 字符）
    // char 类型，使用单引号，支持 Unicode
    let letter = 'A'; // 注意：单引号表示字符
    let emoji = '😊'; // 支持 Unicode
    let chinese = '中'; // 支持中文字符
    println!("字母: {}, 表情: {}, 中文: {}", letter, emoji, chinese);

    // 数据类型总结：
    // - 整数：有符号（i8, i16, i32, i64, i128）和无符号（u8, u16, u32, u64, u128）
    // - 浮点数：f32 和 f64，默认是 f64
    // - 字符串：&str（不可变引用）和 String（可变、堆分配）
    // - 布尔值：bool 类型，只有 true 和 false

    // 更多数据类型细节

    // 数组：固定大小，所有元素类型相同
    let months: [&str; 12] = [
        "一月",
        "二月",
        "三月",
        "四月",
        "五月",
        "六月",
        "七月",
        "八月",
        "九月",
        "十月",
        "十一月",
        "十二月",
    ];
    println!("第一个月: {}", months[0]);
    println!("共有 {} 个月", months.len());

    // 元组：可以包含不同类型的值
    let person: (&str, i32, f64) = ("张三", 30, 175.5);
    println!(
        "姓名: {}, 年龄: {}, 身高: {}cm",
        person.0, person.1, person.2
    );

    // 解构元组
    let (name, _age, _height) = person;
    println!("解构后 - 姓名: {}", name);

    // 切片：引用数组的一部分
    let slice = &months[0..3]; // 前三个月
    println!("第一季度: {:?}", slice);

    // 类型别名
    type Kilometers = i32;
    let distance: Kilometers = 5;
    println!("距离: {} 公里", distance);

    // ===== 1.3 运算符 =====

    // 场景：计算购物总价并判断是否享受优惠

    // 算术运算符：用于数学计算
    let price = 50; // 单价
    let quantity = 3; // 数量
    let total = price * quantity; // 乘法
    let tax = total / 10; // 除法（整数除法会截断小数）
    let final_price = total + tax; // 加法
    let remainder = total % 10; // 取余
    println!(
        "总价: {}, 税: {}, 最终价格: {}, 余数: {}",
        total, tax, final_price, remainder
    );

    // 比较运算符：用于比较值的大小或相等性
    let member_level = 2;
    let is_vip = member_level >= 2; // 大于等于
    let is_exactly_165 = final_price == 165; // 等于
    let _is_not_zero = final_price != 0; // 不等于  // 加上 _ 前缀
    println!("是VIP吗? {}, 正好165? {}", is_vip, is_exactly_165);

    // 逻辑运算符：用于组合多个条件
    let has_discount = final_price > 100 && is_vip; // AND：两个条件都满足
    let needs_delivery = final_price < 50 || !is_vip; // OR：至少一个条件满足
    println!("享受折扣? {}, 需要运费? {}", has_discount, needs_delivery);

    // 位运算符示例
    // 位运算符：&, |, ^, <<, >>（用于二进制位操作）
    let a: u8 = 0b1010; // 二进制：10
    let b: u8 = 0b1100; // 二进制：12
    let and_result = a & b; // 按位与
    let or_result = a | b; // 按位或
    let xor_result = a ^ b; // 按位异或
    println!(
        "位运算: {} & {} = {}, {} | {} = {}, {} ^ {} = {}",
        a, b, and_result, a, b, or_result, a, b, xor_result
    );

    // 运算符总结：
    // - 算术运算符：+, -, *, /, %（注意整数除法会截断）
    // - 比较运算符：==, !=, <, >, <=, >=
    // - 逻辑运算符：&&（与）, ||（或）, !（非）
    // - Rust 是强类型语言，运算符两边的类型必须匹配

    // 运算符进阶

    // 复合赋值运算符
    let mut value = 10;
    value += 5; // 相当于 value = value + 5
    value *= 2; // 相当于 value = value * 2
    println!("复合运算结果: {}", value);

    // 类型转换（必须显式）
    let integer = 42;
    let float = integer as f64; // 显式转换为 f64
    println!("整数 {} 转换为浮点数 {}", integer, float);

    // 短路求值
    let x = 5;
    let result = x > 0 && {
        println!("这会被执行，因为 x > 0");
        x < 10
    };
    println!("短路求值结果: {}", result);

    // ===== 1.4 结构体 =====

    // 定义结构体：用于组合多个相关的值
    #[derive(Debug)] // 派生 Debug trait，允许打印结构体
    struct User {
        username: String,
        email: String,
        age: u32,
        active: bool,
    }

    // 创建结构体实例
    let user1 = User {
        username: String::from("张三"),
        email: String::from("zhangsan@example.com"),
        age: 25,
        active: true,
    };

    // 访问结构体字段
    println!("用户名: {}", user1.username);
    println!("邮箱: {}", user1.email);

    // 使用 Debug trait 打印整个结构体
    println!("用户信息: {:?}", user1);

    // 可变结构体
    let mut user2 = User {
        username: String::from("李四"),
        email: String::from("lisi@example.com"),
        age: 30,
        active: false,
    };
    user2.active = true; // 修改字段值
    println!("李四的状态: {}", user2.active);

    // 结构体更新语法

    // =>与所有权的关系
    let user3 = User {
        username: String::from("王五"),
        email: String::from("wangwu@example.com"),
        ..user2 // 使用 user2 的其余字段
    };
    println!("王五的年龄（继承自李四）: {}", user3.age);

    // 元组结构体
    struct Color(i32, i32, i32);

    let black = Color(0, 0, 0);
    println!("黑色 RGB: ({}, {}, {})", black.0, black.1, black.2);

    // 单元结构体（不含任何字段）
    struct AlwaysEqual;
    let _subject = AlwaysEqual;

    // 结构体总结：
    // - 结构体是组织相关数据的方式，类似其他语言的类
    // - 可以定义字段
    // - #[derive(Debug)] 允许使用 {:?} 打印结构体
    // - 结构体方法的实现请参考 03_code_organization.rs

    // ===== 1.5 枚举类型 =====

    // 定义枚举：表示一个值可能的几种变体
    // 枚举允许你通过列举可能的成员来定义一个类型
    #[derive(Debug)]
    enum IpAddrKind {
        V4,
        V6,
    }

    // 枚举可以包含数据
    #[derive(Debug)]
    enum IpAddr {
        V4(String),
        V6(String),
    }

    // 更复杂的枚举：不同变体可以包含不同类型和数量的数据
    #[derive(Debug)]
    enum Message {
        Quit,                       // 没有关联数据
        Move { x: i32, y: i32 },    // 包含命名字段，类似结构体
        Write(String),              // 包含一个 String
        ChangeColor(i32, i32, i32), // 包含三个 i32
    }

    // 使用枚举
    let four = IpAddrKind::V4;
    let six = IpAddrKind::V6;
    println!("\nIP 地址类型: {:?}, {:?}", four, six);

    // 带数据的枚举
    let home = IpAddr::V4(String::from("127.0.0.1"));
    let loopback = IpAddr::V6(String::from("::1"));
    println!("家庭地址: {:?}", home);
    println!("回环地址: {:?}", loopback);

    // 使用复杂枚举
    let msg1 = Message::Write(String::from("hello"));
    let msg2 = Message::Move { x: 10, y: 30 };
    let msg3 = Message::ChangeColor(255, 0, 0);
    let msg4 = Message::Quit;

    println!("\n消息示例:");
    println!("消息1: {:?}", msg1);
    println!("消息2: {:?}", msg2);
    println!("消息3: {:?}", msg3);
    println!("消息4: {:?}", msg4);

    // 实际应用示例：表示一周的天数
    #[derive(Debug)]
    enum Weekday {
        Monday,
        Tuesday,
        Wednesday,
        Thursday,
        Friday,
        Saturday,
        Sunday,
    }

    // 为枚举实现方法
    impl Weekday {
        fn is_weekend(&self) -> bool {
            match self {
                Weekday::Saturday | Weekday::Sunday => true,
                _ => false,
            }
        }

        fn work_hours(&self) -> u8 {
            match self {
                Weekday::Monday
                | Weekday::Tuesday
                | Weekday::Wednesday
                | Weekday::Thursday
                | Weekday::Friday => 8,
                Weekday::Saturday => 4,
                Weekday::Sunday => 0,
            }
        }
    }

    let today = Weekday::Friday;
    println!("\n今天是: {:?}", today);
    println!("是周末吗? {}", today.is_weekend());
    println!("工作时间: {} 小时", today.work_hours());

    // 带有多种数据的实际应用：支付方式
    #[derive(Debug)]
    enum Payment {
        Cash(f64),
        CreditCard { number: String, cvv: u16 },
        Alipay(String),
        WeChatPay { account: String },
    }

    let payment1 = Payment::Cash(100.0);
    let payment2 = Payment::CreditCard {
        number: String::from("1234-5678-9012-3456"),
        cvv: 123,
    };
    let payment3 = Payment::Alipay(String::from("user@example.com"));

    println!("\n支付方式示例:");
    println!("支付1: {:?}", payment1);
    println!("支付2: {:?}", payment2);
    println!("支付3: {:?}", payment3);

    // 使用 match 处理枚举（详细的 match 用法请参考 02_control_flow.rs）
    match payment1 {
        Payment::Cash(amount) => println!("现金支付: {} 元", amount),
        Payment::CreditCard { number, cvv } => {
            println!("信用卡支付: {}, CVV: {}", number, cvv)
        }
        Payment::Alipay(account) => println!("支付宝支付: {}", account),
        Payment::WeChatPay { account } => println!("微信支付: {}", account),
    }

    // 枚举总结：
    // - 枚举让你定义一个类型，它的值只能是几个固定变体中的一个
    // - 每个变体可以有不同类型和数量的关联数据
    // - 枚举常与 match 表达式一起使用进行模式匹配
    // - 可以为枚举实现方法，就像结构体一样
}
