import struct
import glob
import os
import natsort
from tqdm import tqdm


def float_to_bin(num):
    return bin(struct.unpack('!I', struct.pack('!f', num))[0])[2:].zfill(32)


os.chdir(r'/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/bias/')
myFiles = natsort.natsorted(glob.glob('*.txt'))
for files in tqdm(range(len(myFiles))):
    filename = myFiles[files]
    f = open(''.join(('', str(filename), '')), "r")
    fw = open("/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/bias/bias_ieee754/" + filename.replace(".txt", "") + "_ieee754.txt", "w")
    for x in f:
        fw.write(float_to_bin(float(x)))
        fw.write("\n")
    f.close()
    fw.close()
