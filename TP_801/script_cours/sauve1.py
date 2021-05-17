import pysftp
import sys
import os
import tarfile
import pexpect


ip = sys.argv[1]
login = sys.argv[2]
passw = sys.argv[3]
archi = sys.argv[4]

if len (sys.argv) != 5 :
    print ("Vous n'avez pas le bon nombre d'arguments ")
    print ("./nomProg nomArchive Nom_rep_sauvegarde addr_serveur login mdp")
    sys.exit (1)

'''conn = pexpect.spawn('sftp '+login+'@'+ip)
conn.expect ('[Pp]assword: ')
conn.sendline (passw)
conn.expect ('sftp> ')
print("uploading ...")
conn.sendline('put'/home/pass/project_802/'+archi+ 'upload' )
conn.expect ('sftp> ')
conn.sendline ('bye')
print("ok")

print("\n Contenu dossier Upload")
ds = os.listdir("/home/user/TP_802/upload")
print('---> {}'.format(ds))
'''
#########################################################

with pysftp.Connection(host=ip, username=login, password=passw) as sftp:
    print( "Connection succesfully stablished ... ")

    # Define the file that you want to upload from your local directorty
    # or absolute "C:\Users\sdkca\Desktop\TUTORIAL2.txt"
    localFilePath = archi

    # Define the remote path where the file will be uploaded
    remoteFilePath = '/home/pass/project_802/'+archi

    sftp.put(localFilePath, remoteFilePath)