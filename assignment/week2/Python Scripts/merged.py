import glob
import natsort
import fire


def merged(name):
    read_files = natsort.natsorted(glob.glob("/home/nguyentienbao/Documents/PycharmProjects/images_processing/" + name + "_frame/*.txt"))
    with open("/home/nguyentienbao/Documents/PycharmProjects/images_processing/" + name + "_frame/all_" + name + "_frame.txt", "w") as outfile:
        for f in read_files:
            with open(f, "r") as infile:
                outfile.write(infile.read())
            outfile.write("\n")


if __name__ == "__main__":
    fire.Fire(merged)
