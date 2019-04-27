#!/bin/bash
sudo systemctl disable firewalld
sudo yum install iptables-services
sudo service iptables stop
sudo sudo chkconfig iptables off
sudo yum install nano
sudo sshd restart
sudo cd /home/
sudo tar -xvf jdk-8u101-linux-i586.tar.gz
sudo tar -xvf hadoop-2.7.3.tar.gz
cd /root 
sudo cat <<'EOF' >> .bashrc

#hadoop

export HADOOP_HOME=/home/hadoop-2.7.3
export HADOOP_CONF_DIR=/home/hadoop-2.7.3/etc/hadoop
export HADOOP_MAPRED_HOME=/home/hadoop-2.7.3
export HADOOP_COMMON_HOME=/home/hadoop-2.7.3
export HADOOP_HDFS_HOME=/home/hadoop-2.7.3
export YARN_HOME=/home/hadoop-2.7.3
export PATH=$PATH:/home/hadoop-2.7.3
export PATH=$PATH:/home/hadoop-2.7.3/bin/

#java

export JAVA_HOME=/home/jdk1.8.0_101
export PATH=/home/jdk1.8.0_101/bin:$PATH

EOF

source .bashrc
yum install glibc.i686
java -version
hadoop version

cd /home/hadoop-2.7.3/etc/hadoop/
sudo cat <<EOF > slaves
master
slave
slave4
slave5
slave7
EOF

sudo cat <<EOF > core-site.xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
	<property>
		<name>fs.default.name</name>
		<value>hdfs://master:9000</value>
	</property>
</configuration>
EOF

sudo cat <<EOF > hdfs-site.xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
	<property>
		<name>dfs.replication</name>
		<value>2</value>
	</property>

	<property>
		<name>dfs.permissions</name>
		<value>false</value>
	</property>

	<property>
		<name>dfs.datanode.data.dir</name>
		<value>/home/root/hadoop-2.7.3/datanode</value>
	</property>
</configuration>
EOF

sudo cat <<EOF > mapred-site.xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
	<property>
		<name>mapreduce.framework.name</name>
		<value>yarn</value>
	</property>
</configuration>
EOF

sudo cat <<EOF > yarn-site.xml 
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
	<property>
		<name>yarn.nodemanager.aux-services</name>
		<value>mapreduce_shuffle</value>
	</property>

	<property>
		<name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>
		<value>org.apache.mapred.ShuffleHandler</value>
	</property>
</configuration>
EOF

echo $PWD
echo OK



