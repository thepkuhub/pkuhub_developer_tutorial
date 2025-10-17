// main.typ - PKU Hub主题演示文稿
// 展示所有主题功能和样式

#import "@preview/touying:0.6.1": *
#import "pkuhub-theme.typ": *


#show: pkuhub-theme.with(
  aspect-ratio: "16-9",
  footer: "",
  config-info(
    title: [网页部署与云服务器操作指南],
    subtitle: none,
    author: [Ethan],
    github: "https://github.com/hanlife02",  // 添加GitHub链接
    email: "ethan@hanlife02.com",             // 添加邮箱
    date: datetime.today(),
    institution: [PKUHUB],
  ),
)

#title-slide(
  background: image("figures/image.png"),
  background-dim: 0.3
)

#image-text-slide(
  title: "关于我",
  image: image("figures/image.svg"),
  content: [
    #v(2em)

    = About me

    == I am *Ethan* 🌻

    === a sophomore student in the College of Engineering

    #v(1em)

    = Contact me

    === 📧 Email #link("mailto:ethan@hanlife02.com")[`ethan@hanlife02.com`]

    === 🌐 GitHub #link("https://github.com/hanlife02")[`hanlife02`]

    === 🏠 Home #link("https://hanlife02.com")[`https://hanlife02.com`]

  ],
  image-position: right,
  image-width: 25%,
  image-align: bottom,      // 图片垂直底部对齐
  image-circle: true,       // 圆形裁剪
  image-offset-x: -1em,     // 向左偏移1em（距离右侧更近）
  image-offset-y: 3em      // 向上偏移2em（距离上方更近）
)

#new-section-slide(
  "网页部署",
  description: "以PKUHUB笔记平台为例",
  background: image("figures/image.png"),
  background-dim: 0.5
)

#two-column-slide(
  title: "部署准备",
  left: [
    #v(2em)
    = 准备条件 :
    #v(1.5em)
    == 1.一台云服务器
    #v(1em)
    == 2.一个已备案的域名
    #v(1em)
    == 3.网页源码文件
  ],
  right: [
    #v(2em)
    = 部署步骤 :
    #v(1.5em)
    == 1.登陆服务器运行网页服务
    #v(1em)
    == 2.域名解析和反向代理
    #v(1em)
    == 3.配置ssl证书
  ],
  left-width: 50%
)

#about-slide(
  title: "关于SSH",
  image: image("figures/ssh.png"),
)[
  === SSH(Secure Shell) 
  #v(1em)
  - 一种用于远程登录和其他网络服务的加密协议
  #v(0.3em)
  - 这里只介绍在github和云服务器登陆的应用场景
]

#slide(title: "SSH")[
  #code-block(
    lang: "shell",
    line-numbers: true,
    ```bash
    # 生成SSH密钥对
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
    ```
  )
  这会在本机'~/.ssh/'目录下生成一对公钥和私钥文件,下图即为公钥

  #image("figures/ssh2.png")

  #code-block(
    lang: "shell",
    line-numbers: true,
    ```bash
    # 在远程服务器的~/.ssh/authorized_keys文件中添加公钥
    vim ~/.ssh/authorized_keys
    ```
  )

  #image("figures/ssh3.png", width: 80%)

  #code-block(
    lang: "shell",
    line-numbers: true,
    ```bash
    # 连接远程服务器
    ssh username@remote_host

    # 关于SSH的一些其他参数
    ssh -p port_number username@remote_host
    ssh -i /path/to/private_key username@remote_host

    # 配置config文件简化连接
    vim ~/.ssh/config
    ssh ethan02
    ```
  )

  #image("figures/ssh4.png", width: 100%)

  == 在github-Settings-SSH and GPG keys中添加公钥

  #v(1em)
  #image("figures/ssh5.png", width: 70%)
  
  #code-block(
    lang: "shell",
    line-numbers: true,
    ```bash
    # 之后就可以通过ssh协议来进行git操作了
    git clone git@github.com:thepkuhub/pkuhub_developer_tutorial.git
  ```
  )
  #image("figures/ssh6.png", width: 60%)
]

#slide[
  == 1.登陆服务器运行网页服务
  #v(1em)
  #code-block(
    lang: "shell",
    line-numbers: true,
    ```bash
    # 登陆服务器
    ssh pkuhub

    # clone代码
    git clone git@github.com:thepkuhub/pkuhub.git

    # 运行服务
    cd pkuhub
    pip install -r requirements.txt
    python main.py
    ```
  )
  这会在服务器的5000端口启动笔记平台服务
]

#slide()[
  == 2.域名解析和反向代理
  #v(0.5em)
  打开域名服务商的解析页面,添加一条A记录,将域名指向服务器公网IP地址
  #image("figures/pkuhub1.png", width: 70%)
  在服务器上安装并配置Nginx,将域名请求反向代理到5000端口，这里使用1panel作为Nginx管理面板
  #image("figures/pkuhub2.png", width: 90%)
]


#slide()[
  == 3.配置SSL证书
  #v(0.5em)
  在域名注册商处申请ssl证书(或者借助certbot、1panel等工具）
  #image("figures/pkuhub3.png", width: 65%)

  在Nginx中配置ssl证书，使网站支持https访问
  #image("figures/pkuhub4.png", width: 80%)
]

#new-section-slide(
  "云服务器指南",
  description: "在ubuntu24.04系统上进行演示",
  background: image("figures/image.png"),
  background-dim: 0.5
)

#slide()[
  #v(1em)
  常用命令
  #code-block(
    lang: "shell",
    line-numbers: true,
    ```bash
    # 登陆你的云服务器，处于~(解析为/home/ubuntu)目录下，这是当前用户ubuntu的主目录
    ssh ubuntu@host

    # 通过`pwd`命令查看当前路径
    pwd
    # 关于路径缩写，`~`代表当前用户的主目录，`.`代表当前目录，`..`代表上一级目录

    # 你可以通过`ls`命令查看当前目录下的文件和文件夹
    ls   
    la # 显示所有文件，包括隐藏文件

    # 通过`cd`命令进入某个文件夹
    cd .ssh

    # 通过`mkdir`命令创建一个新文件夹
    mkdir data

    # 通过`rm -r`命令删除一个文件夹及其内容
    rm -r data

    # 通过`touch`命令创建一个新文件
    touch file.txt 

    # 通过`rm`命令删除一个文件
    rm file.txt
    
    # 通过`vim`命令编辑一个文本文件
    vim file.txt

    # 通过`cat`命令查看文件内容
    cat file.txt

    # sudo命令以root用户运行某个命令,例如
    sudo apt update
    # 软件源的配置，参考 https://mirrors.pku.edu.cn/Help/Ubuntu

    # 查找指定进程的格式
    ps aux | grep 进程关键字

    # scp命令用于在本地和远程主机之间复制文件
    scp local_file_path username@remote_host:remote_file_path

    # exit命令退出当前ssh连接
    exit
    ```
  )
  #v(5em)
  一些好用的工具推荐 ---- tmux、pm2、btop、rsync、docker
  #code-block(
    lang: "shell",
    line-numbers: true,
    ```bash
    # tmux - 终端复用工具，可以在一个终端窗口中创建多个会话和窗口
    sudo apt install tmux
    tmux new -s session_name  # 创建新会话
    tmux attach -t session_name  # 连接到已有会话
    tmux ls  # 列出所有会话
    tmux kill-session -t session_name  # 关闭会话

    # pm2 - Node.js进程管理器，可以用来管理和保持应用程序的运行
    sudo npm install -g pm2
    pm2 start app.js  # 启动应用
    pm2 list  # 列出所有应用
    pm2 stop app_name  # 停止应用
    pm2 restart app_name  # 重启应用

    # btop - 系统资源监控工具，类似于htop，但界面更美观
    sudo apt install btop
    btop  # 启动btop

    # rsync - 高效的文件同步工具，用于在本地和远程主机之间同步文件和目录
    rsync -avz source/ username@remote_host:destination/

    # docker - 容器化平台，用于打包、分发和运行应用程序
    sudo apt install docker.io
    sudo systemctl start docker  # 启动docker服务
    sudo systemctl enable docker  # 设置开机自启
    docker run hello-world  # 运行测试容器
    ```
  )
  #v(10em)
  == 控制面板推荐 ---- 1panel

  项目地址: #link("https://github.com/1Panel-dev/1Panel")[`https://github.com/1Panel-dev/1Panel`]

  申请ssl证书，自动续签，配置ssl证书等功能

  #image("figures/panel1.png", width: 80%)

  容器化运行各种服务

  #image("figures/panel2.png", width: 78%)

  管理数据库

  #image("figures/panel3.png", width: 80%)

  管理容器

  #image("figures/panel4.png", width: 80%)
]

// 第十五页：结束页
#over-slide(
  background: image("figures/image.png"),
  background-dim: 0.4
)