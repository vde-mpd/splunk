#!/bin/bash
echo "What operating system are you using?"
select os in Debian_Ubuntu RHEL_CentOS; do
	case $os in
	    Debian_Ubuntu)
	    	echo $os
				wget -O splunkforwarder-8.0.3-a6754d8441bf-linux-2.6-amd64.deb 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.0.3&product=universalforwarder&filename=splunkforwarder-8.0.3-a6754d8441bf-linux-2.6-amd64.deb&wget=true' 
				mv ./splunkforwarder-8.0.3-a6754d8441bf-linux-2.6-amd64.deb /opt/
				chmod a+x /opt/splunkforwarder-8.0.3-a6754d8441bf-linux-2.6-amd64.deb
				dpkg -i /opt/splunkforwarder-8.0.3-a6754d8441bf-linux-2.6-amd64.deb
				/opt/splunkforwarder/bin/splunk enable boot-start --accept-license
				echo "[tcpout]
				defaultGroup = default-autolb-group
				[tcpout:default-autolb-group]
				server = 10.168.15.195:9997
				[tcpout-server://10.168.15.195:9997]" >> /opt/splunkforwarder/etc/system/local/outputs.conf
				/etc/init.d/splunk start
				break
				;;
	    RHEL_CentOS)
	    	echo $os
	    		wget -O splunkforwarder-8.0.3-a6754d8441bf-linux-2.6-x86_64.rpm 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.0.3&product=universalforwarder&filename=splunkforwarder-8.0.3-a6754d8441bf-linux-2.6-x86_64.rpm&wget=true'
				mv ./splunkforwarder-8.0.3-a6754d8441bf-linux-2.6-x86_64.rpm /opt/
				chmod a+x /opt/splunkforwarder-8.0.3-a6754d8441bf-linux-2.6-x86_64.rpm
				rpm -Uvh /opt/splunkforwarder-8.0.3-a6754d8441bf-linux-2.6-x86_64.rpm
				/opt/splunkforwarder/bin/splunk enable boot-start --accept-license
				echo "[tcpout]
				defaultGroup = default-autolb-group
				[tcpout:default-autolb-group]
				server = 10.168.15.195:9997
				[tcpout-server://10.168.15.195:9997]" >> /opt/splunkforwarder/etc/system/local/outputs.conf
				systemctl start splunk
				break
				;;
	    *)
	    echo "Sigh, you're trying my patience. Please choose 1 or 2"
	    ;;
	esac
done																																																																																																										       
