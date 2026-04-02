// main.typ
#import "globals.typ": *

#show: dewdrop-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.institution,
  navigation: "none",
  config-common(new-section-slide-fn: none),
  config-info(
    title: [Plib Developer Tutorial : Lecture ？？？],
    subtitle: [贵校csai就业指导建议],
    author: [徐靖],
    date: datetime.today(),
    institution: [徐靖],
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

#include "sections/8.typ"
