import netifaces as ni
import jinja2 import Template as tl

with open("client_base") as file_:
    template = tl(file_.read())

jinja_var={}

jinja_var['SERV_EXT_IP'] = ni.ifaddresses('eth0')[2][0]['addr'] 

with open ("serv.priv", "r") as private:
    jinja_var['SERV_PRIV']=private.readlines()

with open ("serv.pub", "r") as public:
    jinja_var['SERV_PUB']=public.readlines()

print(template.render(jinja_var))