// _template.typ
#import "../globals.typ": *

#show: dewdrop-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  navigation: "mini-slides",
  mini-slides: (
    height: 2em, 
    x: 2em,
    display-section: false, 
    display-subsection: false, 
    short-heading: true,
  ),
  config-info(
    title: [PKUHUB Developer Tutorials : Vscode & Git],
    author: [Jing Xu],
    date: datetime.today(),
    institution: [PKUHUB],
  ),
)

#show raw.where(
  lang: "bash"
): it => block(
  fill: luma(90.79%),
  inset: 8pt,
  radius: 4pt,
  it
)

#set text(font: (
  (name: "Arial", covers: "latin-in-cjk"), // 西文字体
  "DengXian" // 中文字体
), lang: "zh")

#title-slide()

#include "1.typ"