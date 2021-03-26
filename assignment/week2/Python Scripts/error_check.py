import numpy as np
import fire
import matplotlib.pyplot as plt
import cv2
h = 541
w = 960


def error_check(filename1, filename2):
    cv_gray = np.loadtxt(''.join(('', str(filename1), '')), dtype=np.uint8)
    hdl_gray = np.loadtxt(''.join(('', str(filename2), '')), dtype=np.uint8)
    index = [0, 1]
    hdl_gray = np.delete(hdl_gray, index)
    error = cv_gray - hdl_gray
    print("Max error: " + str(np.amax(error)))
    cv_gray = cv_gray.reshape(h, w)
    hdl_gray = hdl_gray.reshape(h, w)
    cv2.imshow("cv_gray", cv_gray)
    cv2.imshow("hdl_gray", hdl_gray)

    cv2.waitKey(0)
    cv2.destroyAllWindows()


if __name__ == "__main__":
    fire.Fire(error_check)
