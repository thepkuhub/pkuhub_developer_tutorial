// main.typ
#import "globals.typ": *

#show: dewdrop-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  navigation: "none",
  config-common(new-section-slide-fn: none),
  config-info(
    title: [PKUHUB Developer Tutorial : LLM深度解析],
    subtitle: [基础设施 | 推理与Agent | 评测体系 | 训练vs学习],
    author: [PKUHUB],
    date: datetime.today(),
    institution: [PKUHUB],
  ),
)

#set text(
  font: (
    "Noto Sans CJK SC",  // 中文字体（思源黑体，替代 DengXian）
    "DejaVu Sans"        // 西文字体（替代 Arial）
  ),
  lang: "zh"
)

#title-slide()

#outline-slide()

#include "sections/7.typ"
