import fire
import struct


def float_to_bin(num):
    return bin(struct.unpack('!I', struct.pack('!f', num))[0])[2:].zfill(32)


def write_ieee754(filename):
    f = open(''.join(('', str(filename), '')), "r")
    fw = open(filename.replace(".txt", "") + "_ieee754.txt", "w")
    for x in f:
        fw.write(float_to_bin(float(x)))
        fw.write("\n")
    f.close()
    fw.close()


if __name__ == "__main__":
    fire.Fire(write_ieee754)
