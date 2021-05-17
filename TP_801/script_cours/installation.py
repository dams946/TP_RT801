import stat
import os
import tarfile
import zipfile
import sys


arch = sys.argv[1]
folder = sys.argv[2]

print("test if file exist")

if os.path.exists(arch):

    print("-->{} : exit".format(arch))

else:
    print("--->{} : n'esxite pas" .format(arch))

print("-----------Test permission-----------")

if os.access(arch, os.R_OK):

    print("--- Read Permission" )

if os.access(arch, os.W_OK):
    print("--- Whrite Permission")

if os.access(arch,os.R_OK):
    print("--- Execution Permission")

print("----------Veriffiction extension")

if (arch.endswith(".tar")):
    print("---> utilisation TAR...")
    t = tarfile.open(arch, 'r|')
    t.extractall(folder)
    print (os.listdir(folder))
    exit(0)

if (arch.endswith(" .tar")):
    print("---> utilisation de Zip")
    z = zipfile.Zipfile(arch, 'r|')
    z.extractall(folder)
    z.close()
    print(os.listdir(folder))

if (arch.endswith(".tgz")):
    print("---> utilisation TGZ...")
    t = tarfile.open(arch, 'r|gz')
    t.extractall(folder)
    print (os.listdir(folder))
    exit(0)