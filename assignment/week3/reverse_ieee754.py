import struct
import fire


def bintodec(filename):
    f = open(''.join(('', str(filename), '')), "r")
    fw = open(filename.replace("ieee754.txt", "") + "dec.txt", "w")
    for x in f:
        dec = int(''.join(('', str(x), '')), 2)
        print(str(struct.unpack('f', struct.pack('I', dec))[0]).replace(".0", ""))
        fw.write(str(struct.unpack('f', struct.pack('I', dec))[0]).replace(".0", ""))
        fw.write("\n")
    f.close()
    fw.close()


if __name__ == "__main__":
    fire.Fire(bintodec)
