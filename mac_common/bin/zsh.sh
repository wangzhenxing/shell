#!/bin/bash
# 历史经验: https://nicksheng.github.io/2017/06/30/mac-zsh/

#1 安装iterm2 https://www.jianshu.com/p/a5f478a143dc


#2 安装 zsh (主题: https://github.com/robbyrussell/oh-my-zsh/wiki/themes)

brew install zsh

chsh -s /bin/zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cp ~/.zshrc ~/.zshrc.orig

cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

brew install autojump
#语法高亮
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions

#修改~/.zshrc 中 ZSH_THEME="agnoster"
# 修改 ~/.zshrc plugins=(git zsh-autosuggestions autojump zsh-syntax-highlighting)
# 安装字体, 修改iterm2中text字体
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
# 之后修改text字体 为：  Meslo LG S DZ Regular for Powerline


# 快捷键
#cmd+f 查找
#cmd+/ 高亮光标
#cmd+; 自动补全命令
#cmd+shift+h 显示历史记录
#cmd+d 垂直分屏
#cmd+shift+d 水平分屏
#cmd+opt+方向键 切换分屏
