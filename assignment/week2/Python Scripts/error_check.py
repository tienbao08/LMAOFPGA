import numpy as np
import fire
import matplotlib.pyplot as plt
h = 541
w = 960


def error_check(filename1, filename2):
    cv_gray = np.loadtxt(''.join(('', str(filename1), '')), dtype=int)
    hdl_gray = np.loadtxt(''.join(('', str(filename2), '')), dtype=int)
    index = [0, 1]
    hdl_gray = np.delete(hdl_gray, index)
    error = cv_gray - hdl_gray
    print(np.amax(error))
    newarr = cv_gray.reshape(h, w)
    plt.imshow(newarr, cmap='gray', vmin=0, vmax=255)
    plt.show()


if __name__ == "__main__":
    fire.Fire(error_check)
