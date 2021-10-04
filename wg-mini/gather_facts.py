import netifaces as ni
##ni.ifaddresses('eth0')
# netifaces.ifaddresses('docker0')[2][0]['addr'] example i found to pull ip information
# This is for if you're behind a NAT and
# want the connection to be kept alive.
ip = ni.interfaces() ##ni.ifaddresses('eth0')[ni.AF_INET][0]['addr']
print(ip)