#import "../globals.typ": *

= LLM工业构成

== 三个核心方向

#slide[
  #align(center)[#text(1.2em, weight: "bold")[LLM技术的三大支柱]]
  #v(1.5em)

  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    [
      #rect(fill: luma(95%), inset: 0.8em, radius: 4pt)[
        #text(1em, weight: "bold")[Infra 基础设施]
        #v(0.3em)
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
        #v(0.3em)
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
        #v(0.3em)
        #text(size: 0.85em)[
          能力对齐与提升

          - SFT监督微调
          - RLHF/RLVR
          - DPO偏好优化
          - Reasoning训练
        ]
      ]
    ],
  )
]

== Infra：推理基础设施

#slide[
  #heading(level: 3)[从能用到好用：推理优化的艺术]

  训练好的模型要服务用户，需要解决速度和成本问题。

  #v(1em)

  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #text(weight: "bold")[核心挑战]
      - 模型太大：70B参数需要140GB显存
      - 生成太慢：逐个token生成
      - 显存瓶颈：KV Cache占用巨大

      #v(0.5em)
      目标：让模型又快又便宜地服务百万用户
    ],
    [
      #text(weight: "bold")[关键技术]
      - #text(blue)[vLLM/SGLang]：PagedAttention管理KV Cache
      - #text(blue)[量化]：INT8/INT4降低显存
      - #text(blue)[投机采样]：小模型草稿+大模型验证
      - #text(blue)[Continuous Batching]：动态批处理
    ],
  )
]

== Pretrain：语言建模的本质

#slide[
  #heading(level: 3)[预测下一个词 = 建模语言流形]

  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #text(weight: "bold")[核心任务]

      给定前缀，预测下一个token的概率分布：

      $ P(x_t | x_{<t}) $

      #v(0.5em)

      通过最大化似然训练：
      $ sum_t log P(x_t | x_{<t}) $

      #v(0.5em)

      目标：最小化负对数似然损失（Cross Entropy）
    ],
    [
      #text(weight: "bold")[学习到的内容]

      - 语法规则（词序、句法结构）
      - 世界知识（实体关系、事实）
      - 推理模式（逻辑链条、因果关系）
      - 代码结构（语法、API用法）

      #v(0.5em)

      #text(gray)[图片描述：GPT原始论文中的语言建模示意图]
    ],
  )
]

== Scaling Law：规模法则

#slide[
  DeepMind的Chinchilla研究（2022）发现经验规律：

  #align(center)[
    #rect(fill: luma(95%), inset: 1em, radius: 4pt, width: 80%)[
      最优训练：模型参数量 $N$ 与训练token数 $D$ 应等比例增长

      $D approx 20N$ （每个参数约需20个token）
    ]
  ]


  性能随规模幂律增长：
  $ L(N, D) tilde N^{-alpha} + D^{-beta} $

  边际效应递减：
  - 从1B到10B：能力飞跃
  - 从100B到200B：提升有限
  - 数据: 分布 > 质量 > 数量
]

== 为什么需要Posttrain？

#slide[
  #heading(level: 3)[预训练模型的问题：有知识，无礼仪]

  预训练后的模型像个什么都知道但不懂礼貌的书呆子：

  #v(1em)

  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #rect(fill: luma(230), inset: 1em, radius: 4pt)[
        #text(weight: "bold")[用户]
        怎么学Python？

        #v(0.5em)
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

        #v(0.5em)
        #text(weight: "bold", green)[对话模型]
        建议按以下步骤：
        1. 先学基础语法
        2. 做小项目练手
        3. 看优秀代码学习

        #text(green)[真正回答用户的问题]
      ]
    ],
  )

  后训练就是让书呆子学会"听话"和"好好说话"。
]

= 推理的三重境界

== 从"做题"到"干活"

#slide[
  #align(center)[#text(1.2em, weight: "bold")[推理能力的三个层次]]
  #v(1.5em)

  #grid(
    columns: (1fr, 1fr, 1fr),
    gutter: 1em,
    [
      #rect(fill: luma(95%), inset: 0.8em, radius: 4pt)[
        #text(weight: "bold")[CoT]
        思维链
        #v(0.3em)
        Wei et al., 2022
        在流形上多走几步
      ]
    ],
    [
      #rect(fill: luma(95%), inset: 0.8em, radius: 4pt)[
        #text(weight: "bold")[ReAct]
        推理+行动
        #v(0.3em)
        Yao et al., 2023
        跳出文本查资料
      ]
    ],
    [
      #rect(fill: luma(95%), inset: 0.8em, radius: 4pt)[
        #text(weight: "bold")[Agent]
        智能体
        #v(0.3em)
        规划+记忆+工具
        在流形上长途跋涉
      ]
    ],
  )

  #v(1em)

  核心演进：从"回答"到"完成任务"。
]

== CoT：思维链 prompting

#slide[
  #heading(level: 3)[Wei et al., "Chain-of-Thought Prompting Elicits Reasoning in LLMs", 2022]

  #align(center)[
    #text(gray)[图片描述：原论文中的CoT示例图，展示标准prompting vs CoT prompting]
    #v(0.3em)
    #text(size: 0.8em)[来源：Wei et al., NeurIPS 2022]
  ]

  #v(0.5em)

  核心发现：在示例中展示推理过程，能显著提升LLM的推理能力。

  #v(0.5em)

  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #text(weight: "bold")[标准Prompting]
      ```
      Q: 鸡兔同笼，头35，脚94？
      A: 鸡23，兔12。

      Q: 新问题？
      A: ...
      ```
    ],
    [
      #text(weight: "bold", blue)[CoT Prompting]
      ```
      Q: 鸡兔同笼...
      A: 假设全是鸡→70只脚
         实际94只，多24只
         每只兔多2只脚
         ∴ 兔12只，鸡23只

      Q: 新问题？
      A: ...
      ```
    ],
  )
]

== CoT：为什么有效？

#slide[
  #heading(level: 3)[把跳跃变成漫步]

  复杂问题的解答往往需要多步推理。
  但模型默认是"跳跃式"的，容易出错。

  #v(1em)

  CoT的本质：
  - 把隐式推理外显化
  - 每步都可验证
  - 出错时可以定位

  #v(1em)

  魔法咒语：加一句 "Let's think step by step"

  甚至Zero-shot也能激发推理能力！
]

== ReAct：推理与行动结合

#slide[
  #heading(level: 3)[Yao et al., "ReAct: Synergizing Reasoning and Acting in Language Models", 2023]

  #align(center)[
    #text(gray)[图片描述：原论文中的ReAct循环图，Thought → Action → Observation]
    #v(0.3em)
    #text(size: 0.8em)[来源：Yao et al., ICLR 2023]
  ]

  #v(0.5em)

  ReAct的核心洞察：推理和行动应该交织进行，而非分离。

  #v(0.5em)

  循环范式：
  ```
  Thought: 我需要计算GDP增长率
  Action: 搜索[2024年中国GDP]
  Observation: 2024年GDP为134.9万亿元
  Thought: 还需要2023年数据
  Action: 搜索[2023年中国GDP]
  ...
  ```
]

== ReAct：与CoT的区别

#slide[
  #heading(level: 3)[CoT vs ReAct：何时需要行动？]

  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #text(weight: "bold")[CoT足够时]
      - 数学推理
      - 逻辑谜题
      - 文本分析
      - 知识在模型参数内

      #v(0.5em)
      纯在流形上行走
    ],
    [
      #text(weight: "bold", blue)[需要ReAct时]
      - 需要实时信息
      - 需要精确计算
      - 需要外部知识
      - 信息不在训练数据中

      #v(0.5em)
      跳出流形查资料
    ],
  )

  #v(1em)

  ReAct让LLM能跳出文本流形，接触真实世界。
]

== o1范式：推理时 scaling

#slide[
  #heading(level: 3)[OpenAI o1：让模型"多想一会儿"]

  #align(center)[
    #text(gray)[图片描述：o1的推理过程示意图，展示长链条的内部思考]
    #v(0.3em)
    #text(size: 0.8em)[来源：OpenAI o1 Technical Report, 2024]
  ]

  #v(0.5em)

  o1的核心创新：
  - 不是训练时放大，而是推理时延长
  - 让模型生成极长的思维链（数万token）
  - 通过强化学习学习"如何思考"

  #v(0.5em)

  与CoT的区别：
  - CoT：一次性生成答案
  - o1：反复思考、验证、修正（类似DeepSeek-R1的反思）

  #v(0.5em)

  关键洞察：Test-time compute 可以替代部分训练 compute
]

== Agent：长途跋涉的规划者

#slide[
  #heading(level: 3)[Agent = LLM + 规划 + 记忆 + 工具]

  Agent要解决的是：用户目标明确，但路径很长的任务。

  #v(1em)

  例子："帮我订下周去上海的机票"

  #v(0.5em)

  Agent的工作流程：
  1. #text(weight: "bold")[规划]：查航班→比价→选座→预订
  2. #text(weight: "bold")[记忆]：用户偏好（上午飞、靠窗）
  3. #text(weight: "bold")[工具]：调用航旅API
  4. #text(weight: "bold")[反思]：如果售罄，换其他航班

  这相当于在流形上进行一次长途旅行，
  需要路线图（规划）、补给站（记忆）、交通工具（工具）。
]

= 如何判断模型好坏

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

      #v(0.5em)
      "我觉得这个模型更聪明" —— 可能纯属幻觉
    ],
    [
      #text(weight: "bold")[Benchmark的价值]

      - #text(green)[大规模]：数千到数万道题
      - #text(green)[标准化]：统一prompt、统一评分
      - #text(green)[可重复]：任何人跑结果一样
      - #text(green)[可比较]：模型A 72分 > 模型B 68分

      #v(0.5em)
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

      #v(0.5em)
      设计理念：当AI在这个考试上得满分，
      人类就再也没有考试可出了。
    ],
    [
      #text(weight: "bold")[SWE-bench]
      - 真实GitHub Issue修复任务
      - 给定bug描述和代码库，让AI修bug
      - 端到端测试：改完代码要能通过测试
      - 目前SOTA只有~50%成功率

      #v(0.5em)
      特点：不是做题，是#text(blue)[干活]。
      无法通过背诵解决。
    ],
  )
]

== 权威平台：Artificial Analysis

#slide[
  #heading(level: 3)[https://artificialanalysis.ai/]

  #align(center)[
    #text(gray)[图片描述：Artificial Analysis网站界面，展示各模型质量vs价格散点图]
    #v(0.3em)
    #text(size: 0.8em)[目前最直观的模型能力对比平台]
  ]

  #v(0.5em)

  这个网站的价值：
  - #text(weight: "bold")[多维度对比]：质量、速度、价格、上下文长度
  - #text(weight: "bold")[实时更新]：新模型发布后快速收录
  - #text(weight: "bold")[可视化]：散点图一眼看出性价比
  - #text(weight: "bold")[第三方独立]：非厂商自家数据

  #v(0.5em)

  使用建议：选模型时先看这里，再自己试用验证。
]

== Benchmark的阴暗面：数据泄露

#slide[
  #heading(level: 3)[IMO：一个被"泄露麻了"的例子]

  国际数学奥林匹克（IMO）题目本应极难，但：

  #v(0.5em)

  ```
  某模型IMO成绩：从10% → 50% → 90%
  时间跨度：6个月
  ```

  #v(0.5em)

  发生了什么？
  - IMO历年题目在网上有详细解答
  - 模型训练时"看过"这些题
  - 测试时只是回忆，不是推理

  #v(0.5em)

  #text(red)[这不是数学能力进步，是记忆力进步。]

  #v(0.5em)

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
    [Level 1\n数据泄露],
    [测试集混入训练数据],
    [IMO历年题在网上有解答],
    [Level 2\nAgent作弊],
    [评测时用工具/搜索],
    [HuggingFace提交时开Copilot],
    [Level 3\n定向优化],
    [专门训练刷分技巧],
    [在GSM8K上overfit，
    其他任务反而下降],
  )

  #v(0.5em)

  最危险的Level 3：模型为了高分，学会"应试技巧"而非真正能力。
]

== 学界的应对：自建OOD Bench

#slide[
  #heading(level: 3)[Out-of-Distribution：离分布测试]

  应对数据泄露的唯一办法：自己造题。

  #v(0.5em)

  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #text(weight: "bold")[OOD Bench设计原则]
      - 题目不公开，只给测试接口
      - 动态生成变体题
      - 结合实时事件（今天的新闻）
      - 人工审核防止泄露

      #v(0.5em)
      代表：LiveBench、Private Leaderboard
    ],
    [
      #text(weight: "bold")[个人用户的替代方案]
      - 用自己的私有数据测试
      - 测最新发生的事件（训练数据截止后）
      - 测具体工作场景的真实任务

      #v(0.5em)
      终极标准：在你的实际场景里好不好用。
    ],
  )
]

== 看分数的防坑指南

#slide[
  #heading(level: 3)[如何不被分数忽悠？]

  1. #text(weight: "bold")[看测试集是否泄露]
     - 模型训练时可能"偷看"过考题
     - 新benchmark（HLE、LiveBench）更难作弊

  2. #text(weight: "bold")[看具体任务匹配度]
     - 写代码？重点看SWE-bench而非HumanEval
     - 做数学？看最新题而非IMO历年题
     - 别只看平均分

  3. #text(weight: "bold")[警惕"对齐税"]
     - RLHF过度的模型可能太保守
     - 分数高但实际很难用

  #v(0.5em)

  4. #text(weight: "bold", blue)[自己造题测试]
     - 用今天的新闻
     - 用自己的工作数据
     - 看模型是否真懂还是背答案
]

= LLM训练方法详解

== SFT：模仿老师的言行

#slide[
  #heading(level: 3)[监督微调：背诵标准答案]

  SFT就像让学生背诵优秀作文范文：
  ```json
  {
    "messages": [
      {"role": "user", "content": "怎么减肥？"},
      {"role": "assistant", "content": "建议：1）控制饮食..."}
    ]
  }
  ```

  用数万到数十万条这样的"问答对"训练模型，

  但这只是模仿，模型并不理解什么是"好回答"。
]

== RLHF：学会审美

#slide[
  #heading(level: 3)[InstructGPT：从模仿到偏好]

  #align(center)[
    #text(gray)[图片描述：InstructGPT论文中的RLHF流程图]
    #v(0.3em)
    #text(size: 0.8em)[来源：Ouyang et al., "Training language models to follow instructions with human feedback", 2022]
  ]

  #v(0.5em)

  InstructGPT的核心洞察：人工反馈比单纯模仿更重要。

  #v(0.5em)

  三阶段流程：
  1. #text(weight: "bold")[SFT]：用标注数据做监督微调
  2. #text(weight: "bold")[Reward Model]：训练模型学习人类偏好（哪个回答更好）
  3. #text(weight: "bold")[PPO优化]：用强化学习优化策略

  #v(0.5em)

  关键创新：不追求"正确"，而是追求"人类更喜欢"。
]

== RLHF：奖励模型如何工作

#slide[
  #heading(level: 3)[奖励模型：学习人类的品味]

  #grid(
    columns: (1fr, 1fr),
    gutter: 1.5em,
    [
      同一个问题，两个回答：

      #v(0.5em)

      回答A："少吃多运动"

      （简洁但不够 helpful）

      #v(0.5em)

      回答B："建议：1）控制精制碳水
      2）每周3次有氧运动
      3）保证7小时睡眠"

      （详细、实用、结构化）

      #v(0.5em)

      人类标注：B > A
    ],
    [
      Reward Model学会给回答打分：
      - Helpful（有帮助）
      - Harmless（无害）
      - Honest（诚实）

      #v(0.5em)

      然后用PPO算法优化LLM，
      让它生成高分回答。

      #v(0.5em)

      约束：不能偏离SFT模型太远（KL散度约束）
    ],
  )
]

== RLVR：用对错代替喜好

#slide[
  #heading(level: 3)[RLVR：可验证奖励的强化学习]

  RLHF的问题：需要人工标注偏好，主观且昂贵。

  #v(0.5em)

  RLVR的洞察：数学和代码有标准答案，不需要人打分！

  #v(0.5em)

  ```
  问题：357 × 482 = ?

  模型回答：172,074

  验证：357 × 482 = 172,074 ✓

  奖励：+1（答对了）
  ```

  #v(0.5em)

  DeepSeek-R1用纯RLVR训练，模型自己学会了"反思"——
  没人教它，这是涌现的能力！
]

== DeepSeek-R1：纯RL的惊人发现

#slide[
  #heading(level: 3)[R1-Zero：无需SFT的推理能力]

  #align(center)[
    #text(gray)[图片描述：DeepSeek-R1论文中的训练曲线和反思行为示例]
    #v(0.3em)
    #text(size: 0.8em)[来源：DeepSeek-AI, "DeepSeek-R1: Incentivizing Reasoning Capability in LLMs via Reinforcement Learning", 2025]
  ]

  #v(0.5em)

  DeepSeek-R1的核心发现：
  - 直接用Base模型（无SFT）做RLVR训练
  - 奖励只看最终答案对不对
  - 模型自己学会了长链条推理！

  #v(0.5em)

  涌现的"反思"行为：
  ```
  模型输出："让我想想... 用方法A试试
  不对，这样算有问题
  让我换一种思路
  使用方法B... 验证一下
  对了！答案是42"
  ```
]

== 后训练方法对比

#slide[
  #heading(level: 3)[三种方法的直观对比]

  #table(
    columns: (1fr, 2fr, 2fr),
    inset: 0.8em,
    table.header(
      [#text(weight: "bold")[方法]],
      [#text(weight: "bold")[直观理解]],
      [#text(weight: "bold")[代表工作]],
    ),
    [SFT],
    [背诵优秀作文],
    [基础对话训练],
    [RLHF/DPO],
    [学习审美品味],
    [InstructGPT (2022)],
    [RLVR],
    [做题对答案],
    [DeepSeek-R1 (2025)],
  )

  #v(1em)

  实际往往组合使用：
  SFT打基础 → RLHF/DPO学审美 → RLVR练专项
]

= LLM训练 vs 人类学习

== 一个类比

#slide[
  #align(center)[#text(1.2em, weight: "bold")[训练LLM就像培养学生]]
  #v(1.5em)

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
    [RLHF/DPO/RLVR],
    [品德教育],
    [对齐价值观，安全有用],
  )

  #v(1em)

  但这个类比有其局限性。
]

== 本质的差异

#slide[
  #heading(level: 3)[LLM vs 人类：根本不同]

  #grid(
    columns: (1fr, 1fr),
    gutter: 3em,
    [
      #text(weight: "bold")[LLM]
      - 需要#text(red)[海量数据]
      - 学了新可能#text(red)[忘记旧]
      - 只懂#text(red)[统计相关]
      - 没有#text(red)[真正理解]
      - 不会#text(red)[主动探索]
    ],
    [
      #text(weight: "bold")[人类]
      - #text(blue)[少量例子]举一反三
      - #text(blue)[终身学习]不断累积
      - 理解#text(blue)[因果关系]
      - 有#text(blue)[意识和体验]
      - #text(blue)[主动探索]世界
    ],
  )

  #v(1.5em)

  当前LLM是"超级记忆者"而非"真正理解者"。

  通往AGI需要：感知、行动、因果推理、世界模型。
]

= 结语

== 回顾

#slide[
  #align(center)[#text(1.2em, weight: "bold")[今天我们走过了]]
  #v(1.5em)

  1. #text(weight: "bold")[工坊]：Infra → Pretrain → Posttrain

  2. #text(weight: "bold")[旅程]：CoT → ReAct → o1 → Agent

  3. #text(weight: "bold")[标尺]：Benchmark分数 + 盲测口碑

  4. #text(weight: "bold")[反思]：LLM与人学习的异同

  #v(2em)

  #align(center)[
    自然语言原是字符空间中一片褶皱的白纸，

    而LLM是纸上的一只小虫。

    它循着概率的丝线蜿蜒，

    在流形的沟壑间寻找最平缓的坡度。
  ]
]

== 参考文献

#slide[
  #heading(level: 3)[核心论文]

  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #text(weight: "bold")[训练与对齐]
      - InstructGPT (Ouyang et al., 2022)
      - DeepSeek-R1 (DeepSeek-AI, 2025)
      - DPO (Rafailov et al., 2023)

      #v(0.5em)
      #text(weight: "bold")[推理]
      - Chain-of-Thought (Wei et al., 2022)
      - ReAct (Yao et al., 2023)
      - OpenAI o1 (2024)
    ],
    [
      #text(weight: "bold")[基础]
      - Attention Is All You Need (Vaswani et al., 2017)
      - BERT (Devlin et al., 2019)
      - GPT-3 (Brown et al., 2020)

      #v(0.5em)
      #text(weight: "bold")[评测]
      - MMLU (Hendrycks et al., 2021)
      - Chatbot Arena (Chiang et al., 2024)
    ],
  )
]

== 下期预告：OpenCLAW

#slide[
  #align(center)[
    #text(1.3em, weight: "bold")[下期预告：OpenCLAW]
    #v(2em)

    我们将探讨 AI 安全的核心理念：

    - Open：开放性与透明度的边界
    - Closed：封闭系统的安全悖论
    - Loyal：对齐的忠诚困境
    - Autonomous：自主性的危险与必要
    - Wise：智慧的本质超越能力

    #v(2em)

    #text(blue)[保持好奇，保持怀疑]

    #v(1em)

    谢谢！
  ]
]
