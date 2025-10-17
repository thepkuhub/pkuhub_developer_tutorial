// pkuhub-theme.typ - PKU Hub自定义主题
// 基于Touying框架，提供丰富的幻灯片样式

#import "@preview/touying:0.6.1": *

// 主题颜色定义
#let theme-colors = (
  primary: rgb("#C41E3A"),        // PKU红色
  secondary: rgb("#003C71"),      // 深蓝色
  accent: rgb("#FFD700"),         // 金色点缀
  success: rgb("#28A745"),        // 成功绿色
  warning: rgb("#FFC107"),        // 警告黄色
  danger: rgb("#DC3545"),         // 危险红色
  info: rgb("#17A2B8"),          // 信息蓝色
  light: rgb("#F8F9FA"),         // 浅色背景
  dark: rgb("#343A40"),          // 深色文字
  neutral-lightest: rgb("#FFFFFF"),
  neutral-darkest: rgb("#000000"),
)

// 基础slide函数
#let slide(title: auto, subtitle: none, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if subtitle != none {
    self.store.subtitle = subtitle
  }

  // 页面头部 - 移除所有背景和内容
  let header(self) = {
    // 返回空内容，完全移除头部
    []
  }

  // 页面底部 - 移除所有信息
  let footer(self) = {
    // 返回空内容，完全移除页脚
    []
  }

  self = utils.merge-dicts(
    self,
    config-page(
      header: header,
      footer: footer,
    ),
  )
  touying-slide(self: self, ..args)
})

// 首页slide - 支持背景图片和亮暗调整
#let title-slide(
  background: none,
  background-dim: 0.3,
  ..args
) = touying-slide-wrapper(self => {
  let info = self.info + args.named()

  let body = {
    set align(center + horizon)

    // 主标题 - 橙色字体
    text(size: 2.5em, weight: "bold", fill: orange)[#info.title]
    if info.subtitle != none [
      \ #text(size: 1.5em, fill: orange)[#info.subtitle]
    ]

    v(1em)

    // 作者信息 - 支持GitHub链接，橙色字体，无下划线
    if info.author != none {
      if "github" in info {
        link(info.github)[
          #text(size: 1.3em, fill: orange)[#info.author]
        ]
      } else {
        text(size: 1.3em, fill: orange)[#info.author]
      }
    }

    v(0.5em)

    // 机构和日期 - 橙色字体
    if info.institution != none or info.date != none {
      text(size: 1.1em, fill: orange)[
        #if info.institution != none [#info.institution]
        #if info.institution != none and info.date != none [ • ]
        #if info.date != none [#utils.display-info-date(self)]
      ]
    }
  }

  // 处理背景图片
  let page-args = if background != none {
    let bg = if background-dim > 0 {
      // 添加暗化overlay
      place(
        dx: 0pt, dy: 0pt,
        rect(
          width: 100%, height: 100%,
          fill: black.transparentize(100% - background-dim * 100%)
        )
      ) + place(dx: 0pt, dy: 0pt, background)
    } else {
      background
    }
    (background: bg,)
  } else {
    (fill: gradient.linear(self.colors.primary, self.colors.secondary, angle: 45deg),)
  }

  self = utils.merge-dicts(
    self,
    config-page(..page-args, margin: 2em),
  )

  touying-slide(self: self, body)
})

// 介绍页slide - 左侧文字，右侧图片
#let about-slide(
  title: [About],
  image: none,
  image-width: 40%,
  image-position: right,
  ..args
) = touying-slide-wrapper(self => {
  let content-args = args.pos()
  let body-content = if content-args.len() > 0 { content-args.first() } else { [] }

  let body = {
    set align(left + top)

    // 标题部分
    block(
      width: 100%,
      inset: (bottom: 0em),
      [
        #text(size: 1.5em, weight: "bold", fill: orange)[#title]
        #line(length: 100%, stroke: 1pt + orange)
      ]
    )

    // 内容部分
    if image != none {
      let (left-content, right-content) = if image-position == right {
        (body-content, image)
      } else {
        (image, body-content)
      }

      grid(
        columns: if image-position == right { (1fr, image-width) } else { (image-width, 1fr) },
        column-gutter: 1.5em,
        [
          #set text(size: 1.1em)
          #set par(justify: true, leading: 0.8em)
          #left-content
        ],
        [
          #if type(right-content) == content and right-content != image {
            set text(size: 1.1em)
            set par(justify: true, leading: 0.8em)
          }
          #right-content
        ]
      )
    } else {
      set text(size: 1.1em)
      set par(justify: true, leading: 0.8em)
      body-content
    }
  }

  self = utils.merge-dicts(
    self,
    config-page(margin: (top: 3em, bottom: 2em, x: 2em)),
  )

  touying-slide(self: self, body)
})

// 新章节slide - 类似首页风格
#let new-section-slide(
  title,
  description: none,
  background: none,
  background-dim: 0.3,
  ..args
) = touying-slide-wrapper(self => {
  let body = {
    set align(center + horizon)

    // 主标题 - 橙色字体
    text(size: 3em, weight: "bold", fill: orange)[#title]

    v(1em)

    // 描述信息（如果提供）
    if description != none {
      text(size: 1.3em, fill: orange)[#description]
    }
  }

  // 处理背景图片（复用首页的背景处理逻辑）
  let page-args = if background != none {
    let bg = if background-dim > 0 {
      // 添加暗化overlay
      place(
        dx: 0pt, dy: 0pt,
        rect(
          width: 100%, height: 100%,
          fill: black.transparentize(100% - background-dim * 100%)
        )
      ) + place(dx: 0pt, dy: 0pt, background)
    } else {
      background
    }
    (background: bg,)
  } else {
    (fill: gradient.linear(self.colors.primary, self.colors.secondary, angle: 45deg),)
  }

  self = utils.merge-dicts(
    self,
    config-page(..page-args, margin: 2em),
  )

  touying-slide(self: self, body)
})

// 结束页slide - 支持自定义背景和作者信息
#let over-slide(
  background: none,
  background-dim: 0.3,
  ..args
) = touying-slide-wrapper(self => {
  let info = self.info + args.named()

  let body = {
    set align(center + horizon)

    // 主标题 - 谢谢大家
    text(size: 3em, weight: "bold", fill: orange)[谢谢大家！]

    v(0em)

    v(0em)

    // 标题和作者信息
    if info.author != none and info.title != none {
      text(size: 1.2em, fill: orange)[《#info.title》---- #info.author]
    }

    v(0.8em)

    // GitHub链接（如果提供）
    if "github" in info {
      link(info.github)[
        #text(size: 1em, fill: orange)[#info.github]
      ]
    }

    v(0.5em)

    // 作者邮箱（如果提供）
    if "email" in info {
      link("mailto:" + info.email)[
        #text(size: 1em, fill: orange)[#info.email]
      ]
    }
  }

  // 处理背景图片（复用首页的背景处理逻辑）
  let page-args = if background != none {
    let bg = if background-dim > 0 {
      // 添加暗化overlay
      place(
        dx: 0pt, dy: 0pt,
        rect(
          width: 100%, height: 100%,
          fill: black.transparentize(100% - background-dim * 100%)
        )
      ) + place(dx: 0pt, dy: 0pt, background)
    } else {
      background
    }
    (background: bg,)
  } else {
    (fill: gradient.linear(self.colors.primary, self.colors.secondary, angle: 45deg),)
  }

  self = utils.merge-dicts(
    self,
    config-page(..page-args, margin: 2em),
  )

  touying-slide(self: self, body)
})

// 两列布局slide
#let two-column-slide(
  title: auto,
  left: [],
  right: [],
  left-width: 50%,
  ..args
) = slide(title: title, ..args)[
  #grid(
    columns: (left-width, 1fr),
    column-gutter: 1.5em,
    [
      #set text(size: 1em)
      #set par(justify: true)
      #left
    ],
    [
      #set text(size: 1em)
      #set par(justify: true)
      #right
    ]
  )
]

// 图文slide - 支持左右和上下布局，以及图片位置调整
#let image-text-slide(
  title: auto,
  image: none,
  content: [],
  image-width: 45%,
  image-position: right,  // left, right, top, bottom
  image-align: auto,      // 图片对齐方式：top, center, bottom（在左右布局时生效）
  image-circle: false,    // 是否将图片裁剪为圆形
  image-offset-x: 0pt,    // 图片水平偏移（正值向右，负值向左）
  image-offset-y: 0pt,    // 图片垂直偏移（正值向下，负值向上）
  ..args
) = slide(title: title, ..args)[
  // 图片处理函数：根据需要应用圆形裁剪和位置偏移
  #let process-image(img) = {
    let processed = if image-circle {
      // 圆形裁剪
      box(
        width: auto,
        height: auto,
        clip: true,
        radius: 50%,  // 圆形
        img
      )
    } else {
      img
    }

    // 应用位置偏移
    if image-offset-x != 0pt or image-offset-y != 0pt {
      place(
        dx: image-offset-x,
        dy: image-offset-y,
        processed
      )
    } else {
      processed
    }
  }

  #if image-position == top or image-position == bottom {
    // 上下布局
    let (first-content, second-content) = if image-position == top {
      (image, content)
    } else {
      (content, image)
    }

    if first-content == image [
      // 图片在上方
      #set align(center)
      #process-image(first-content)
    ] else [
      // 文字在上方
      #set text(size: 1em)
      #set par(justify: true)
      #first-content
    ]

    v(1.5em)

    if second-content == image [
      // 图片在下方
      #set align(center)
      #process-image(second-content)
    ] else [
      // 文字在下方
      #set text(size: 1em)
      #set par(justify: true)
      #second-content
    ]
  } else {
    // 左右布局（原有功能）
    let (left-content, right-content) = if image-position == right {
      (content, image)
    } else {
      (image, content)
    }

    // 确定图片对齐方式
    let img-align = if image-align == auto {
      center + top  // 默认居中对齐
    } else if image-align == top {
      center + top
    } else if image-align == center {
      center + horizon
    } else if image-align == bottom {
      center + bottom
    } else {
      center + top
    }

    grid(
      columns: if image-position == right { (1fr, image-width) } else { (image-width, 1fr) },
      column-gutter: 1.5em,
      [
        #if type(left-content) == content and left-content != image {
          set text(size: 1em)
          set par(justify: true)
        }
        #if left-content == image {
          set align(img-align)
        }
        #if left-content == image {
          process-image(left-content)
        } else {
          left-content
        }
      ],
      [
        #if type(right-content) == content and right-content != image {
          set text(size: 1em)
          set par(justify: true)
        }
        #if right-content == image {
          set align(img-align)
        }
        #if right-content == image {
          process-image(right-content)
        } else {
          right-content
        }
      ]
    )
  }
]

// 标题+图片+描述slide
#let title-image-desc-slide(
  title: auto,
  image: none,
  description: [],
  ..args
) = slide(title: title, ..args)[
  #set align(center)

  #v(1em)

  #if image != none {
    block(
      stroke: 1pt + gray,
      radius: 5pt,
      clip: true,
      image
    )
  }

  #v(1em)

  #block(
    width: 90%,
    inset: 1em,
    fill: gray.transparentize(90%),
    radius: 5pt,
    [
      #set text(size: 1em)
      #set par(justify: true)
      #set align(left)
      #description
    ]
  )
]

// 高亮盒子函数
#let highlight-box(
  content,
  color: "primary",
  title: none,
  icon: none
) = {
  let box-color = if type(color) == str {
    theme-colors.at(color, default: theme-colors.primary)
  } else {
    color
  }

  block(
    fill: box-color.transparentize(85%),
    stroke: (left: 4pt + box-color),
    inset: (x: 1em, y: 0.8em),
    radius: (right: 5pt),
    width: 100%,
    [
      #if title != none or icon != none [
        #text(weight: "bold", fill: box-color)[
          #if icon != none [#icon #h(0.3em)]
          #if title != none [#title]
        ]
        #if title != none or icon != none [\ ]
      ]
      #content
    ]
  )
}

// 多彩高亮盒子的便捷函数
#let info-box(content, title: none) = highlight-box(content, color: "info", title: title, icon: "ℹ")
#let success-box(content, title: none) = highlight-box(content, color: "success", title: title, icon: "✓")
#let warning-box(content, title: none) = highlight-box(content, color: "warning", title: title, icon: "⚠")
#let danger-box(content, title: none) = highlight-box(content, color: "danger", title: title, icon: "⚠")

// 增强的代码块
#let code-block(
  code,
  lang: none,
  title: none,
  line-numbers: false
) = {
  block(
    fill: gray.transparentize(95%),
    stroke: 1pt + gray.transparentize(70%),
    inset: 1em,
    radius: 5pt,
    width: 100%,
    [
      #if title != none [
        #text(weight: "bold", size: 0.9em)[#title]
        #line(length: 100%, stroke: 0.5pt + gray)
        #v(0.5em)
      ]
      #if type(code) == str [
        #raw(code, lang: lang)
      ] else [
        #code
      ]
    ]
  )
}

// 增强的表格样式
#let enhanced-table(
  columns,
  header-style: (:),
  cell-style: (:),
  ..args
) = {
  show table.cell.where(y: 0): it => {
    set text(weight: "bold", fill: white, ..header-style)
    strong(it)
  }

  table(
    columns: columns,
    fill: (x, y) => if y == 0 { theme-colors.primary } else if calc.odd(y) { gray.transparentize(95%) } else { white },
    stroke: (x, y) => (
      top: if y == 0 { 2pt + theme-colors.primary } else { 0.5pt + gray },
      bottom: 0.5pt + gray,
      left: none,
      right: none,
    ),
    inset: (x: 0.8em, y: 0.6em),
    ..args
  )
}

// 主题配置函数
#let pkuhub-theme(
  aspect-ratio: "16-9",
  footer: none,
  header-right: none,
  ..args,
  body,
) = {
  set text(size: 20pt, font: ("Times New Roman", "SimSun"))
  set par(justify: true, leading: 0.65em)

  // 设置链接样式 - 移除下划线
  show link: it => {
    set text(fill: theme-colors.info)
    it  // 直接显示链接文字，不添加下划线
  }

  // 设置列表样式
  set list(marker: ([•], [◦], [▪]))
  set enum(numbering: "1.", start: 1)

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      margin: (top: 1em, bottom: 1em, x: 2em),  // 减少顶部和底部边距
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(
      alert: utils.alert-with-primary-color,
    ),
    config-colors(..theme-colors),
    config-store(
      title: none,
      subtitle: none,
      footer: footer,
      date: none,
    ),
    ..args,
  )

  body
}