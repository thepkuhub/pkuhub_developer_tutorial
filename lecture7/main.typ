// main.typ
#import "globals.typ": *

#show: dewdrop-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  navigation: "slides",
  config-info(
    title: [PKUHUB Developer Tutorial : LLM深度解析],
    subtitle: [基础设施 | 推理与Agent | 评测体系 | 训练vs学习],
    author: [PKUHUB],
    date: datetime.today(),
    institution: [PKUHUB],
  ),
)

#set text(font: (
  (name: "Arial", covers: "latin-in-cjk"), // 西文字体
  "DengXian" // 中文字体
), lang: "zh")

#title-slide()

#outline-slide()

#include "sections/7.typ"
