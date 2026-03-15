#import "../globals.typ": *

= 我们总是在低估人工智能

== 我们总是在低估人工智能

#slide[
  #heading(level: 3)[超越预期的现实]

  今天我们看到的 AI 能力，5 年前被认为是"科幻"：

  #pause

  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #text(weight: "bold", blue)[编程开发]
      - 独立开发完整应用
      - 调试复杂系统 Bug
      - 跨语言重构代码
      - 通过顶级编程竞赛

      #pause

      #text(weight: "bold", blue)[科学研究]
      - 辅助数学定理证明
      - 设计新材料分子
      - 分析实验数据
      - 撰写学术论文
      
      #pause
    ],
    [
      #text(weight: "bold", blue)[创意工作]
      - 生成商业级设计
      - 创作音乐和剧本
      - 制作视频内容
      - 构建 3D 场景

      #pause

      #text(weight: "bold", blue)[复杂推理]
      - 多步骤战略规划
      - 实时决策优化
      - 跨领域知识整合
      - 长期目标执行
    ],
  )


]

== FARS 全自动科研系统


#slide[
  #heading(level: 3)[端到端 AI 研究流水线 — Analemma.ai]
  #pause
  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #align(center)[
        #image("../images/fars.jpg", width: 90%)

        #v(0.5em)

        #text(size: 0.9em)[FARS = Fully Autonomous Research System]

        #v(0.5em)

        #text(size: 0.8em, gray)[Source: analemma.ai/fars]
      ]
    ],
    [
      #pause
      #text(weight: "bold")[四大智能体]
      - Ideation: 文献调研与假设生成
      - Planning: 实验设计与方法选择
      - Experiment: 代码执行与数据分析
      - Writing: 论文撰写与 LaTeX 导出

      #v(1em)
      #pause
      #text(weight: "bold")[直播成果]
      - 228 小时连续运行
      - 生成 244 个研究假设
      - 产出 100 篇学术论文草稿
      - 单篇成本约 \$1,000
    ],
  )
]

== Claude Code 

#slide[


  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #align(center + horizon)[
        #image("../images/claudecode.png", width: 95%)
      ]
    ],
    [
      #pause

      #text(weight: "bold")[核心能力]
      - 理解大型代码库
      - 自主读写文件
      - 执行命令和测试
      - 多步骤任务规划

      #pause
      #text(weight: "bold")[技术突破]
      - Agent RL 训练
      - 工具一体化（非外挂）
      - 环境感知反馈循环
      - 长链条任务执行



      #text(size: 0.9em)[AI 从 "Copilot" 进化为 "Coder"]
    ],
  )
]

== OpenCLAW 

#slide[
  #heading(level: 3)[个人通用 AI 助手]

  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #align(center + horizon)[
        #image("../images/openclaw.png", width: 95%)
      ]
    ],
    [
      #pause
      #text(weight: "bold")[核心特性]
      - 本地运行的多 Agent 系统
      - 支持 20+ 渠道 (Slack/Discord/Telegram)
      - Hub-and-Spoke 架构设计

      #pause
      #text(weight: "bold")[技术亮点]
      - Gateway 控制平面
      - Agent Runtime (Pi Core)
      - 内存与工具沙箱
      - 会话路由与队列管理

      #text(size: 0.9em)[AGI 雏形]
    ],
  )
]

#focus-slide[
  本讲座的动机

  #text(size: 0.75em)[
    #text(weight: "bold")[1. 个人体验有偏差]

    AI 与互联网产品不同，使用体验因人而异

    你觉得"很智能"的功能，别人可能觉得"不靠谱"
  ]

  #text(size: 0.75em)[
    #text(weight: "bold")[2. 讨论停留在表面]

    非 AI 方向的学界/校内对 LLM 的讨论常止步于使用层面

    缺乏对技术本质和能力边界的理解
  ]

  #text(size: 0.75em)[
    #text(weight: "bold")[3. 后训练与 Agent 并非纯数学魔术]

    2026 年的现代 LLM 依赖 #text(blue)[Posttrain] 和 #text(blue)[Agent] 在各种任务上泛化

    这两者不完全是数学/算法的魔术，#text(red)[非专业人员也可以理解]
  ]


  #v(0.5em)

  #text(size: 0.7em)[
    结论：把 Transformer 当黑盒，也能摸清 AI 能力的边界
  ]
]

= LLM工业构成

== 三个核心方向

#slide[
  #align(center)[#text(1.2em, weight: "bold")[LLM 工业的三大支柱]]

  #pause

  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    [
      #rect(fill: luma(95%), inset: 0.8em, radius: 4pt)[
        #text(1em, weight: "bold")[Infra 基础设施]
        #text(size: 0.85em)[
          推理引擎与部署

          - vLLM/SGLang
          - KV Cache管理
          - 量化与压缩
          - 并行解码策略
        ]
      ]
    ],
    [
      #rect(fill: luma(95%), inset: 0.8em, radius: 4pt)[
        #text(1em, weight: "bold")[Pretrain 预训练]
        #text(size: 0.85em)[
          基础能力构建

          - 语言建模目标
          - Scaling Law
          - 数据配比与筛选
          - 分布式训练
        ]
      ]
    ],
    [
      #rect(fill: luma(95%), inset: 0.8em, radius: 4pt)[
        #text(1em, weight: "bold")[Posttrain 后训练]
        #text(size: 0.85em)[
          能力对齐与提升

          - SFT监督微调
          - RLHF/RLVR
          - Reasoning训练
        ]
      ]
    ],
  )
]


== Scaling Law：规模法则

#slide[
  DeepMind的Chinchilla研究（2022）发现经验规律：

  #pause

  #align(center)[
    #rect(fill: luma(95%), inset: 1em, radius: 4pt, width: 80%)[
      最优训练：模型参数量 $N$ 与训练token数 $D$ 应等比例增长

      $D approx 20N$ （每个参数约需20个token）
    ]
  ]

  #pause

  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      边际效应递减：
      - 从1B到10B：能力飞跃
      - 从100B到200B：提升有限
      - 数据: 分布 > 质量 > 数量

      思考: 智能是否是复杂度的涌现？
    ],
    [
      #pause
      scaling law 的背后是更多训练和推理方式无法被 scale：
      - 可能在 M 级参数量上有用，但是在 B 级参数量上失效
      - AI 学界某种意义上也是在探索能够 scale 的方式，但是受算力 bound
    ],
  )
]

== 为什么需要Posttrain？

#slide[
  #heading(level: 3)[预训练模型的问题：有知识，无礼仪]
  #pause
  预训练后的模型像个什么都知道但不懂礼貌的书呆子：
  #pause

  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #rect(fill: luma(230), inset: 1em, radius: 4pt)[
        #text(weight: "bold")[用户]
        怎么学Python？

        #text(weight: "bold")[预训练模型]
        Python是一种高级编程语言，
        由Guido van Rossum于1991年创建。
        Python的设计哲学强调代码的可读性...

        #text(gray)[答非所问，只是"续写"前文]
      ]
    ],
    [
      #rect(fill: rgb(230, 245, 230), inset: 1em, radius: 4pt)[
        #text(weight: "bold", green)[用户]
        怎么学Python？

        #text(weight: "bold", green)[对话模型]
        建议按以下步骤：
        1. 先学基础语法
        2. 做小项目练手
        3. 看优秀代码学习

        #text(green)[真正回答用户的问题]
      ]
    ],
  )
  #pause
  后训练就是让书呆子学会"听话"和"好好说话"。
]

#slide[
  #align(center)[
    #text(1.1em, weight: "bold")[LLM 是在流形上跋涉的小虫]
    
    
    #box(width: 80%, height: 50%)[
      // 3D 曲面效果：多层半透明曲线模拟深度
      // 后面的层（较暗，位置靠后）
      #place(dx: 8%, dy: 15%)[
        #curve(
          stroke: rgb("#ddd"),
          fill: rgb("#e8e8e8"),
          curve.move((0%, 0%)),
          curve.cubic((15%, -8%), (25%, 8%), (40%, -5%)),
          curve.cubic((50%, 10%), (60%, -12%), (75%, 5%)),
          curve.cubic((85%, -8%), (95%, 3%), (100%, 0%)),
        )
      ]
      
      // 中间层
      #place(dx: 10%, dy: 20%)[
        #curve(
          stroke: rgb("#bbb"),
          fill: rgb("#d0d0d0"),
          curve.move((0%, 0%)),
          curve.cubic((15%, -10%), (25%, 12%), (40%, -8%)),
          curve.cubic((50%, 15%), (60%, -15%), (75%, 8%)),
          curve.cubic((85%, -10%), (95%, 5%), (100%, 0%)),
        )
      ]
      
      // 前面的层（较亮，位置靠前）- 主曲面
      #place(dx: 12%, dy: 25%)[
        #curve(
          stroke: rgb("#999"),
          fill: rgb("#e0e8e0"),
          curve.move((0%, 0%)),
          curve.cubic((15%, -12%), (25%, 15%), (40%, -10%)),
          curve.cubic((50%, 18%), (60%, -18%), (75%, 10%)),
          curve.cubic((85%, -12%), (95%, 8%), (100%, 0%)),
        )
      ]
      
      // 网格线效果（横向）
      #place(dx: 12%, dy: 28%)[
        #line(start: (0%, 0%), end: (100%, 0%), stroke: rgb("#aaa").lighten(30%))
      ]
      #place(dx: 12%, dy: 32%)[
        #line(start: (10%, -5%), end: (90%, -5%), stroke: rgb("#aaa").lighten(30%))
      ]
      #place(dx: 12%, dy: 36%)[
        #line(start: (20%, -3%), end: (80%, -3%), stroke: rgb("#aaa").lighten(30%))
      ]
      
      // 小虫/LLM（在主曲面上）
      #place(dx: 40%, dy: 22%)[
        #circle(radius: 10pt, fill: rgb("#0c4842"), stroke: 2pt + white)
      ]
      
      // 移动轨迹箭头（沿着曲面切线方向）
      #place(dx: 48%, dy: 18%)[
        #text(size: 1.8em, rgb("#0c4842"))[→]
      ]
      
      // 概率梯度箭头（指向波谷）
      #place(dx: 35%, dy: 10%)[
        #text(size: 1.2em, rgb("#666"))[↓]
      ]
      
      // 标注
      #place(dx: 55%, dy: 40%)[
        #text(size: 0.7em, gray)[语言概率流形]
      ]
      
      #place(dx: 38%, dy: 30%)[
        #text(size: 0.6em, rgb("#0c4842"))[LLM]
      ]
      
      #place(dx: 5%, dy: 5%)[
        #text(size: 0.6em, gray)[起点]
      ]
      
      #place(dx: 88%, dy: 8%)[
        #text(size: 0.6em, gray)[终点]
      ]
    ]
    
    #pause
    #text(size: 0.8em)[
      语言空间是一张褶皱的白纸
      
      LLM 沿着概率的丝线蜿蜒前行
      
      寻找最平缓的坡度（最大概率）
    ]
  ]
]

= 推理的三重境界

== 从"做题"到"干活"

#slide[
  #align(center)[#text(1.2em, weight: "bold")[推理能力的三个层次]]

  #pause

  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    [
      #rect(fill: luma(95%), inset: 0.8em, radius: 4pt)[
        #text(weight: "bold")[CoT]
        思维链
        Wei et al., 2022
        在流形上多走几步
      ]
    ],
    [
      #rect(fill: luma(95%), inset: 0.8em, radius: 4pt)[
        #text(weight: "bold")[ReAct]
        推理+行动
        Yao et al., 2023
        跳出文本查资料
      ]
    ],
    [
      #rect(fill: luma(95%), inset: 0.8em, radius: 4pt)[
        #text(weight: "bold")[Agent]
        智能体
        规划+记忆+工具
        在流形上长途跋涉
      ]
    ],
  )

  #pause

  核心演进：从"回答"到"完成任务"。
]

== CoT：思维链
#focus-slide[
  CoT 的本质：把跳跃变成漫步

  #text(size: 0.8em)[
    复杂问题的解答需要多步推理
  ]

  #text(size: 0.7em)[
    隐式推理 → 外显化

    每步可验证、出错可定位
  ]

  #text(size: 0.6em, gray)[
    魔法咒语："Let's think step by step"
  ]
]

#slide[


  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #text(weight: "bold")[标准Prompting]
      ```
      User: 鸡兔同笼，头35，脚94？
      Assistant: 鸡23，兔12。
      ```
    ],
    [
      #text(weight: "bold", blue)[CoT Prompting]
      ```
      User: 鸡兔同笼...
      Thinking: 假设全是鸡→70只脚
         实际94只，多24只
         每只兔多2只脚
      Assistant: 兔12只，鸡23只
      ```
    ],
  )
  #align(center)[
    #image("../images/cot.png", width: 72%)
  ]
]

== ReAct：推理与行动

#slide[
  #heading(level: 3)[Yao et al., "ReAct: Synergizing Reasoning and Acting in Language Models", 2023]

  #align(center)[
    #image("../images/react.png", width: 70%)
    #v(0.5em)
    #text(size: 0.8em)[来源：Yao et al., ICLR 2023]
  ]


  推理和行动应该交替进行

]


== Agent：长途跋涉的规划者

#slide[
  #heading(level: 3)[Agent = LLM + 规划 + 记忆 + 工具]

  Agent要解决的是：用户目标明确，但路径很长的任务。


  例子："帮我订下周去上海的机票"


  Agent的工作流程：
  1. #text(weight: "bold")[规划]：查航班→比价→选座→预订
  2. #text(weight: "bold")[记忆]：用户偏好（上午飞、靠窗）
  3. #text(weight: "bold")[工具]：调用航旅API
  4. #text(weight: "bold")[反思]：如果售罄，换其他航班

  这相当于在流形上进行一次长途旅行，
  需要路线图（规划）、补给站（记忆）、交通工具（工具）。
]

= 如何判断模型好坏

#focus-slide[

  #text(size: 0.8em)[
    Benchmark = 标准化测试集 + 评测方法

    衡量模型在特定任务上的能力水平
  ]
]

== 为什么需要Benchmark？

#slide[
  #heading(level: 3)[个人感官测评为什么不靠谱]

  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #text(weight: "bold")[个人测评的陷阱]

      - #text(red)[样本量太小]：问了10个问题就下结论
      - #text(red)[选择偏差]：只测自己熟悉的领域
      - #text(red)[时序污染]：先看到模型A的答案，潜意识影响对B的判断
      - #text(red)[情绪干扰]：心情不好时觉得哪个都差

      "我觉得这个模型更聪明" —— 可能纯属幻觉
    ],
    [
      #text(weight: "bold")[Benchmark的价值]

      - #text(green)[大规模]：数千到数万道题
      - #text(green)[标准化]：统一prompt、统一评分
      - #text(green)[可重复]：任何人跑结果一样
      - #text(green)[可比较]：模型A 72分 > 模型B 68分

      用统计学对抗主观偏差
    ],
  )
]

== 两个硬核Benchmark示例

#slide[
  #heading(level: 3)[HLE & SWE-bench]

  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #text(weight: "bold")[Humanity's Last Exam]
      - 2025年新发布的权威benchmark
      - 汇集全球顶尖专家的难题
      - 涵盖数学、物理、化学、生物、CS等
      - 题目极其困难，人类专家也会错

      设计理念：当AI在这个考试上得满分，
      人类就再也没有考试可出了。
    ],
    [
      #text(weight: "bold")[SWE-bench]
      - 真实GitHub Issue修复任务
      - 给定bug描述和代码库，让AI修bug
      - 端到端测试：改完代码要能通过测试

      特点：比写代码更难，因为要理解代码库、定位问题、修改代码、验证结果，整个过程考验一位开发者的综合实力。
    ],
  )
]

== 权威平台：Artificial Analysis

#slide[
  #heading(level: 3)[https://artificialanalysis.ai/]

  #align(center)[
    #image("../images/aaindex.png", width: 85%)
    #text(size: 0.8em)[目前最直观的模型能力对比平台]
  ]
]

== Benchmark的阴暗面：数据泄露

#slide[
  #heading(level: 3)[IMO：一个被"泄露麻了"的例子]

  国际数学奥林匹克（IMO）题目本应极难，但：


  ```
  某模型 IMO 成绩：从10% → 50% → 90%
  时间跨度：6个月
  ```


  发生了什么？
  - IMO历年题目在网上有详细解答
  - 模型训练时"看过"这些题
  - 测试时只是回忆，不是推理

  更隐蔽的泄露：测试集被混入预训练数据，厂商自己都未必知道。
]

== Hack Benchmark的三重境界

#slide[
  #heading(level: 3)[从"作弊"到"刷分"的进化]

  #table(
    columns: (1fr, 2fr, 2fr),
    inset: 0.8em,
    table.header(
      [#text(weight: "bold")[层次]],
      [#text(weight: "bold")[手段]],
      [#text(weight: "bold")[举例]],
    ),
    [数据泄露],
    [测试集混入训练数据],
    [IMO历年题在网上有解答],
    [Agent作弊],
    [评测时用工具/搜索],
    [模型去 HuggingFace 上搜原答案],
    [定向优化],
    [专门训练刷分技巧],
    [在GSM8K上overfit，
    其他任务反而下降],
  )
]

== 应对：自建OOD Bench

#slide[
  #heading(level: 3)[Out-of-Distribution：分布外]

  应对数据泄露的唯一办法：自己造题。


  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #pause
      #text(weight: "bold")[OOD Bench设计原则]
      - 题目不公开，只给测试接口
      - 动态生成变体题
      - 结合实时事件（今天的新闻）
      - 人工审核防止泄露
    ],
    [
      #pause
      #text(weight: "bold")[个人用户的替代方案]
      - 用自己的私有数据测试
      - 测最新发生的事件（训练数据截止后）
      - 测具体工作场景的真实任务

    ],
  )
]

== 看分数的防坑指南

#slide[
  #heading(level: 3)[如何不被分数忽悠？]
  #pause
  1. #text(weight: "bold")[看测试集是否泄露]
     - 模型训练时可能"偷看"过考题
     - 新benchmark（HLE、LiveBench）更难作弊
  #pause
  2. #text(weight: "bold")[看对应具体任务的权威bench]
     - 写代码？重点看SWE-bench
     - 做数学？看最新题 26 HMMT 而非 IMO
     - 别只看平均分
  #pause
  3. #text(weight: "bold")[警惕"对齐税"]
     - RLHF过度的模型可能太保守
     - 分数高但实际很难用
]

#focus-slide[终极方案：问认识的炼丹师]

#focus-slide[
  后训练：从学习到探索


  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    [
      #text(size: 0.7em)[
        #text(weight: "bold")[SFT]
        
        模仿老师
        
        知其然
      ]
    ],
    [
      #text(size: 0.7em)[
        #text(weight: "bold")[RLHF]

        学习审美

        知其所以然
      ]
    ],
    [
      #text(size: 0.7em)[
        #text(weight: "bold")[RLVR/Agent RL]
        
        自主探索
        
        青出于蓝
      ]
    ],
  )
]

= LLM训练方法详解

== SFT：模仿老师的言行 (2019+)

#slide[
  #heading(level: 3)[监督微调：背诵标准答案 — BERT/GPT-2 时期]
  #pause
  SFT就像让学生背诵优秀作文范文：
  ```json
  {
    "messages": [
      {"role": "user", "content": "怎么减肥？"},
      {"role": "assistant", "content": "建议：1）控制饮食..."}
    ]
  }
  ```
  #pause
  用数千条这样的"问答对"训练模型

  但这只是模仿，模型并不理解什么是"好回答"
]

== 蒸馏：小模型学大模型 (2019+)

#slide[
  #heading(level: 3)[模型还是蒸的好]


  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #pause
      #text(weight: "bold")[蒸馏的本质]

      让小模型（Student）模仿大模型（Teacher）的行为

      #pause
      #text(weight: "bold")[为什么要蒸馏？]

      - 大模型太贵太慢
      - 端侧设备资源有限
      - 低延迟场景（小于100ms）
      - 成本敏感应用
    ],
    [
      #align(center + horizon)[
        #image("../images/蒸功夫.jpg", width: 85%)
      ]
    ],
  )
]



== RLHF：学会审美 (2022)

#slide[
  #heading(level: 3)[InstructGPT：从模仿到偏好 — ChatGPT 的核心技术]

  InstructGPT的核心洞察：人工反馈比单纯模仿更重要

  #pause

  三阶段流程：
  #pause
  1. #text(weight: "bold")[SFT]：用标注数据做监督微调
  #pause
  2. #text(weight: "bold")[Reward Model]：训练模型学习人类偏好（哪个回答更好）
  #pause
  3. #text(weight: "bold")[PPO优化]：用强化学习优化策略

  #pause

  #v(0.5em)

  #text(size: 0.85em)[
    RL vs 深度学习：强化学习面对不可导的环境反馈（人类偏好），需要PPO算法稳定优化
  ]

  #pause

  #align(center)[
    #image("../images/rlhf.png", width: 80%)
  ]


  



]


== RLHF：奖励模型如何工作

#slide[
  #heading(level: 3)[奖励模型：学习人类的品味]

  #grid(
    columns: (1fr, 1fr),
    gutter: 1.5em,
    [
      #pause
      同一个问题，两个回答：


      回答A："少吃多运动"

      （简洁但不够 helpful）


      回答B："建议：1）控制精制碳水
      2）每周3次有氧运动
      3）保证7小时睡眠"

      （详细、实用、结构化）


      人类标注：B > A
    ],
    [
      #pause
      Reward Model学会给回答打分：
      - Helpful（有帮助）
      - Harmless（无害）
      - Honest（诚实）

      #pause
      然后用PPO算法优化LLM，
      让它生成高分回答


      约束：不能偏离SFT模型太远（KL散度约束）

      #pause
      #text(size: 0.85em)[
        2023 DPO（Direct Preference Optimization）跳过Reward Model，直接从偏好数据优化策略，简化了RLHF流程
      ]
    ],
  )
]

#focus-slide[
  RLHF 


  #text(size: 0.8em)[
    不追求"正确"，而是追求"人类更喜欢"
  ]

  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    [
      #text(size: 0.7em)[
        SFT

        1. 收集数据
        2. 监督训练

        #text(gray)[成本高]
      ]
    ],
    [
      #text(size: 0.7em)[
        Reward Model

        3. 偏好比较
        4. 打分训练

        #text(gray)[需要标注]
      ]
    ],
    [
      #text(size: 0.7em)[
        PPO

        5. 强化优化
        6. 策略更新

        #text(gray)[计算密集]
      ]
    ],
  )
]

== RLVR：用对错代替喜好 (2025)

#slide[
  #heading(level: 3)[RLVR：可验证奖励的强化学习 — DeepSeek-R1 的核心技术]

  RLHF的问题：需要人工标注偏好，主观且昂贵


  RLVR的洞察：数学和代码有标准答案，不需要人打分！


  ```
  问题：357 × 482 = ?

  模型回答：172,074

  验证：357 × 482 = 172,074 ✓

  奖励：+1（答对了）
  ```


  奖励信号极其简单：答对+1，答错0

  但模型自己学会了长链条推理和"反思"
]

#focus-slide[
  RLVR：无需人类标注的 RL

  #text(size: 0.8em)[
    RLHF 的问题：需要人工标注偏好

    #text(gray)[主观、昂贵、难以扩展]
  ]

  #text(size: 0.8em)[
    RLVR 的洞察：数学和代码有标准答案
  ]


  #text(size: 0.7em)[
    $ "奖励" = cases(
      +1 & "if 答案正确",
      0 & "if 答案错误"
    ) $
  ]


  #text(size: 0.6em)[
    验证器自动判断，无需人类参与
  ]
]

== RLHF/RLVR 与训练小动物

#slide[



  #grid(
    columns: (1.2fr, 1fr),
    gutter: 1.5em,
    [
      // 左侧：GIF 图
      #align(center)[
        #image("../images/萝卜纸巾猫.gif", width: 65%)
      ]
    ],
    [
      // 右侧：场景说明
      #text(size: 0.85em)[
        #text(weight: "bold")[指令：「纸巾」]
        
        
        摸萝卜：reward = 0
        
        摸纸巾：reward = 1
        
        只看人类脸色：reward hacking
        
        拿走物品：对空气 hallucinate

        RL 的终极或许 #text(red)[远不止 0/1 奖励] 这么简单
      ]
    ],
  )
]



#focus-slide[
  Agent RL：从"做题"到"干活"


  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #text(size: 0.7em)[
        #text(weight: "bold")[RL]

        状态：问题文本

        动作：生成答案

        奖励：答案正确

        #text(gray)[任务明确]
      ]
    ],
    [
      #text(size: 0.7em)[
        #text(weight: "bold", blue)[Agent RL]

        状态：环境观察

        动作：工具调用

        奖励：任务完成

        #text(blue)[目标导向]
      ]
    ],
  )

  #text(size: 0.6em)[
    动作空间：Text -> Text + Tool Call
  ]
]



== Agent RL：分离式 vs 一体化训练

#slide[
  #heading(level: 3)[经典面试题: 为什么 Cursor 不如 Claude Code?]

  #pause

  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #pause
      #text(weight: "bold", red)[分离式 (Cursor)]

      Base LLM → API 调用

      - 工具调用是"外挂"
      - 调用时机靠启发式
      - 无法端到端优化
    ],
    [
      #pause
      #text(weight: "bold", green)[一体化 (Claude Code)]

      Pretrain + RL end-to-end

      - 工具是"感官"
      - 自主学习调用策略
      - 任务完成度直接优化
    ],
  )
]



== Agent RL：道家炼丹术

#slide[
  #heading(level: 3)[炼丹师的干预 vs 自然的涌现]

  Posttrain 背后的两种哲学：

  #table(
    columns: (1fr, 2fr),
    inset: 0.7em,
    table.header(
      [#text(weight: "bold")[流派]],
      [#text(weight: "bold")[训练]]
    ),
    [#text(red)[儒家] 人为规定],
    [炼丹师精心设计 pattern 注入固定范式],
    [#text(blue)[道家] 自然涌现],
    [提供工具、环境、reward 模型自己探索最优策略]
  )
  - 儒家：可控、可解释、但僵化
  - 道家：自适应、能涌现、但难预测

  #align(center)[
    趋势：从 #text(red)[有为] 到 #text(blue)[无为] — 让模型自己学会"何时用何工具"
  ]

  再看看 openclaw 呢？
]



== 后训练方法总结

#slide[
  #heading(level: 3)[从模仿到自主的演进]


  - #text(weight: "bold")[SFT ]：BERT/GPT-2 时期，模仿标准答案
  - #text(weight: "bold")[RLHF ]：InstructGPT/ChatGPT，学习人类偏好（DPO是简化版）
  - #text(weight: "bold")[Agent RL ]：工具反蒸回模型参数
  - #text(weight: "bold")[RLVR ]：DeepSeek-R1，可验证奖励
  - #text(weight: "bold")[蒸馏 (贯穿)]：DistilBERT/MiniLLM，模型压缩


  #align(center)[
    演进趋势：

    模仿 → 理解 → 自主 | 被动 → 主动 | 标注 → 涌现

    #v(0.5em)

    实际往往组合使用：

    SFT/蒸馏 打基础 → RLVR/Agent RL 练专项 
  ]
]

= LLM训练 vs 人类学习

== 一个类比

#slide[
  #align(center)[#text(1.2em, weight: "bold")[训练LLM就像培养学生]]

  #table(
    columns: (1fr, 1fr, 1fr),
    inset: 0.8em,
    align: center,
    table.header(
      [#text(weight: "bold")[训练阶段]],
      [#text(weight: "bold")[人类教育]],
      [#text(weight: "bold")[核心目标]],
    ),
    [Pretrain],
    [通识教育],
    [广泛阅读，积累常识],
    [SFT],
    [专业训练],
    [学会对话，掌握技能],
    [RLHF/RLVR],
    [实践探索],
    [检验真理的唯一标准],
  )


  但这个类比有其局限性。
]

#focus-slide[
  LLM vs 人类：根本不同

  #grid(
    columns: (1fr, 1fr),
    gutter: 3em,
    [
      #text(size: 0.7em)[
        #text(weight: "bold", red)[LLM]

        海量数据

        灾难性遗忘

        统计相关

        静态参数
      ]
    ],
    [
      #text(size: 0.7em)[
        #text(weight: "bold", blue)[人类]

        few-shot

        continual learning

        因果推理

        test-time learning
      ]
    ],
  )
]

== 2026-2027 LLMs 
=== Continual Learning 可能必要的

#pause
- 大厂rl算法 / 模型架构基本固定，模型比拼变成infra实力比拼

#pause
- 动态参数太难
  #pause
  - 合成数据: 人类的数据已经用完了
  #pause
  - skill RL?
  #pause
  - 复杂reward ?
  #pause
  - 放弃 RL

== 下期预告

#slide[
  #align(center)[
    #text(1.3em, weight: "bold")[OpenCLAW]

    不要 998，免费教龙虾安装
    #grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 3em,
      align: center,
      [
        #image("../images/ICUlizhi-xhs.jpg", width: 60%)
      ],
      [
        #image("../images/ICUlizhi-微信公众号.jpg", width: 50%)
        #text(0.7em, gray)[微信公众号]
      ],
      [
        #image("../images/wechat.jpg", width: 50%)
      ],
    )
    #pause
    近期在收 vibe coding 解决不了的任务但存在正确答案的题目，500一道
  ]
]

== Q&A

#slide[
  #align(center + horizon)[
    #text(2em, weight: "bold")[感谢聆听]
    
    
    #text(1.2em)[Plib Developer Tutorial]
    
    
    #text(1em, fill: rgb("#0c4842"))[基础设施 | 推理与 Agent | 评测体系 | 训练 vs 学习]
    
    
    #text(0.9em)[
      更多内容请关注 Plib 公众号
    ]
    
    
    #text(0.8em, gray)[

    ]

    #v(1.5em)


  ]
]
