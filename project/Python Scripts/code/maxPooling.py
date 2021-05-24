import numpy as np
import skimage.measure
import cv2
w = 7
h = 7
image = cv2.imread("dog.jpg")
image = cv2.cvtColor(src=image, code=cv2.COLOR_BGR2GRAY)
image = cv2.resize(image, (14, 14), interpolation=cv2.INTER_LINEAR)
maxpool_img = skimage.measure.block_reduce(image, (2, 2), np.max)
with open(r'MaxPool_Result.txt', 'r') as f:
    hdl_maxpool = f.read()
hdl_maxpool = hdl_maxpool.replace("x", "")
hdl_maxpool = hdl_maxpool.strip()
with open(r'MaxPool_Result_ieee754.txt', 'w') as f:
    f.write(hdl_maxpool)
f.close()
hdl_maxpool = np.loadtxt('MaxPool_Result_dec.txt', dtype=np.float32)
hdl_maxpool = hdl_maxpool.reshape(h, w).astype(np.float32)
error = maxpool_img - hdl_maxpool
print("Max error: " + str(np.amax(error)))

