import netifaces as ni
##ni.ifaddresses('eth0')
# netifaces.ifaddresses('docker0')[2][0]['addr'] example i found to pull ip information
ip = ni.interfaces() ##ni.ifaddresses('eth0')[ni.AF_INET][0]['addr']
print(ip)