# PKUHUB Developer Tutorial
PKUHUB 内部开发技术讲座 slides
___
## 讲者请看
推荐 Tinymist Typst , Typst Companion 两款 vscode 插件

- [排版原神, 启动](https://typst-doc-cn.github.io/guide/)
- [Touying](https://touying-typ.github.io/zh/), 我们暂时采用 Dewdrop 主题

#### 项目文件结构
注意看引用关系
```bash
.
├── sections
│   ├── _template.tpy  # 模板文件, 用于渲染单个章节
│   ├── 0.tpy          # Introducion 章节
│   ├── 1.tpy          # xj 的 vscode & git 章节
├── main.tpy           # 主文件, 用于打包渲染所有章节
├── global.tpy         # 全局变量
```
工作界面belike:
![alt text](images/image.png)
___