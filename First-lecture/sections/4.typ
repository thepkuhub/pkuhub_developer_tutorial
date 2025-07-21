#import "../globals.typ": *

= 模块化与项目组织 | Project Organization
== Rust 大观 - 知识点
#slide[
  #grid(
    columns: ( 1fr, 19em), // 固定左栏宽度+右栏自适应
    gutter: 1em,          // 栏间距
      // 左栏: 文字内容
      [
      #pause
      === Period1 : Language Fundamentals
      - #text(fill: rgb(0,150,0),"Installation & Setup")
      - #text(fill: rgb(0,150,0),"Variables & Mutability")
      - #text(fill: rgb(0,150,0),"Data Types & Data Structures")
      - #text(fill: rgb(0,150,0),"Functions, Control flows and Methods")
      - #text(fill: rgb(0,150,0),"Ownership System")
      #pause
      === Period2 : Advanced Features
      - #text(fill: rgb(0,150,0),"Enum & Pattern Matching")
      - #text(fill: rgb(0,150,200),"Error Handling")
      - #text(fill: rgb(0,150,200),"Modules & Crates")
      - #text(fill: rgb(0,150,200),"Generics, Traits and Lifetimes")
      - #text(fill: rgb(0,150,200),"Common Collections")
      ]
      ,
      [
      #pause
      === Period3 : System Programming Skills
      - #text(fill: rgb(0,150,200),"Smart Pointers")
      - Concurrency
      - Async Programming
      - Unsafe Rust
      #pause
      ===  Period4 : Production-level development
      - Web Development : ...
      - Embedded Systems : ...
      - System tool development : ...
      ] 
  )
]

== Definations
#pause
- *项目(Package)*：可以用来构建、测试和分享包
#pause
- *工作空间(WorkSpace)*：对于大型项目，可以进一步将多个包联合在一起，组织成工作空间
#pause
- *包(Crate)*：一个由多个模块组成的树形结构，可以作为三方库进行分发，也可以生成可执行文件进行运行
#pause
- *模块(Module)*：可以一个文件多个模块，也可以一个文件一个模块，模块可以被认为是真实项目中的代码组织单元



== 使用use引入模块
#slide[
#grid(
  columns: ( 1fr, 18em), // 固定左栏宽度+右栏自适应
  gutter: 1em,          // 栏间距
    // 左栏: 文字内容
    [
      #pause
      Python代码实现
      ```python
      import random
      if __name__ == "__main__":
          secret_number = random.randint(1, 100)
      ```
      #pause
      包下载
      ```bash
      pip install random
      ```
      运行代码 (程序员手写requirements.txt)
      ```bash
      pip install -r requirements.txt
      python main.py
      ```
    ],
    [ 
      #pause
      #text(fill: rgb(0,150,0),"🦀Rust代码实现")
      ```rust
      use rand::Rng;
      fn main() {
          let secret_number = rand::thread_rng().gen_range(1..101);
      }
      ```
      #pause
      包下载 ```bash cargo add rand```

      运行代码 (自动生成Cargo.toml, 手动添加依赖)
      ```bash
      cargo run
      ```
    ]
)
]

== 模块化 | Modules

#slide[
#grid(
  columns: ( 1fr, 18em), // 固定左栏宽度+右栏自适应
  gutter: 1em,          // 栏间距
    // 左栏: 文字内容
    [
      === 模块树形结构
      #pause
      假如 ``` src/lib.rs ``` 中有以下代码
      ```rust
      mod front_of_house {
          mod hosting {
              fn add_to_waitlist() {}
              fn seat_at_table() {}
          }
          mod serving {
              fn take_order() {}
              fn serve_order() {}
              fn take_payment() {}
          }
      }
      ```
    ],
    [ 
      #pause
      它对应了一个*模块树形结构*
      ```rust
      crate
      └── front_of_house
          ├── hosting
          │   ├── add_to_waitlist
          │   └── seat_at_table
          └── serving
              ├── take_order
              ├── serve_order
              └── take_payment
      ```
      #pause
      crate, src/lib.rs, src/main.rs 都是Rust的约定, 不可改动
    ]
)
]

#slide[
#grid(
  columns: ( 1fr, 12em), // 固定左栏宽度+右栏自适应
  gutter: 1em,          // 栏间距
    // 左栏: 文字内容
    [
      === 在lib.rs中自定义模块
      #pause
      #text(fill: rgb(0,150,0),"🦀将以下代码放入 src/lib.rs 中")
      ```rust
mod front_of_house {
    pub mod hosting {
        pub fn add_to_waitlist() {}
    }
}
pub fn eat_at_restaurant() {
  crate::front_of_house::hosting::add_to_waitlist();
  front_of_house::hosting::add_to_waitlist();
}
      ```
    #pause
    rust-analyzer会报错: fuction `add_to_waitlist` is private
    ],
    [ 
    Rust 出于安全的考虑，默认情况下，所有的类型都是私有化的，包括函数、方法、结构体、枚举、常量，是的，就连模块本身也是*私有化*的。
    
    在 Rust 中，父模块完全无法访问子模块中的私有项，但是子模块却可以访问父模块、父父..模块的私有项。
    ]
)
]

#slide[
#grid(
  columns: ( 1fr, 18em), // 固定左栏宽度+右栏自适应
  gutter: 1em,          // 栏间距
    // 左栏: 文字内容
    [
      === 在main.rs中调用我们刚刚定义的模块
      #pause
      #text(fill: rgb(0,150,0),"🦀将以下代码放入 src/main.rs 中")
      ```rust
use crate::front_of_house::hosting;
fn main() {
    hosting::add_to_waitlist();
}
      ```
    #pause
    Error: could not find `front_of_house` in the crate root
    
    #pause
    应该将 crate 改成项目名称

    #pause
    Error: `front_of_house` is private

    #pause
    需要在 lib.rs 中将模块声明为 pub
    ],
    [ 
    === 使用super关键字调用父模块
    

    #pause
    ```rust
fn serve_order() {
    self::back_of_house::cook_order()
}
mod back_of_house {
    fn fix_incorrect_order() {
        cook_order();
        super::serve_order();
    }
    pub fn cook_order() {}
}
    ```
    #pause
    === 使用self关键字调用当前模块
    ```rust
    use std::io::{self, Write};
    use std::collections::*;
    ```
    ]
)
]

#focus-slide("阶段成果1: mod, use, pub, super, self")
== 包 | Crate
#slide[
  #image("../images/60.png", width: 100%, alt: "6")
  这里对应了两种不同的项目结构
  - 二进制 crate (Binary Crate)：生成一个可执行程序（有 main.rs 文件）。目的是运行。
  - 库 crate (Library Crate)：生成一个库，供其他程序调用（有 lib.rs 文件）。目的是被依赖。
]


= 泛型、Trait 和生命周期 | Generics, Traits and Lifetimes
== Rust 大观 - 语法糖
#pause
语法糖（syntactic sugar）指的是那些让代码更易读写的语法，它们并不会带来新的功能，而是提供更简洁的表达方式。
#pause

Rust 中常见的语法糖：
  #table(
    columns: (auto, auto),
    [错误处理与可选值处理], [?, map, and_then],
    [模式匹配], [if let, while let, 直接解构, matches!],
    [结构体], [结构体更新 (..), 字段初始化简写],
    [闭包], [闭包类型推断],
    [范围与集合], [范围表达式 (.., ..=)],
    [类型转换], [Deref 强制转换],
    [模块系统], [use 路径简写]
  )

== 泛型 | Generics
#slide[
  #grid(
    columns: ( 1fr, 12em), // 固定左栏宽度+右栏自适应
    gutter: 1em,          // 栏间距
      // 左栏: 文字内容
      [
      #pause
      === 不使用泛型
      ```rust
      fn add_i8(a:i8, b:i8) -> i8 {a + b}
      fn add_i32(a:i32, b:i32) -> i32 {a + b}
      fn add_f64(a:f64, b:f64) -> f64 {a + b}
      fn main() {
          println!("add i8: {}", add_i8(2i8, 3i8));
          println!("add i32: {}", add_i32(20, 30));
          println!("add f64: {}", add_f64(1.23, 1.23));
      }
      ``` 
      #pause
      #text(fill: rgb(0,150,0),"🦀使用泛型")
      #pause
      ```rust
      fn add<T>(a:T, b:T) -> T {a + b}
      fn main() {
          println!("add i8: {}", add(2i8, 3i8));
      }
      ```
      ],
      [
      #pause 
      === C++中的模版函数
      #pause
      ```c
      template <typename T>
      T add(T a, T b) {
          return a + b;
      }
      #pause
      ```
      我们可以使用泛型定义*函数、结构体、枚举和方法*，这样它们就可以用于多种不同的具体*数据类型*。
      ]
  )
]

#slide[
  === 泛型函数
      ```rust
      fn largest<T: PartialOrd + Copy>(list: &[T]) -> T {}
      ```
  #grid(
    columns: ( 1fr, 18em), // 固定左栏宽度+右栏自适应
    gutter: 1em,          // 栏间距
      // 左栏: 文字内容
      [
      #pause
      === 泛型结构体
      #pause
      ```rust
      struct Point<T> {
        x: T,
        y: T,
      }
      let point = Point { x: 5, y: 10 };
      ```
      #pause
      === 泛型枚举
      #pause
      ```rust
      enum Result<T, E> {
          Ok(T),
          Err(E),
      }
      ```
      ],
      [
      #pause
      === 泛型方法
      #pause
      ```rust
      impl<T> Point<T> {
          fn x(&self) -> &T {
              &self.x
          }
      }
      println!("x: {}", point.x());
      ```

      #pause
      Rust 通过在编译时进行泛型代码的单态化(monomorphization) 来保证效率.
      ]
  )
]

#focus-slide("阶段成果2: 泛型函数、结构体、枚举和方法")

== 特征 | Traits
#slide[
  === #text(fill: rgb(0,150,0),"🦀为 Post 实现 Trait Summary ")
  #grid(
    column-gutter: 1em,
    columns: ( 1fr, 18em), // 固定左栏宽度
    [
      ```rust
      pub trait Summary {
        fn summarize(&self) -> String;
      }
      pub struct Post {
        pub title: String, // 标题
        pub author: String, // 作者
        pub content: String, // 内容
      }
      impl Summary for Post {
        fn summarize(&self) -> String {
          format!("文章《{}》，作者是《{}》", self.title, self.author)
        }
      }
      ```
    ],
    [
      #pause
      可以通过 trait 以一种抽象的方式定义共同行为。可以使用 trait bounds 指定泛型是任何拥有特定行为的类型。
      #pause
      - Trait
        - 声明
        - 默认实现
        - 为类型实现Trait
      #pause
      - Trait bounds
        - Trait 作为参数限制类型
        - Trait 作为返回值限制类型
    ]
  )
]

#slide[
      === #text(fill: rgb(0,150,0),"🦀Trait 作为函数参数限制类型 (作用于fn关键字)")
      #pause
      ```rust
      pub fn notify(item: &impl Summary) {
        println!("Breaking news! {}", item.summarize());}
      ```
      #pause
      ```rust
      pub fn notify<T: Summary>(item: &T) {
        println!("Breaking news! {}", item.summarize());}
      ```
      #pause
      === 多重约束
      ```rust
      fn some_function<T: Display + Clone, U: Clone + Debug>(t: &T, u: &U) -> i32 {}
      ```
      #pause
      === where约束
      ```rust
      fn some_function<T, U>(t: &T, u: &U) -> i32
        where T: Display + Clone,
                U: Clone + Debug
      {}
      ```
]
#slide[
  === #text(fill: rgb(0,150,0),"🦀Trait 为方法, 特征实现限制类型 (作用于impl关键字)")
  #pause
  ```rust
  impl<T: Display + PartialOrd> Pair<T> {
    fn cmp_display(&self) {
      if self.x >= self.y {
          println!("The largest member is x = {}", self.x);
      } else {
          println!("The largest member is y = {}", self.y);
      }
    }
  }
  ```
  #pause
  ```rust
  impl<T: Display> ToString for T {
    // --snip--
  }
  ```
]

#slide[
  === #text(fill: rgb(0,150,0),"🦀Trait 作为返回值限制类型")
  #pause
  ```rust
  fn returns_summarizable() -> impl Summary {
    Weibo {
        username: String::from("sunface"),
        content: String::from("m1 max太厉害了，电脑再也不会卡",)
    }
  }
  ```
  #pause
  Weibo 实现了 Summary，因此这里可以用它来作为返回值。要注意的是，虽然我们知道这里是一个 Weibo 类型，但是对于 returns_summarizable 的调用者而言，他只知道返回了一个实现了 Summary 特征的对象，但是并不知道返回了一个 Weibo 类型。
]
#focus-slide("阶段成果3: Trait, Trait bounds")
#slide[
  #grid(
    columns: ( 1fr, 18em), // 固定左栏宽度+右栏自适应
    gutter: 1em,          // 栏间距
    [
    还记得讲泛型时的largest函数吗?
    ```Rust
    fn largest<T>(list: &[T]) -> T {
      let mut largest = list[0];

      for &item in list.iter() {
          if item > largest {
              largest = item;
          }
      }
      largest
    }
    ```

    ]
    ,
    [
    #pause
    error[E0369]: binary operation `>` cannot be applied to type `T`

    cannot move out of type [T], a non-copy slice
    #pause
    ]
  )

  #text(fill: rgb(0,150,0),"solution: 为泛型函数添加Trait bounds") 
  
  `fn largest<T: PartialOrd + Copy>(list: &[T]) -> T {}`
]
#slide[
  #pause
  === 特征对象(Rust)与继承(Java/C++)
  在C++中，面向对象编程（OOP）主要基于四个核心概念：封装（Encapsulation）、抽象（Abstraction）、继承（Inheritance）和多态（Polymorphism）。
  #pause
  Rust 中没有继承的概念，而是通过特征（Traits）来实现多态。特征定义了一组方法的签名，任何类型都可以实现这些特征，从而获得这些方法的行为。
  #pause
  - Rust实现封装 & 抽象 : struct, impl, pub
  #pause
  - Rust没有继承的概念 : trait 的默认实现, 组合, trait 继承
  #pause
  - Rust实现多态:
    - 编译时多态(静态分派) : 泛型函数和特征 bounds
    - 运行时多态(动态分派) : 特征对象（dyn Trait）
  #pause
  动态类型语言，指在运行时才确定类型的语言。
]
== 生命周期 | Lifetimes
#slide[
  #pause
  === 生命周期的本质：引用安全卫士
  #grid(
    column-gutter: 1em,
    columns: ( 1fr, 18em), // 固定左栏宽度
    [
    #pause
    1. 核心问题：悬垂引用
    ```Rust
    fn main() {
        let r;
        {
            let x = 5;
            r = &x; // `x` 的生命周期不够长
        }
        println!("r: {}", r);
    }
    ```
    #pause
    问题根源：引用指向的数据可能比引用本身更早被销毁
    ],
    [
    
    #pause
    2. 生命周期的作用
    - 编译时保证：确保引用始终有效
    - 借用检查：防止数据竞争
    - 内存安全：零运行时开销的内存安全保障
    #pause
    Rust 是如何决定这段代码是不被允许的呢？这得益于借用检查器。（borrow checker）
    ]
  )
]
#slide[
  #grid(
    column-gutter: 1em,
    columns: ( 1fr, 18em), // 固定左栏宽度
    [
    ```Rust
    fn main() {
      let r;              // -------+--'a
                          //        |
      {                   //        |
          let x = 5;      // -+--'b |
          r = &x;         //  |     |
      }                   // -+     |
                          //        |
      println!("r: {r}"); //        |
    }                     // -------+
    ```
    r 和 x 的生命周期注解，分别叫做 'a 和 'b。

    程序被拒绝编译，因为生命周期 'b 比生命周期 'a 要小：被引用的对象比它的引用者存在的时间更短。
    ]
    ,
    [
    ```Rust
    fn main() {
      let x = 5;         // --------+--'b
                         //         |
      let r = &x;        // --+--'a |
                         //   |     |
      println!("r: {r}");//   |     |
                         // --+     |
    }                    // --------+
    ```
    一个有效的引用，因为数据比引用有着更长的生命周期。

    *大部分时候生命周期是隐含并可以推断的，正如大部分时候类型也是可以推断的一样。*
    ]
  )
]
#slide[
  #pause
  Rust 中的每一个引用都有其生命周期（lifetime），也就是引用保持有效的作用域。
  #pause
  类似于当因为有多种可能类型的时候必须注明类型，也会出现引用的生命周期以一些不同方式相关联的情况，所以 Rust 需要我们使用泛型生命周期参数来注明它们的关系，这样就能确保运行时实际使用的引用绝对是有效的。

  #grid(
    columns: ( 1fr, 18em), // 固定左栏宽度+右栏自适应
    gutter: 1em,          // 栏间距
    [
    #pause
    === 过不了编译的例子
    ```Rust
    fn longest(x: &str, y: &str) -> &str {
      if x.len() > y.len() { x } else { y }
    }
    fn main() {
      let str1 = "long string";
      let str2 = "short";
      let r= longest(str1, str2);
      println!("Longest string is: {r}");
    }
    ```
    ],
    [
    === 加上生命周期注解
    ```Rust
    fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {}
    ```
    #pause
    - 和泛型一样，需要先声明 <'a>
    #pause
    - x、y 和返回值至少活得和 'a 一样久（因为返回值要么是 x，要么是 y）
    ]
  )
]
#focus-slide("阶段成果4: OOP in Rust, 生命周期注解")
= 智能指针 | Smart Pointers 
== Rust大观 - 数据类型
#slide[
  #grid(
    columns: ( 1fr, 19em), // 固定左栏宽度+右栏自适应
    gutter: 1em,          // 栏间距
      // 左栏: 文字内容
      [
      #pause
      === Primitive Types
      - i8, i16, i32, i64, i128
      - u8, u16, u32, u64, u128
      - isize, usize, NonZeroI8, NonZeroU16
      - f32, f64, bool, char, ()
      #pause
      === Compound Types
      - Tuples : 如 (i32, f64, char)
      - Arrays : 如 [T; 5]
      - Slices : 如 &[T]
      ]
      ,
      [
      #pause
      === Collections
      - `Vec<T>`, `String`
      - `HashMap<K, V>`, `HashSet<T>`
      - `LinkedList<T>`, `BinaryHeap<T>`, `VecDeque<T>`
      #pause
      === Advanced Data Structures
      - `Arc<T>`, `Mutex<T>`, `RwLock<T>`
      - `Rc<T>`, `RefCell<T>`, `Box<T>`
      ] 
  )
]
== 智能指针 | Smart Pointers
#pause
- *指针（pointer）*是一个包含内存地址的变量的通用概念。这个地址引用，或 “指向”（points at）一些其它数据。
#pause
- Rust 中最常见的指针是引用（reference）。引用以 & 符号为标志并借用了它们所指向的值。除了引用数据没有任何其他特殊功能，也没有额外开销。
#pause
- 在 Rust 中因为引用和借用的概念，普通引用和智能指针有一个额外的区别：引用是一类只借用数据的指针，在大部分情况下，*智能指针拥有它们指向的数据*。
#pause
- 大家已经见过一些智能指针，比如 `String` 和 `Vec<T>`
#pause
- 智能指针通常使用结构体实现。智能指针不同于结构体的地方在于其实现了 Deref 和 Drop trait。
  #pause
  - Deref trait 允许智能指针结构体实例表现的像引用一样，这样就可以编写既用于引用、又用于智能指针的代码。
  #pause
  - Drop trait 允许我们自定义当智能指针离开作用域时运行的代码。

== 使用 `Box<T>` 在堆上存储数据
#slide[
#pause
`Box<T>` 是 Rust 中最简单的智能指针，它允许你在堆上存储数据，且没有额外开销。以下应用场景:
#pause
- 当有一个在编译时未知大小的类型，而又想要在需要确切大小的上下文中使用这个类型值的时候
#pause
- 当有大量数据并希望在确保数据不被拷贝的情况下转移所有权的时候
#pause
- 当希望拥有一个值并只关心它的类型是否实现了特定 trait 而不是其具体类型的时候
  #grid(
    columns: ( 1fr, 18em), // 固定左栏宽度+右栏自适应
    gutter: 1em,          // 栏间距
    [
    === `Box<T>` 的基本用法
    ```Rust
    let b = Box::new(5);
    println!("b = {}", b);
    ```
    ]
    ,
    [
    #pause
    === `Box<T>` 用于递归类型
    ```Rust
    enum List {
      Cons(i32, Box<List>),
      Nil,
    }
    ```
    ]
  )
]
== 递归类型与 `Box<T>`
#slide[
  #grid(
    columns: ( 1fr, 1fr,10em), // 固定左栏宽度+右栏自适应
    gutter: 1em,          // 栏间距
    [
    #pause
    === 不使用 `Box<T>` 在干什么
    ```Rust
    enum List {
      Cons(i32, List),
      Nil,
    }
    ```
    #image("../images/cons.png", width: 90%)
    ]
    ,
    [
    #pause
    === 使用 `Box<T>` 的递归类型
    ```Rust
    enum List {
      Cons(i32, Box<List>),
      Nil,
    }
    ```
    #image("../images/box.png", width: 60%)
    ],[
    #pause
    === 相比于c++, 优势在哪
    `Box<T>` 类型是一个智能指针，因为它实现了 Deref trait，它允许 `Box<T>` 值被当作引用对待。
    #pause
    当 `Box<T>` 值离开作用域时，由于 `Box<T>` 类型 Drop trait 的实现，box 所指向的堆数据也会被清除。
    ]
  )
]
== 实现一个二叉树
#slide[
  #grid(
    columns: ( 1fr, 20em), // 固定左栏宽度+右栏自适应
    gutter: 1em,          // 栏间距
    [
    #pause
    === 枚举方式
    ```Rust
    enum BinaryTree<T> {
      Empty,
      Node(T, Box<BinaryTree<T>>, Box<BinaryTree<T>>),
    }
    ```
    #pause
    === 使用 Option 的方式
    ```Rust
    struct TreeNode {
        value: i32,
        left: Option<Box<TreeNode>>,
        right: Option<Box<TreeNode>>,
    }
    ```
    ]
    ,
    [
    #pause
    === 使用 Rc 和 RefCell 的方式
    ```Rust
    struct TreeNode<T> {
        value: T,
        children: Vec<Rc<RefCell<TreeNode<T>>>>,
    }
    impl<T> TreeNode<T> {
        fn new(value: T) -> Rc<RefCell<Self>> {
            Rc::new(RefCell::new(TreeNode {
                value,
                children: Vec::new(),
            }))
        }
    }
    ```
    ]
  )
]

#focus-slide("Thanks!")