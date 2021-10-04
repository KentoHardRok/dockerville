import netifaces as ni
##ni.ifaddresses('eth0')
ip = ni.interfaces() ##ni.ifaddresses('eth0')[ni.AF_INET][0]['addr']
print(ip)