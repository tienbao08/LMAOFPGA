import numpy as np
from matplotlib import pyplot as plt
import fire
from PIL import Image
w = 960
h = 541


def processing(txtfile):
    arr = np.loadtxt(''.join(('', str(txtfile), '')))
    newarr = arr.reshape(h, w)
    plt.imshow(newarr, cmap='gray', vmin=0, vmax=255)
    plt.show()


if __name__ == "__main__":
    fire.Fire(processing)

