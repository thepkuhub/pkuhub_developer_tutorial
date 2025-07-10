#import "../globals.typ": *

= 关于系列讲座
#slide[
  #pause
  - 内容基础且偏实践, 最好可以跟上操作
  #pause
  - 帮助同学迅速掌握 xk 高年级的技术栈, 可以上手开发
  #pause
  - 暑假可选择参与某笔记平台的重构工作, 或其他项目
  #pause
  - 加入退出自由
  #pause
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    [
      === Tutorials Arrangement
      - VS Code & Git : 徐靖
      - Linux 与 Web 部署 : 神秘开发者1
      - AI 辅助编程 : 神秘开发者2
      #pause
      - Rust 系列: ...
      #pause
    ],
    [
      #rect(
        width: 100%,
        height: 6em,
        radius: 8pt,
        fill: rgb("#f0f0f0"),
        stroke: 1pt + rgb("#cccccc"),
        inset: 12pt,
        [
          === 学 Rust 的意义
          - 现代编程语言
          - 大厂采用, 代表行业趋势 
          - 操作系统, RUST 程序设计等课程
        ]
      )
    ]
  )
]

= 对开发的理解
== 技术栈
#slide[
  #pause
现代技术栈呈现分层架构特征: #pause
- 数据: 关系型数据库 (MySQL/PostgreSQL) , NoSQL (MongoDB/Redis) 
- 后端: 运行 (Node.js/Python) , 框架 (Spring/Flask) 
- 前端: 三件套 (HTML/CSS/JS) , 框架 (React/Vue) 
- 通用工具链: 操作系统 (Linux/Windows) , 环境相关 (Docker/npm/pip) , 版本控制 (Git), ai辅助 (Copilot/Cursor)
]



#focus-slide[
  #image("../images/image1.png", width: 90%, height: auto, alt: "技术栈")
]

#slide[
现代技术栈呈现分层架构特征: 
- 数据库: 关系型数据库 (MySQL/PostgreSQL) , NoSQL (MongoDB/Redis) 
- 后端: 运行 (Node.js/Python) , 框架 (Spring/Django) 
- 前端: 三件套 (HTML/CSS/JS) , 框架 (React/Vue) 
- 通用工具链: 操作系统 (Linux/Windows) , 虚拟化 (Docker/K8s) , 版本控制 (Git) , 包管理 (npm/pip) , CI/CD (Jenkins) 

原则: 
1. 边做边学, 按需学习
2. 大项目做阶段规划, 避免过度设计
]

== 信息
#slide[
#pause
=== 两面性
#pause
- 未知不可知 : 如果没有人告诉你某个工具好用, 你可能永远不会知道他的存在
#pause
- 已知不可逆 : 一旦接收某个信息, 就永远受其影响
#pause
=== 认知局限与突破
#pause
- 信息茧房: 开发者常陷入技术舒适区, 例如: 
  - 初学 latex 写数学公式疯狂查表, 却不知道有直接手写识别的网站 
#pause
- 选择与机会成本: 同时接触多种框架时, 决策成本反而增加
#pause

=== 技术债务的不可逆性
#pause
- 绑定诅咒: 选择 Angular / Django 意味着接受其完整生态
#pause
- 知识沉淀: 长期使用 for-loop 循环, 在 pytorch 编程中理解 tensor 操作会变得困难
]
== 学习曲线
#slide[
#grid(
  columns: ( 1fr, 14em),  // 固定左栏宽度+右栏自适应
  gutter: 1em,          // 栏间距
    // 左栏: 文字内容
    [
    #pause
    // 右栏: 图片区域
    #image("../images/image2.png", width: 90%, alt: "技术架构图")
    ],
    [ 
      #pause
      相比于平缓且线性的课程学习, 开发技术栈的学习曲线更陡峭, 多样, 混乱
      #pause
      === 广度搜索
      #pause
      - 积累 : 有玩具到手就试一下
      #pause
      - 氛围 : 参与任何形式任何媒介的讨论, 关注技术动态
      #pause
      - 切忌对教材, 教程硬啃 
      #pause
      === 深度搜索
      #pause
      - 优先官方文档
      #pause
      - 边做边学
    ]
)
]
= Vscode & Github
== 直击痛点
#focus-slide[
#image("../images/8fabba2be75b51d2d4fba5491171bb9c.jpg", width: 90%, alt: "Vscode")
]
== 简单认识 Vscode 
#slide[
#pause
=== 左导航栏
- 资源管理器, 搜索, 源代码管理, 运行与调试, 扩展
#pause
=== 常用扩展
- Python, Markdown All in One, Copliot, Remote - SSH
#pause
=== 常用快捷键
``` Ctrl + Shift + P ``` 打开命令面板

``` Ctrl + Shift + N ``` 新建窗口

``` Ctrl + Shift + ~ ``` 呼出终端
]
== Github 与 Git
#slide[
  #pause
#grid(
  columns: (10em, 1fr),  // 固定左栏宽度+右栏自适应
  gutter: 1em,          // 栏间距
    // 左栏: 文字内容
    [
      Git : 版本控制工具
      Github : 代码托管平台
      #pause
      === A repository
      #pause
      Owner : 
      - commit and push
      #pause
      Others :
      - star
      - fork 
      - pull request
      - issue
    ],
    [
    #pause
    #image("../images/image3.png", width: 100%, alt: "技术架构图")
    ]
)
]


== 上手配置个人网站
#slide[
  #pause
- 安装 vscode & git, 拥有一个github账户
#pause
1. 确保你确实完成了以上工作: 

```bash
ssh -T git@github.com
```

Hi ICUlizhi! You've successfully authenticated, but GitHub does not provide shell access.
#pause
2. fork 个人主页模板仓库

- #text(fill: green,"https://github.com/ICUlizhi/academicpages-stu-")

#pause
- 在repository name里填入yourname.github.io #pause
- 在Settings -> Pages 里设置 Source 为 main branch
]




= Git 入门
#slide[
#image("../images/image4.png", width: 100%, alt: "Git 文件状态")
]

== Git 的文件状态
#slide[
#pause
Git 赋予文件两种状态: 未跟踪 (untracked) 和已跟踪 (tracked)
#pause
#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [- 从未跟踪到已跟踪 - 直接执行:], [```bash
    git add abcd.txt
    git commit -m "Add abcd"
    ```])
]

#slide[
#image("../images/image4.png", width: 100%, alt: "Git 文件状态")
]

#slide[
Git 赋予文件两种状态: 未跟踪 (untracked) 和已跟踪 (tracked)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [- 从未跟踪到已跟踪 - 直接执行:], [```bash
    git add abcd.txt
    git commit -m "Add abcd"
    ```],
  [- 从已跟踪到未跟踪 - 直接执行:], [```bash
    git rm --cached abcd.txt
    git commit -m "Remove abcd"
    ```]
)
]

#slide[
#image("../images/image4.png", width: 100%, alt: "Git 文件状态")
]

#slide[
Git 赋予文件两种状态: 未跟踪 (untracked) 和已跟踪 (tracked)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [- 从未跟踪到已跟踪 - 直接执行:], [```bash
    git add abcd.txt
    git commit -m "Add abcd"
    ```],
  [- 从已跟踪到未跟踪 - 直接执行:], [```bash
    git rm --cached abcd.txt
    git commit -m "Remove abcd"
    ```],
  [- 修改已跟踪文件 -  先修改代码再执行:], [```bash
    git add abcd.txt
    git commit -m "Update abcd"
    ```]
)
]

#slide[
#image("../images/image4.png", width: 100%, alt: "Git 文件状态")
]

#slide[
Git 赋予文件两种状态: 未跟踪 (untracked) 和已跟踪 (tracked)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [- 从未跟踪到已跟踪 - 直接执行:], [```bash
    git add abcd.txt
    git commit -m "Add abcd"
    ```],
  [- 从已跟踪到未跟踪 - 直接执行:], [```bash
    git rm --cached abcd.txt
    git commit -m "Remove abcd"
    ```],
  [- 修改已跟踪文件 -  先修改代码再执行:], [```bash
    git add abcd.txt
    git commit -m "Update abcd"
    ```]
)
  #pause
      #rect(
        width: 100%,
        height: 4em,
        radius: 8pt,
        fill: rgb("#f0f0f0"),
        stroke: 1pt + rgb("#cccccc"),
        inset: 12pt,
        [
          === 为什么要 commit ? 
          Git 不"跟踪"单个文件的变化, 而是每次 commit 都会创建项目的一个完整快照
        ]
      )
]

== 修改网站内容
#slide[
#pause
3. clone 到本地

#pause
```bash
git clone git@github.com:yourname/academicpages-stu-.git
cd academicpages-stu-
```
#pause
4. 修改后提交
#pause
```bash
git add .
git commit -m "Initial commit"
git push origin main
```
]


== Git分支
#slide[
#diagram(
	node-stroke: .1em,
	node-fill: gradient.radial(blue.lighten(80%), blue, center: (30%, 20%), radius: 80%),
	spacing: 4em,
  edge((0,-1), (0,0), "-|>", `main`, label-pos: 0, label-side: center),
	node((0,0), `first commit`, radius: 2em)
)
]
#slide[
#diagram(
	node-stroke: .1em,
	node-fill: gradient.radial(blue.lighten(80%), blue, center: (30%, 20%), radius: 80%),
	spacing: 4em,
  edge((1,-1), (1,0), "-|>", `main`, label-pos: 0, label-side: center),
	node((0,0), `first commit`, radius: 2em),
	edge(`commit`, "-|>"),
	node((1,0), `add a.txt`, radius: 2em)
)
]
#slide[
#diagram(
	node-stroke: .1em,
	node-fill: gradient.radial(blue.lighten(80%), blue, center: (30%, 20%), radius: 80%),
	spacing: 4em,
  edge((2,-1), (2,0), "-|>", `main`, label-pos: 0, label-side: center),
	node((0,0), `first commit`, radius: 2em),
	edge(`commit`, "-|>"),
	node((1,0), `add a.txt`, radius: 2em),
	edge(`commit`, "-|>"),
	node((2,0), `rm a.txt`, radius: 2em)
)
]
#slide[
#diagram(
	node-stroke: .1em,
	node-fill: gradient.radial(blue.lighten(80%), blue, center: (30%, 20%), radius: 80%),
	spacing: 4em,
  edge((2,-1), (2,0), "-|>", `main`, label-pos: 0, label-side: center),
	node((0,0), `8df31`, radius: 2em),
	edge(`commit`, "-|>"),
	node((1,0), `9dea3`, radius: 2em),
	edge(`commit`, "-|>"),
	node((2,0), `er39f`, radius: 2em)
)
]
#slide[
#diagram(
	node-stroke: .1em,
	node-fill: gradient.radial(blue.lighten(80%), blue, center: (30%, 20%), radius: 80%),
	spacing: 4em,
  edge((1,-1), (1,0), "-|>", `main`, label-pos: 0, label-side: center),
	node((0,0), `8df31`, radius: 2em),
	edge(`commit`, "-|>"),
	node((1,0), `9dea3`, radius: 2em)
)
]
#slide[
#diagram(
	node-stroke: .1em,
	node-fill: gradient.radial(blue.lighten(80%), blue, center: (30%, 20%), radius: 80%),
	spacing: 4em,
  edge((1,-1), (1,0), "-|>", `main`, label-pos: 0, label-side: center),
	node((0,0), `8df31`, radius: 2em),
	edge(`commit`, "-|>"),
	node((1,0), `9dea3`, radius: 2em),
  edge((1,1), (1,0), "-|>", `need_b`, label-pos: 0,label-side: center)
)
]
#slide[
#diagram(
	node-stroke: .1em,
	node-fill: gradient.radial(blue.lighten(80%), blue, center: (30%, 20%), radius: 80%),
	spacing: 4em,
  edge((2,-1), (2,0), "-|>", `main`, label-pos: 0, label-side: center),
	node((0,0), `8df31`, radius: 2em),
	edge(`commit`, "-|>"),
	node((1,0), `9dea3`, radius: 2em),
  edge(`commit`, "-|>"),
	node((2,0), `er39f`, radius: 2em),
  edge((1,1), (1,0), "-|>", `need_b`, label-pos: 0,label-side: center)
)
]
#slide[
#diagram(
	node-stroke: .1em,
	node-fill: gradient.radial(blue.lighten(80%), blue, center: (30%, 20%), radius: 80%),
	spacing: 4em,
  edge((2,-1), (2,0), "-|>", `main`, label-pos: 0, label-side: center),
	node((0,0), `first commit`, radius: 2em),
	edge(`commit`, "-|>"),
	node((1,0), `add a.txt`, radius: 2em),
	edge(`commit`, "-|>"),
	node((2,0), `rm a.txt`, radius: 2em),
  edge((1,0), (2,1), `commit`, "-|>"),
  node((2,1), `add b.txt`, radius: 2em),
  edge((1,1), (2,1), "-|>", `need_b`, label-pos: 0,label-side: center), 
)
]


== Git 工作流
#slide[
#pause
#grid(
  columns: (10em, 1fr),  // 固定左栏宽度+右栏自适应
  gutter: 1em,          // 栏间距
    // 左栏: 文字内容
    [
      - master : 正式发布版
      - develop : 开发版
      - feature : 功能分支
      - release : 发布分支
      - hotfix : 紧急修复
    ],
    [
    #image("../images/image5.png", width: 100%, alt: "Git 工作流")
    ]
)
]
== 常用语句
#slide[
#grid(
  columns: (20em, 1fr),  // 固定左栏宽度+右栏自适应
  gutter: 1em,          // 栏间距
    // 左栏: 文字内容
    [
    #pause
    - 我是谁, 我在哪
    ```bash
    git status
    git branch
    ```
    #pause
    - 创建并切换到新分支(基于当前分支)
    - 去掉 `-b` 可以只切换不创建
    ```bash
    git checkout -b new-branch 
    ```
    #pause
    - 合并分支 : 将分支 feature 合并到当前分支
    ```bash
    git merge feature
    ```
    ],
    [
    #pause
    - 将别人/自己的仓库 clone 到本地
    ```bash
    git clone git@github.com:zhangsan/hisproject.git
    ```
    #pause
    - 将本地分支 branch1 推送到远程仓库
    ```bash
    git push origin branch1
    ```
    #pause
    - 将远程分支 branch1 拉取到本地 
    ```bash
    git pull origin branch1
    ```
    ]
)
]

== A repository 
#slide[
#grid(
  columns: (20em, 1fr),  // 固定左栏宽度+右栏自适应
  gutter: 1em,
[
#pause
```bash
my-project/
├── .github/
│   ├── workflows/       # GitHub Actions
│   ├── ISSUE_TEMPLATE/
├── src/                 # 源代码
├── tests/               # 测试代码
├── docs/                # 文档
├── README.md            # 项目说明
├── .gitignore           # 忽略规则
├── LICENSE              # 许可证
└── requirements.txt / package.json    # 依赖
```
],
[
#pause
  === .gitignore 新手常见错误
#pause
- 暂存常用 ```bash git add .```
#pause
- 如果 .gitignore 中包含了某个文件, 那么这个文件不会被添加到暂存区
#pause
- 错误 : 如果你在 .gitignore 中添加了某个文件, 但之前已经跟踪过, 那么这个文件仍然会被跟踪. 
#pause
- 一般只要不使用 -f , 犯错都可以挽回
]
)
]
= 下期预告 & 答疑环节
#focus-slide[
  #image("../images/404notfound.png")
]

#focus-slide("Thanks!")