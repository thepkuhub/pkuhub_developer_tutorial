#import "../globals.typ": *



= 就不就业
#slide[
  #heading(level: 3)[简历准备：成长曲线]
  #image("../images/6c5a56a9557dfc0127a44302ab4c7707.jpg", width: 60%)
  #align(center)[
    #image("../images/d5a1ee2442674c64a463a60b411e4f3d.jpg", width: 70%)
  ]
  主页 #link("https://xj.editlife.cn")[xj.editlife.cn]
  微信 15705694836
]
== 周期

#slide[
  行业发展有周期，土木如此，互联网如此，金融如此，LLM 也不例外。
  #pause
  - AI infra 低垂的果实已被摘完 (llm 分 infra, pretrain, posttrain 三个大方向)
  #pause
  - llm 就业竞争白热化
  #pause
  - 量化平稳发展，竞争激烈但机会仍多
  #pause
  - 具身，world model 方兴未艾
  #pause
  - coding agent 和 claw 正在毁灭和创造岗位


]
#slide[
  #image("../images/image.png", width: 80%)
]

#slide[
  #image("../images/image-1.png", width: 80%)
]


#slide[
  === 薪资的真相
  #pause
  假设同学 A 实力超群，在某第一梯队llm公司转正。总包 100w（同级的两倍），其中 base 70w + 期权 30w。

  #pause
  #text(fill: red)[注意：期权短期无法兑现，需等待回购。若两年半内 LLM 行业崩盘，30w 期权将一文不值。]
  #pause
  #table(
    columns: 3,
    align: (left, center, center),
    inset: 0.7em,
    table.header(
      [*时段*], [*年（或半年）应纳税额*], [*估算到手收入（扣除五险一金与个税后）*],
    ),
    [第一年（下半年 6 个月）], [≈ 3.6 w], [≈ 30.5 w（半年）],
    [第二年（全年）], [≈ 10.5 w], [≈ 48.5 w],
    [第三年（全年）], [≈ 10.5 w], [≈ 48.5 w],
  )
  #pause


    - 到手收入：≈ 127.5 w
    - 除去生活开销：实际积累不到 100 w
    - 北京五环内小户型：800-1000 万
]

== Promising的选择不多

#slide[
  #align(center)[#text(1.1em, weight: "bold")[当前值得投入的赛道]]
  #pause
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 1em,
    [
      #rect(fill: luma(95%), inset: 0.8em, radius: 4pt)[
        #text(weight: "bold")[算法]
      ]
    ],
    [
      #rect(fill: luma(95%), inset: 0.8em, radius: 4pt)[
        #text(weight: "bold")[量化]
      ]
    ],
    [
      #rect(fill: luma(95%), inset: 0.8em, radius: 4pt)[
        #text(weight: "bold")[开发]
      ]
    ],
    [
      #rect(fill: luma(95%), inset: 0.8em, radius: 4pt)[
        #text(weight: "bold")[教培]
      ]
    ],
  )
  #pause
  - 硕士和本科区别不大，主要是准备是否充分
  - 博士选择面要广的多
  - 形势不好继续深造
]

== 高薪的实质

#slide[
  
  #pause
  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #text(weight: "bold", blue)[案例：姚顺雨]
      - phd 期间拜入 GPT 开发者门下
      - ReAct 论文一战成名，成为整个 Agent 时代的开创者之一
      - 目前 lead 腾讯混元 team，薪资过亿

      #pause

      #text(size: 0.9em, gray)[抓住了 2022-2023 的黄金窗口期]
    ],
    [
      #pause
      #text(weight: "bold", red)[时间窗口]
      - 2027 年本科毕业时，LLM 格局已基本确定
      - 2032 年博士毕业时，LLM 这个赛道还存在吗？

      #v(1em)

      #text(size: 0.95em)[抓住属于你的窗口，不要盲目复刻他人路径]
    ],
  )
  #align(center)[#text(1.1em, weight: "bold")[没有任何一个人的成长经历可以被复刻]]
]

#slide[
  === 高薪来自于
  #pause
  - 技术壁垒
  - 风险
  #heading(level: 3)[找工作的三个原则]
  #pause
  #align(center)[
    #rect(fill: luma(95%), inset: 1em, radius: 4pt, width: 70%)[
      - 有直系学长带
      - 薪资满意
      - 能发 paper

      #v(0.5em)

      #text(weight: "bold")[满足其中两个就是好选择]
    ]
  ]
]




= 怎么就业
== Connection

#slide[
  #heading(level: 3)[The Strength of Weak Ties（弱关系的力量）]
  #pause
  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #text(weight: "bold")[核心理论]

      弱关系是跨群体的桥梁（bridge ties），能让你触达原本封闭的社交圈层，获取新鲜、异质的机会流。

      #text(weight: "bold")[实证研究]

      2022 年斯坦福 × 哈佛团队通过 LinkedIn 进行全球最大规模实验（5 年，2000 万用户，20 亿新连接，60 万份录用），证实弱关系确实带来更高薪资和更好职位——尤其在数字/科技行业。
    ],
    [
      #text(weight: "bold")[现代启示]

      Granovetter 指出：弱关系不平等分布会加剧阶层固化——弱势群体往往缺乏跨圈层弱关系，信息获取受限。

      #text(weight: "bold")[实用建议]

      维护那些"不常联系但有点交情"的熟人（前同事、校友、行业一面之缘）。
    ],
  )
]




== 实习转正

#slide[
  #heading(level: 3)[现实与破局]
  #pause
  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #text(weight: "bold", red)[现实]
      - 公司更需要能解决问题的人，而不只看 paper 发表数量
      - 高薪工作直接校招对于公司来说过于冒险

      #pause

      #text(weight: "bold")[结论]

      如果准大四暑假开始实习，基本最多只能拿到实习公司的一个 offer。

      #pause
    ],
    [
      成功率：
      - 一般的大厂岗位（如华为等）：100%
      - promising的大厂岗位（如字节等）：50-70%
      - 第一梯队 LLM 算法岗位：10-30%
      #pause
      #text(weight: "bold", green)[破局之路（针对 LLM Posttrain 方向）]
      - Best Paper 级的重大成果
      - 基座模型核心贡献

      #v(1em)

      #text(size: 0.9em, gray)[门槛极高，但并非不可能]
    ],
  )
]

== 无常

#slide[
  #align(center + horizon)[
    #text(1.3em, weight: "bold")[接受不确定性]

    #pause

    #v(1em)

    #text(1em)[
      - 人生无常，不确定性太大
      - 做 llm 犹甚，无法预知三个月后会做什么
    ]

    #pause

    #v(1em)

    #text(0.9em, blue)[在不确定性中保持灵活，留足退路，风险对冲]
  ]
]

== 做点准备

#slide[
  #heading(level: 3)[核心技能与求职准备]
  #pause
  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #text(weight: "bold", blue)[核心技能]

      - Coding Agent（唯一必要且基础的开发能力）

      #pause

      #text(size: 0.9em)[
        2026 年后，不会使用 AI 辅助编程的开发者将失去竞争力
      ]
    ],
    [
      #pause
      #text(weight: "bold", blue)[求职准备]

      - 简历准备
      - 面试技巧
      - 个人品牌建设
    ],
  )
]


#slide[
  #heading(level: 3)[面试技巧]
  #pause
  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #text(weight: "bold")[准备核心项目的深度讲解]

      - STAR 原则（Situation, Task, Action, Result）
      - 个人主页
      - 准备 3-5 个典型项目
      - 每个项目能讲 5-15 分钟
      - 强调你的具体贡献和技术难点
    ],
    [
      #pause
      #text(weight: "bold")[了解目标公司和目标组]

      - 技术栈和业务场景
      - 团队规模和组织架构
      - 最新产品和技术方向
      - 面试官背景（LinkedIn）

      #v(0.5em)

      #text(size: 0.9em, gray)[知己知彼，百战不殆]

      #text(size: 0.9em, gray)[做到：了解信息后，无需准备直接上场]
    ],
  )
]


  