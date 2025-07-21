#import "../globals.typ": *

== 简介

#slide[
  #grid(
    columns: (28em, 1fr),
    // 固定左栏宽度+右栏自适应
    gutter: 1em,
    // 栏间距
    // 左栏: 文字内容
    [
      #link("https://www.rust-lang.org/zh-CN/")[🦀Rust官网]

      在编程语言的世界里，开发者常常面临一个经典的三难选择：性能、安全与抽象，三者似乎难以兼得。

      C/C++等系统级语言提供了极致的性能和底层控制力，但将内存安全的重担完全交给了开发者，稍有不慎便会引发难以追踪的bug。

      Python等高级语言通过垃圾回收机制提供了内存安全和高度的抽象能力，让开发变得简单快捷，却在性能上做出了巨大牺牲。

      Rust的出现，正是为了挑战这一“不可能三角”，它承诺提供与C++相媲美的性能、零成本的抽象，以及在编译时就强制保障的内存安全。

    ],
    [
      #image("../images/0.png", width: 100%, alt: "0")
    ],
  )
]
== 环境
#slide[
  也许你受够了c++的环境配置…
  #image("../images/1.png", width: 20%, alt: "1")
  “这报错是啥玩意儿啊？`undefined reference to`… 我明明链接了啊！昨天还好好的，今天怎么就不行了？编译器是不是在耍我？报的错跟实际问题根本不是一回事！”

  “行，我打个断点调试一下。嗯？GDB 怎么连不上了？`Could not find a task to run`… 我！昨天刚配好的环境，谁又给我动了？”
]
#slide[
  “算了，不管了，IDE 应该能帮我吧。诶？我的代码提示呢？我的自动补全怎么没了？昨天还丝滑流畅，今天就跟个记事本一样。右下角 `clangd` 在那转圈，点开一看，‘正在下载 LLVM’，进度条万年不动。行，我等。半小时后，‘下载失败’。你给的那个下载链接，我用浏览器都打不开啊！”

  “我上官网手动下。好家伙，MinGW、MinGW-w64、MSYS2、TDM-GCC……到底该下哪个？网上十篇教程有八种说法，每个都说自己的是对的。环境变量配来配去，`PATH` 里一长串，跟个藏宝图似的，我自己都看不懂了。”

  “所以，GNU、MinGW、LLVM、Clang，你们这帮神仙到底是什么关系啊？不就是想在 Windows 上跑个 C++ 吗？怎么搞得跟要发射火箭一样复杂？我真的受够了！”
]
#slide[
  python似乎也不是很好用
  #image("../images/2.jpg", width: 20%, alt: "2")
  “项目要求用 `conda`。行，`conda create -n my_env`，一气呵成。然后 `conda install some_package`，‘Package not found in current channels’。怎么回事？conda 里居然没有这个包？！”

  “没事，我不是还有 `pip` 吗？`pip install some_package`，‘Successfully installed’。完美！一运行，`ImportError`。为什么？！我不是已经装上了吗？”
]

#slide[
  - 那么rust是如何做的呢？
  #image("../images/3.svg", width: 100%, alt: "2")
]


#slide[
  #image("../images/4.gif", width: 25%, alt: "Rust Crab")

  #text[
    TODO：动手安装一下Rust环境#link("https://www.rust-lang.org/zh-CN/learn/get-started")[🦀 Rust安装指南]

    该页面会自动检测你的操作系统（Windows、Linux、macOS），并给出最适合你的安装方式。

    这也是我们学习 Rust 的第一步，建议大家按照官方推荐流程完成安装，体验 Rust 简洁高效的环境配置。（可以和上边的两种语言形成对比）
  ]
]

#slide[
  #image("../images/5.svg", width: 100%, alt: "5")
]

#slide[
  - TODO：实现第一个`Hello World!`


  ```bash
  cargo new my_app
  ```

]

#slide[
  `cargo new` 为我们做了什么？

  它创建了一个标准的项目结构：
  ```sh

  my_app
  ├── Cargo.toml  # 项目的“身份证”和“依赖清单”
  └── src
      └── main.rs   # 程序入口，我们的代码就写在这里
  main.rs 文件里已经为我们准备好了经典的 Hello, world!：
  ```
  ```Rust
  fn main() {
  println!("Hello, world!");
  }
  ```
  现在，只需在终端中进入 my_app 目录，运行 `cargo run`，就能看到结果了！
]

#slide[
  #image("../images/6.svg", width: 100%, alt: "6")
  这里对应了两种不同的项目结构
  - 二进制 crate (Binary Crate)：生成一个可执行程序（有 main.rs 文件）。目的是运行。
  - 库 crate (Library Crate)：生成一个库，供其他程序调用（有 lib.rs 文件）。目的是被依赖。
]
#slide[
  #grid(
    columns: (20em, 1fr),
    // 固定左栏宽度+右栏自适应
    gutter: 1em,
    // 栏间距
    // 左栏: 文字内容
    [
      crate 是什么？

      #set text(red)
      Crate 是 Rust 语言中最小的编译单元
      #set text(black)

      如何理解呢？

      可以将Crate理解为一个完整的细胞

      细胞器 === 私有的模块和数据结构

      细胞膜 === 公共API

      生物（细胞组合） === 应用程序（crate组合）

    ],
    [
      #image("../images/7.png", width: 100%, alt: "6")
    ],
  )
]

== 语法
#slide[
  #grid(
    columns: (22em, 1fr),
    // 固定左栏宽度+右栏自适应
    gutter: 1em,
    // 栏间距
    // 左栏: 文字内容
    [

      随着对编程语言学习的深入，我们发现，各种编程语言都能解决所有理论上可通过编程解决的问题。

      #set text(red)
      那么，其背后的本质是什么呢？
      #set text(black)

      我认为，其本质在于它们都具备了图灵完备的计算能力。

      然而，这股强大的潜能需要一套精确的规则来表达和控制，而这套规则，正是语法结构。它为我们驾驭这种强大的计算能力提供了具体的操作方法。

      所以，想要学习一门编程语言，首先要学会的就是它的语法结构，因为这是我们与机器沟通、并指挥其完成任务的第一步。

    ],
    [
      #image("../images/8.png", width: 100%, alt: "8")
    ],
  )
]

#slide[
  #image("../images/9.svg", width: 100%, alt: "9")
  #image("../images/10.svg", width: 100%, alt: "10")
  #image("../images/11.svg", width: 100%, alt: "11")
]


#slide[
  - 让我们使用实际的代码例子来说明这些语法

  #link("https://github.com/shihuaidexianyu/rust-example")[🦀 rust-example]

]
#slide[
  - 遮蔽 (Shadowing)

  定义：在同一作用域内，使用 `let` 关键字可以声明一个与之前变量同名的新变量，这个新变量会“遮蔽”旧变量。

  ```rs
  let count = 10; // "全局" (或外层作用域) 变量

  fn my_func() {
      // 如果你只想读取，没问题
      println!("{}", count); // 这会访问外层的 count，输出 10

      // 如果你想创建一个新的局部变量来遮蔽它，必须用 let
      let count = count + 1; // 显式声明一个新的、局部的 count
      println!("{}", count); // 输出 11
  }
  ```

]
#slide[

  核心优势:

  1. 允许改变类型：这是与 `mut` (可变变量) 的最大区别。你可以用一个新类型的变量遮蔽旧变量，非常适合数据转换的场景。

  (相信你也有过想不出来变量名的时候，那如果是是a，b，c，d命名的话，就当我没说过)

  ```rust
  let spaces = "   ";         // spaces 是 &str 类型
  let spaces = spaces.len(); // spaces 被遮蔽，新变量是 usize 类型
  ```

  2. 维持不可变性：每次遮蔽都会创建一个新的、默认不可变的变量。这有助于防止在后续代码中意外修改值，增强了代码的安全性。
]
#slide[
  与 Python 的区别：Rust 的遮蔽是显式的（必须用 `let`），且不会产生 Python 中因隐式创建本地变量而导致的 `UnboundLocalError` 陷阱。

  ```python

  count = 10  # 全局变量

  def my_func():
      # Python 看到下面有对 count 的赋值操作，于是它认为 count 是一个局部变量，而不是外面的全局变量。
      # 但是在 print 的时候，这个局部的 count 还没有被赋值定义, 所以会抛出错误
      print(count) # 错误！ UnboundLocalError: local variable 'count' referenced before assignment
      count += 1

  my_func()
  ```
]
#slide[
  代码块作为表达式 (Block as an Expression)

  在 Rust 中，`{}` 代码块本身可以是一个表达式，能够计算并返回一个值。

  代码块的返回值是其最后一行没有分号的表达式的值。

  ```rust
  let x = {
      let y = 5;
      y + 1 // 没有分号，表达式的值 6 将作为整个块的返回值
  }; // x 的值现在是 6
  ```
  你可以在这个代码块中做任何事，只要最后返回值就可以（无论是显式的return还是不加分号的变量）

  代码块中可以使用`return`关键字，它会立即中断代码块的执行，并返回`return`之后的内容（中断赋值、中断函数）。

]
#slide[
  enum 和 match 是 Rust 中一对相辅相成、功能极其强大的组合。

  它们共同构成了 Rust 实现类型安全和代码表现力的核心基石之一。

  如果说所有权系统是 Rust 在内存安全上的答案，那么 enum 和 match 就是 Rust 在数据结构和控制流上的优雅解决方案。
]
#slide[
  enum 的核心思想是：一个类型可以是多种不同可能性中的一种。

  这听起来有点像其他语言中的枚举(但说真的我感觉我都没用过其它语言的枚举,感觉略显鸡肋)，但 Rust 的 enum 远不止于此。

  其他语言的枚举通常只是对整数的一组命名常量，而 Rust 的 enum 变体可以携带不同类型和数量的数据。

  这使得 enum 成为一种创建自定义“和类型”（Sum Type）的强大工具。一个 enum 的值，只能是其定义的变体之一，绝无其他可能。
]

#slide[
  #grid(
    columns: (22em, 1fr),
    // 固定左栏宽度+右栏自适应
    gutter: 1em,
    // 栏间距
    // 左栏: 文字内容
    [

      听起来可以比较的抽象，让我们继续用餐厅的例子来说明这一点。

      想象你正在设计一台餐厅自动点餐机的系统。

      第一部分：定义所有“可能性” (这就是 enum 的思想)

      首先，你必须告诉这台机器，顾客在屏幕上可能进行的所有操作类型有哪些。我们把这个类别就叫做“顾客操作”。

    ],
    [
      #image("../images/14.png", width: 100%, alt: "14")
    ],
  )
]


#slide[
  经过分析，你确定了“顾客操作”包含了以下几种截然不同的可能性：

  选择菜品：这种操作必须包含额外信息——顾客选了哪个菜，以及选了几份。

  使用优惠券：这种操作也需要额外信息——具体的优惠券号码是什么。

  完成结账：这个操作本身就是一个完整的指令，不需要任何额外信息。

  呼叫店员：这个操作同样很直接，也不需要额外信息。

]

#slide[
  ```rs
  // 第一步：定义所有“可能性” (这就是 enum 的思想)
  // 我们创建一个名为 `CustomerAction` 的枚举，它统一了顾客可能进行的所有操作。
  enum CustomerAction {
      // 选择菜品：这个变体(variant)需要包含额外信息 —— 菜名和数量
      SelectDish { dish_name: String, quantity: u32 },
      // 使用优惠券：这个变体需要额外信息 —— 优惠券代码
      UseCoupon(String),
      // 完成结账：这个操作本身是完整的，不需要额外信息
      Checkout,
      // 呼叫店员：同样很直接，不需要额外信息
      CallStaff,
  }
  ```

]
#slide[
  enum 的核心思想就在这里体现了：

  它允许你创建一个名叫“顾客操作”的统一概念，但明确指出这个概念下包含了几个结构完全不同的变体。它既可以是“选择菜品”（带着菜名和数量），也可以是“完成结账”（什么也不带）。

  这就像一个文件夹，里面可以放不同类型的文件（文档、图片、表格），但你清楚地知道这个文件夹里只可能出现这几种预定义的文件类型。

  总结来说，第一步就是定义一个“是什么”的问题：把所有可能发生的情况，无论简单还是复杂，都清晰地罗列出来，归为一个总类。

]

#slide[
  match 是 Rust 的模式匹配控制流结构。

  它的作用是：接收一个值（通常是 enum, 当然也可以是其他的值），并根据其具体变体来执行不同的代码分支。

  match 最强大的地方在于它的穷尽性检查 (Exhaustiveness Checking)。

  编译器会强制你为 enum 的每一个可能的变体都提供一个处理分支。如果你遗漏了任何一种情况，代码将无法编译通过。
]


#slide[
  #grid(
    columns: (22em, 1fr),
    // 固定左栏宽度+右栏自适应
    gutter: 1em,
    // 栏间距
    // 左栏: 文字内容
    [

      我们继续之前的例子

      现在，机器知道了所有可能的操作类型。接下来，当顾客真的在屏幕上点了一下，机器的“大脑”就收到了一个具体的“顾客操作”。它该如何应对呢？

    ],
    [
      #image("../images/15.png", width: 100%, alt: "15")
    ],
  )
]

#slide[

  这时就需要一本“处理手册”，这本手册上针对每一种可能的操作，都写下了精确的应对步骤。

  这本手册的内容是这样的：

  规则一：如果收到的操作是“选择菜品”，就立刻查看它附带的菜名和数量，然后将这些信息更新到屏幕的订单列表里。

  规则二：如果收到的是“使用优惠券”，就立刻拿出附带的优惠券号码，去系统里验证，如果有效，就更新订单的总价。

  规则三：如果收到的是“完成结账”，就立刻计算最终价格，并跳转到支付页面。

  规则四：如果收到的是“呼叫店员”，就立刻在后台系统里向服务台发送一条求助信号。
]

#slide[

  ```rs
  let actions = vec![
          CustomerAction::SelectDish {
              dish_name: String::from("红烧牛肉面"),
              quantity: 1,
          },
          CustomerAction::UseCoupon(String::from("RUSTACEAN_2025")),
          CustomerAction::CallStaff,
          CustomerAction::Checkout,
      ];

      // 遍历顾客的每一个操作，并进行处理
      for action in actions {
          // 第二步：使用 match 编写“处理手册”
          // match 会接收一个值（这里的 `action`），并根据其具体变体来执行不同代码。
          match action {
              // 规则一：如果收到的操作是“选择菜品”...
              CustomerAction::SelectDish { dish_name, quantity } => {
                  println!("订单更新：添加了 {} 份 '{}'。", quantity, dish_name);
              }
              // 规则二：如果收到的是“使用优惠券”...
              CustomerAction::UseCoupon(code) => {
                  println!("正在验证优惠券 '{}'...", code);
                  // 这里可以添加验证逻辑
                  println!("验证成功，价格已更新！");
              }
              // 规则四：如果收到的是“呼叫店员”...
              CustomerAction::CallStaff => {
                  println!("信号已发送：一位店员正在赶来...");
              }
              // 规则三：如果收到的是“完成结账”...
              CustomerAction::Checkout => {
                  println!("正在计算总价...");
                  println!("跳转到支付页面。感谢您的光临！");
              }
          }
      }

  ```
]



#slide[

  假设你后来给点餐机增加了一个新功能，比如在“顾客操作”里增加了第五种可能性：“自定义汉堡”。
  ```rs
  enum CustomerAction {
      SelectDish { dish_name: String, quantity: u32 },
      UseCoupon(String),
      Checkout,
      CallStaff,
      // 新增的功能！可以自定义汉堡，需要包含汉堡底和额外配料
      CustomizeBurger { base: String, toppings: Vec<String> },
  }
  ```
  这时，如果你不去更新你的“处理手册”，没有为“自定义汉堡”这一新情况添加一条新的处理规则，那么整个系统在出厂前就会被“质检员”（编译器）拦下，并明确告诉你：“你增加了一个新功能，但没说清楚要怎么处理它，这不行！”
  ```rs
      // 我们只修改了 enum 的定义，但下面的 match 表达式完全没动
      let some_action = CustomerAction::SelectDish {
          dish_name: "宫保鸡丁".to_string(),
          quantity: 2,
      };
      // 错误发生点:
      // 编译器在检查这个 match 表达式时，会发现 CustomerAction 有5种可能性，
      // 但我们的“处理手册”只写了4条规则，遗漏了新增的 `CustomizeBurger`。
      // 编译器会认为这个程序存在逻辑缺陷，并拒绝编译！
      match some_action { // <-- 编译错误！
          CustomerAction::SelectDish { dish_name, quantity } => {
              println!("订单更新：添加了 {} 份 '{}'。", quantity, dish_name);
          }
          CustomerAction::UseCoupon(code) => {
              println!("验证成功，价格已更新！");
          }
          CustomerAction::CallStaff => {
              println!("信号已发送：一位店员正在赶来...");
          }
          CustomerAction::Checkout => {
              println!("跳转到支付页面。感谢您的光临！");
          }
          // 我们没有为 `CustomizeBurger` 添加处理分支！
      }
  ```
]
#slide[
  则会得到如下的报错信息
  ```sh
       Compiling rust-example v0.1.0 (/home/xianyu/projects/rust-example)
  error[E0004]: non-exhaustive patterns: `CustomerAction::CustomizeBurger { .. }` not covered
    --> src/main.rs:28:15
     |
  28 |         match action {
     |               ^^^^^^ pattern `CustomerAction::CustomizeBurger { .. }` not covered
     |
  note: `CustomerAction` defined here
    --> src/main.rs:3:6
     |
  3  | enum CustomerAction {
     |      ^^^^^^^^^^^^^^
  ...
  9  |     CustomizeBurger { base: String, toppings: Vec<String> },
     |     --------------- not covered
     = note: the matched value is of type `CustomerAction`
  help: ensure that all possible cases are being handled by adding a match arm with a wildcard pattern or an explicit pattern as shown
     |
  50 ~             },
  51 +             CustomerAction::CustomizeBurger { .. } => todo!()
     |

  For more information about this error, try `rustc --explain E0004`.
  error: could not compile `rust-example` (bin "rust-example") due to 1 previous error
  ```]
#slide[
  通过这种方式，enum 和 match 联手打造了一个极其可靠的系统，它不仅能灵活地定义各种复杂情况，还能保证每一种情况都会得到妥善处理，从根源上避免了“按下按钮没反应”这类因为逻辑遗漏而导致的尴尬问题。
]



#slide[
  #grid(
    columns: (22em, 1fr),
    // 固定左栏宽度+右栏自适应
    gutter: 1em,
    // 栏间距
    // 左栏: 文字内容
    [

      我们刚刚看到的语法，都是在为一个更宏大、更核心的机制服务，这个机制就是所有权系统。它深刻地影响着我们如何编写 Rust 代码。

      接下来让我们看看所有权机制。

    ],
    [
      #image("../images/16.png", width: 100%, alt: "16")
    ],
  )
]
== 所有权机制
#slide[

  所有权是Rust最核心、最独特的特性，它使得Rust无需垃圾回收器（GC）就能保证内存安全。理解所有权，是掌握Rust的关键。

  要理解Rust的所有权，首先要明白它解决了什么问题。
  程序的内存通常分为栈（Stack）和堆（Heap）。

  栈的分配和回收速度极快，遵循“后进先出”的原则，用于存储大小固定的数据。（但是它在程序编译的时候就确定了，且比较的小）

  堆则用于存储大小在编译时未知或可能变化的数据，分配和回收相对较慢，且需要精细管理 。（是在程序运行的过程中确定的，但是需要额外的管理）

  而所有权机制主要针对的是位于堆上的数据。


]
#slide[
  #grid(
    columns: (15em, 1fr),
    // 固定左栏宽度+右栏自适应
    gutter: 1em,
    // 栏间距
    // 左栏: 文字内容
    [

      我们可以用一个“餐厅停车”的比喻来理解不同语言的内存管理方式：

      假设现在有一个餐厅的停车场，它很大，大到需要使用导航（内存地址）才能找到在哪里停车。

      作为管理员，你需要知道哪里有位置，并指导顾客把车停到空位上。

      如何完成这件事？？？


    ],
    [
      #image("../images/12.png", width: 100%, alt: "12")
    ],
  )
]
#slide[
  - C/C++ (手动管理):
    - 你得自己找车位停车，并牢牢记住车停在哪儿（就像用 malloc 分配内存）。
    - 吃完饭走的时候，你必须自己负责把车开走（调用 free）。
    - 如果你忘了开走，这辆车就会永远占着车位（内存泄漏）。如果你告诉朋友车在A区，但自己提前开走了，朋友就会扑空（悬垂指针）。
  - Python (垃圾回收):
    -你把钥匙交给门口的服务员（创建对象），就可以直接去吃饭了，非常省心。
    - 服务员会雇一个清洁工（垃圾回收器），他会定时巡视，看到哪些车的车主已经结账走了，就把这些“没人要”的车开走处理掉。
    - 这很方便，但清洁工工作时可能会暂时堵住停车场入口，造成一点点延迟（GC停顿）。

]
#slide[
  - Rust (所有权):
  - 你拿到一张智能钥匙卡（所有权），这张卡与你的餐桌绑定。这是移动这辆车的唯一凭证。
  - 规则极其严格：当你结账离开餐厅时（变量离开作用域），结账系统会强制收回你的钥匙卡，并立即自动把车位清空。
  - 你根本没有机会忘记或搞错，因为不按规矩来，结账系统（编译器）那一关就过不去。

  ```rust
    let s1 = String::from("我的车"); // s1 拥有“智能钥匙卡”
    let s2 = s1; // 钥匙卡交给了 s2，s1 失效了
    // 如果再尝试用 s1，编译器会报错！就像你交出卡后就不能再用了。
    // println!("{}", s1); // 编译错误：value borrowed here after move
  ```
]
#slide[
  #grid(
    columns: (15em, 1fr),
    // 固定左栏宽度+右栏自适应
    gutter: 1em,
    // 栏间距
    // 左栏: 文字内容
    [

      - 继续刚才的例子
      - 现在采用了Rust驱动的停车场管理系统，但是光有这些功能不足以满足顾客的需求

      - 新的需求:
        - 在吃饭期间，顾客的朋友想用一下他的车，但顾客并不想把唯一的“智能钥匙卡”交给他的朋友。


    ],
    [
      #image("../images/13.png", width: 100%, alt: "12")
    ],
  )
]

#slide[
  - 那么Rust是如何完成这件事的呢？
    - Rust为此提供了借用（borrowing）机制，允许在不转移所有权的情况下临时访问数据。
    - 但是借用满足以下两条规则：
      - 在任何给定时间，你可以拥有任意多个不可变引用（`&T`）。
      - 或者，你只能拥有一个可变引用（`&mut T`）。
]
#slide[
  - 用停车场来理解
    - 不可变引用 (&T)：“餐厅可以给很多位顾客你车位的照片（&T），他们都可以凭照片找到你的车并欣赏它，但谁都不能开走或改装它。只要有人在看，车就必须停在原地保持原样
    - -> 可以有多个不可变引用，但此时不能有可变引用。
  ```rust
    fn admire_car(car: &String) { // 得到一张“照片”
        println!("这辆 {} 真不错！", car);
    }
    let my_car = String::from("特斯拉"); // 我拥有车
    admire_car(&my_car); // 朋友A拿照片去看
    admire_car(&my_car); // 朋友B也拿照片去看（可以有很多张照片）
    println!("我的{}还在。", my_car); // 我的车还在，所有权没变
  ```]
#slide[
  - 可变引用 (&mut T)：“餐厅只能把唯一一把代驾钥匙（&mut T）交给一位代驾司机。当司机拿着钥匙时，为了安全，其他人（包括你自己）都不能靠近这辆车（不能有任何其他引用），直到司机把钥匙还回来。”
  - -> 只能有一个可变引用，且此时不能有任何不可变引用。
]
#slide[
  ```rust
   let mut my_car = String::from("保时捷"); // 我有一辆可变的车
    let driver = &mut my_car; // 我把“代驾钥匙”(&mut)交给了司机，这个借用开始了
    // 错误发生点: 在司机还没把钥匙还回来时（`driver`的引用还活跃着），
    // 我（所有者）还想通过 `println!` 偷偷看一眼车。
    // `println!` 需要一个不可变引用 `&my_car`，这与 `driver` 的可变引用冲突了。
    // 这就像代驾正在倒车，你却把头伸进车窗里看，非常危险，编译器会直接禁止！
    println!("看看我的车现在怎么样了：{}", my_car); // <-- 编译错误！
    // 司机完成操作（由于上一行报错，程序无法编译到这里）
    driver.push_str(" (被开走了)");
    // （如果上面那行报错的代码被注释掉，这里就能正常运行）
    // 因为到这里时，`driver` 这个可变引用才被真正使用，
    // 在它使用之后，这个借用就结束了。
    println!("司机开完后，车变成了：{}", driver);
  ```
]


== 尾声
#slide[
  #align(center)[#text(1.5em, weight: "bold")[回顾与总结]]
  #v(1em)
  #align(center)[#text(1.2em)[Rust：挑战“不可能”的现代系统编程语言]]
  #v(1.5em)

  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #heading(level: 3)[核心优势]
      - *告别环境噩梦:* 一站式工具链 `rustup` 和 `cargo`。
      - *性能与安全的统一:* 媲美 C++ 的性能，无 GC 开销。
      - *零成本抽象:* 高度抽象，无运行时损耗。
    ],
    [
      #heading(level: 3)[关键机制]
      - *所有权 (Ownership):* 编译时保证内存安全。
      - *借用 (Borrowing):* 通过 `&` 和 `&mut` 实现安全的数据共享。
      - #text(blue)[编译器的“唠叨”，是你最可靠的伙伴。]
    ],
  )
]

#slide[
  #align(center)[#text(1.5em, weight: "bold")[您的 Rust 之旅才刚刚开始]]
  #v(2em)

  #grid(
    columns: (1fr, 1fr),
    gutter: 3em,
    [
      #heading(level: 3)[下一步探索]
      - *泛型 (`Generics`) 与 `Trait`*: 编写可复用的抽象代码。
      - *生命周期 (`Lifetimes`)*: 深入理解借用检查器。
    ],
    [
      #heading(level: 3)[推荐资源]
      - #link("https://kaisery.github.io/trpl-zh-cn/")[《Rust 程序设计语言》] (The Book)
      - #link("https://doc.rust-lang.org/rust-by-example/zh/index.html")[Rust by Example]
      - #link("https://rustcc.cn/")[Rust 中文社区]
    ],
  )

  #v(3em)
]
#slide[
  #align(center)[
    #text(1.2em, weight: "bold")[欢迎加入 Rustacean 的行列！]
    #image("../images/4.gif", width: 50%, alt: "Rust Crab")
  ]

]
