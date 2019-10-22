alias ll='ls -laG'
alias grep='grep --color'
alias sr='screen -r'
alias ss='screen -S'
alias gp='git pull'
alias gpu='git push'
alias gb='git branch'
alias gs='git status'
alias gstash='git stash'
alias gstashp='git stash pop'
alias gca='git commit -am '
alias gc='git commit -m '
alias gm='git merge '
alias gd='git diff'
alias gr='go run '

export CLICOLOR=1
export PATH=$PATH:/Users/wzx/thirdparty/etcd/etcd-v3.3.8-darwin-amd64:/Users/wzx/go/bin:/Users/wzx/thirdparty/bin:~/Library/Android/sdk/platform-tools


export GOPATH=/Users/wzx/go
#export GOPATH=/Users/wzx/go/src/go-wormhole-new:/Users/wzx/Documents/code/wzx/tj_wechat
#export GOPATH=/Users/wzx/Documents/code/wzx/tj_wechat

export LDFLAGS="${LDFLAGS} -lstdc++"

export PATH=/Users/wzx/thirdparty/service_mesh/istio/istio-1.0.1/bin:$PATH:/usr/local/mongodb/bin:/usr/local/bin

export THEOS=/opt/theos
export PATH=/opt/theos/bin/:$PATH


# enables colorin the terminal bash shell export
export CLICOLOR=1
# sets up thecolor scheme for list export
export LSCOLORS=gxfxcxdxbxegedabagacad
# sets up theprompt color (currently a green similar to linux terminal)
# enables colorfor iTerm
export TERM=xterm-color


source ~/.zshrc
