import os
import sys
import tarfile
import pysftp
import pexpect

name_arch= sys.argv[1]
dirc= sys.argv[2]
ip = sys.argv[3]
login = sys.argv[4]
pwd = sys.argv[5]

if len(sys.argv) !=  6:

    print("le nombre d'arguments est insuffusant")
    sys.exit(1)

print("-------------------------Archivage--------------------------")
#lss= os.listdir(dirc)
out= tarfile.open(name=name_arch, mode='w:')
#out.add(i)
#for i in ["arc.txt", "arcrrr.txt"]:
#print(i)
#print("--Ajouter au {}..." .format( name_arch))
#out.add("arc.txt", "arcrrr.txt")
'''with tarfile.open(name_arch, "w:gz") as tar:
        tar.add(dirc, arcname=os.path.basename(dirc))
        print("--Ajouter au {}..." .format( name_arch))
out.close()

print("----------------------------------------------------------------")
'''
print("-----------decompresson------------------------")

ta= tarfile.open(name=name_arch, mode='r')

for j in ta.getmembers():
    print("------> {}".format(j.name))
print("----------------------------------------------------------------")

##########################################################################################

conn = pexpect.spawn('sftp '+login+'@'+ip)
conn.expect ('[Pp]assword: ')
conn.sendline (passw)
conn.expect ('sftp> ')
print("uploading ...")
conn.sendline('put '+archi+' /home/user/TP_802/upload' )
conn.expect ('sftp> ')
conn.sendline ('bye')
print("ok")

print("\n Contenu dossier Upload")
ds = os.listdir("/home/user/TP_802/upload")
print('---> {}'.format(ds))