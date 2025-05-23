// _template.typ
#import "../globals.typ": *

#show: dewdrop-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  navigation: "mini-slides",
  config-info(
    title: [PKUHUB Developer Tutorials : Introduction],
    author: [Jing Xu],
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

#include "0.typ"