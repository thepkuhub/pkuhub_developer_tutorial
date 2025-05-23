#import "../globals.typ": *

= Introduction
== PKUHUB 技术部
#slide(composer: (1fr, auto))[
  === 组织架构

  - 后端：秦宏伟、陈佳伟
  - 前端：张家轩 
  - 运维：杨晗
  - 技术指导：黄蔚尧
  - 负责人：徐靖、吴锐
][
  === 工作规划
  #table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: horizon,
    [*项目*], [*时间范围*], [*技术栈*],
    [笔记平台], [2025 March - June], [Python Flask],
    [二手交易平台], [2025 May -], [Python Flask],
    [代码重构], [2025 July -], [Rust, JavaScript]
  )
]




#slide[
  == Tutorials
  - 内容基础且偏实践，最好可以跟上操作
  - 帮助同学迅速掌握 xk 高年级的技术栈，可以上手开发
  - 暑假参与我们的重构工作
  - 加入退出自由

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    [
      === Tutorials Arrangement
      - VS Code & Git：2025.5.31，徐靖
      - Linux 与 Web 部署：2025.6.7，杨晗
      - AI 辅助编程：陈佳伟
      - Rust 系列：...
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
          - 大厂采用，代表行业趋势 
          - 操作系统、RUST 程序设计等课程
        ]
      )
    ]
  )
]

== What we have?

- 两台服务器
  - 感谢 Linux 社赞助的 16c16g：承载计算
  - 腾讯云 2c2g：转发校外流量
- pkuhub.cn 及其代码 
  - 托管在 GitHub 上
  - 1k 用户，500 份各类资料
- 大量文书，参考文档
  - 请加 Telegram 群，同步我们的 commits、issues 等 
  - 讲座的 Typst 源码在 GitHub 上开源
  
== Being a developer of PKUHUB
- 课余时间用于开发，以学业、科研等为主
- 高强度用爱发电
- 群内讨论极多，边学边做
- 不强制安排任务，但任务有时限
- 有空再做，找自己感兴趣/擅长的部分做

