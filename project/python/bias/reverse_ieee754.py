import struct
import fire


def bin_to_float(binary):
    return struct.unpack('!f', struct.pack('!I', int(binary, 2)))[0]


def write_float(filename):
    f = open(''.join(('', str(filename), '')), "r")
    fw = open(filename.replace("ieee754.txt", "") + "dec.txt", "w")
    for x in f:
        fw.write(str(bin_to_float(x)))
        fw.write("\n")
    f.close()
    fw.close()


if __name__ == "__main__":
    fire.Fire(write_float)
