#import "../globals.typ": *

= 一级标题
我走了
== 二级标题
我来了
=== 三级标题
我来了又来了

```js
function fibnacci(n) {
  return n <= 1 ?: `...`;
}
```

#strong()[
  从前有座山，山会讲故事，故事讲的是.
]

#text(red)[
  我在哪，我是谁。
]
#(1024*104)是

四的三次方为#calc.pow(4,3)

#strong([
  == 二级标题
  啥都不是
]
)

#emph(
  [
    And every *fair from fair* sometime decline
  ]
)

着重语义:这里有一个#strong([重点！])
#parbreak()
#parbreak()
#let exercise(question, answer) = strong(question) + parbreak() + answer

#exercise[
  Question: _turing complete_？
][
  Answer: Yes, Typst is.
]

#highlight()[C+V]

#strong()[我喜欢]蓝色的#highlight(fill:blue)[C+V]

#strike[黄源森牛逼]

#underline([黄原森牛逼])

#overline([黄源森牛逼])

#underline(offset:6pt,underline(offset: 8pt,[黄源森牛逼]))

威严满满的#sub(size: 0.8em,baseline: -0.1em,[黄源森])\
垃圾废物的#super(size:0.6em,[C+v])

#text(fill:red)[?]

#underline(offset:30pt,[#text(size: 7em)[黄源森牛逼]])


#image("/images/image.png",width:100pt,height: 100pt)

#figure(image("/images/image.png",width:500pt),caption:[上世纪90年代])

#figure(```cpp 
#include<iostream>
using namespace std;
cout<<"黄源森牛逼"
```,
caption:[黄源森牛逼]
)\


在一段对话中插入一个#box(baseline:0.15em,image("../images/image4.png",width:1em))图片区域

#underline()[#link("https://zh.wikipedia.org")]

不基于比较方法，#text(fill:red)[#underline()[#link("https://pku-cs-cjw.top")[陈佳伟的博客]]]

== 一个神秘标题<myset>

讲述了#link("1")[神秘标题]

== 习题
#strike()[删除线]\
#underline(offset:-0.6pt,[删除线])

#let text-zou(a)={
  text(size:1em,a)+text(size:1.5em,a)+text(size:2.25em,a)+text(size:2.25*1.5em,a)
}
#text-zou()[走]


#text(fill: rgb(0, 0, 0, 0))[I'm the flag]

