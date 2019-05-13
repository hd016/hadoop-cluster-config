# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#hadoop
export HADOOP_HOME=/home/hadoop-2.7.3
export HADOOP_CONF_DIR=/home/hadoop-2.7.3/etc/hadoop
export HADOOP_MAPRED_HOME=/hpme/hadoop-2.7.3
export HADOOP_COMMON_HOME=/home/hadoop-2.7.3
export HADOOP_HDFS_HOME=/home/hadoop-2.7.3
export YARN_HOME=/home/hadoop-2.7.3
export PATH=$PATH:/home/hadoop-2.7.3
export PATH=$PATH:/home/hadoop-2.7.3/bin/


#java
export JAVA_HOME=/home/jdk1.8.0_101
export PATH=/home/jdk1.8.0_101/bin:$PATH

#hbase
export HBASE_HOME=/home/hbase-1.2.2
export PATH=$PATH:/home/hbase-1.2.2/bin
