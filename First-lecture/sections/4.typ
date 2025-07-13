#import "../globals.typ": *

= 上期回顾

= 模块化与项目组织 | Project Organization
== Definations
- *项目(Package)*：可以用来构建、测试和分享包
- *工作空间(WorkSpace)*：对于大型项目，可以进一步将多个包联合在一起，组织成工作空间
- *包(Crate)*：一个由多个模块组成的树形结构，可以作为三方库进行分发，也可以生成可执行文件进行运行
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
    
    在中国，父亲往往不希望孩子拥有小秘密，但是在 Rust 中，父模块完全无法访问子模块中的私有项，但是子模块却可以访问父模块、父父..模块的私有项。
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



= 泛型与特性 | Generics & Traits

= 智能指针 | Smart Pointers 

#focus-slide("Thanks!")