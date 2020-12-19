#!/bin/bash
###
 # @Description: 请输入'
 # @Author: Leo.minorui
 # @Date: 2020-12-19 09:40:26
 # @LastEditTime: 2020-12-19 09:41:19
 # @LastEditors: Leo.minorui
### 
###
 # @Description: 请输入
 # @Author: Leo.minorui
 # @Date: 2020-12-19 09:40:26
 # @LastEditTime: 2020-12-19 09:40:26
 # @LastEditors: Leo.minorui
### 
if [ ! -f /root/.ssh/id_rsa.pub ];then  
# ssh-keygen -t rsa -p '' &>/dev/null;then
    ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa
else
    echo "id_rsa has created ..."
fi
#分发到各个节点
while read line
  do
    user=`echo $line | cut -d " " -f 2`
    ip=`echo $line | cut -d " " -f 1`
    passwd=`echo $line | cut -d " " -f 3`
    expect <<EOF
      set timeout 5
      spawn ssh-copy-id -f /root/.ssh/id_rsa.pub $user@$ip
      expect {
        "yes/no" { send "yes\n";exp_continue }
        "/root/.ssh/id_rsa" { send "$passwd\n" }
      }
     expect "password" { send "$passwd\n" }
EOF
  done <  /root/host_ip.txt
  