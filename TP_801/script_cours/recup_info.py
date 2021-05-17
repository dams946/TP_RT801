import subprocess
import sys


"________GetUser______________________"
user = subprocess.Popen('whoami', shell=True , stdout=subprocess.PIPE)
ur= user.communicate()[0]
u = ur.decode().strip('/n')
print("thes user is", u)

"--------------------------Get_User_Id--------------------------------------------"

id_user = subprocess.Popen('id -u $u', shell=True, stdout=subprocess.PIPE)
idus = id_user.communicate()[0]
ids = idus.decode().strip('/n')
print("L'ID du User", ids)

"---------------------------------User_group---------------------------------"
group_user = subprocess.Popen('groups $ids', shell= True, stdout=subprocess.PIPE)
gp_user = group_user.communicate()[0]
gp_us = gp_user.decode().strip('/n')
print("Le User appartient au groupe : ", gp_us)

"------------------Save File---------------------"

filee=''' nano << EOF > USER {}.txt
USER : {}
Id_User : {}
User_Gr : {}

EOF
'''.format(u,u,ids,gp_us)

File= subprocess.Popen(filee, shell=True, stdout=subprocess.PIPE)
Files = File.communicate()[0]

print(Files)
