#!/bin/bash
echo "What operating system are you using?"
select os in Debian_Ubuntu RHEL_CentOS; do
	case $os in
	    Debian_Ubuntu)
	    	echo $os
				gsutil cp gs://vde-lh-storage/splunkforwarder-8.0.3-a6754d8441bf-linux-2.6-amd64.deb /opt/
				chmod a+x /opt/splunkforwarder-8.0.3-a6754d8441bf-linux-2.6-amd64.deb
				dpkg -i /opt/splunkforwarder-8.0.3-a6754d8441bf-linux-2.6-amd64.deb
				/opt/splunkforwarder/bin/splunk enable boot-start --accept-license
				echo "[tcpout]
				defaultGroup = default-autolb-group
				[tcpout:default-autolb-group]
				server = 10.168.15.195:9997
				[tcpout-server://10.168.15.195:9997]" >> /opt/splunkforwarder/etc/system/local/outputs.conf
				break
				;;
	    RHEL_CentOS)
	    	echo $os
	    		gsutil cp gs://vde-lh-storage/splunkforwarder-8.0.3-a6754d8441bf-linux-2.6-x86_64.rpm /opt/
				chmod a+x /opt/splunkforwarder-8.0.3-a6754d8441bf-linux-2.6-x86_64.rpm
				rpm -Uvh /opt/splunkforwarder-8.0.3-a6754d8441bf-linux-2.6-x86_64.rpm
				/opt/splunkforwarder/bin/splunk enable boot-start --accept-license
				echo "[tcpout]
				defaultGroup = default-autolb-group
				[tcpout:default-autolb-group]
				server = 10.168.15.195:9997
				[tcpout-server://10.168.15.195:9997]" >> /opt/splunkforwarder/etc/system/local/outputs.conf
				break
				;;
	    *)
	    echo "Sigh, you're trying my patience. Please choose 1 or 2"
	    ;;
	esac
done																																																																																																										       
