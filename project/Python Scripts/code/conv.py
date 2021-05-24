import numpy as np
import cv2
from skimage.exposure import rescale_intensity
h = 224
w = 224


def convolution2d(image, kernel, stride, padding):
    image = np.pad(image, [(padding, padding), (padding, padding)], mode='constant', constant_values=0)

    kernel_height, kernel_width = kernel.shape
    padded_height, padded_width = image.shape

    output_height = (padded_height - kernel_height) // stride + 1
    output_width = (padded_width - kernel_width) // stride + 1

    new_image = np.zeros((output_height, output_width)).astype(np.float32)

    for y in range(0, output_height):
        for x in range(0, output_width):
            new_image[y][x] = np.sum(
                image[y * stride:y * stride + kernel_height, x * stride:x * stride + kernel_width] * kernel).astype(
                np.float32)
    return new_image


image = cv2.imread("dog.jpg")
image = cv2.cvtColor(src=image, code=cv2.COLOR_BGR2GRAY)
image = cv2.resize(image, (6, 6), interpolation=cv2.INTER_LINEAR)
cv2.imshow("gray_dog", image)
gray = image.flatten()
with open(r'gray.txt', 'w') as f:
    f.write("\n".join(map(str, gray)))

kernel = np.array([[-1, 0, 1], [-2, 0, 2], [-1, 0, 1]])
new_image = convolution2d(image, kernel, 1, 1)
print(new_image)
hdl_conv = np.loadtxt('224test_dec.txt', dtype=np.float32)
hdl_conv = hdl_conv[226:]
hdl_conv = hdl_conv[0:50176]
hdl_conv = hdl_conv.reshape(h, w).astype(np.float32)
error = new_image - hdl_conv
print("Max error: " + str(np.amax(error)))
new_image = rescale_intensity(hdl_conv, in_range=(0, 255))
new_image = (new_image * 255).astype("uint8")
print(new_image)
cv2.imshow("conv_py", new_image)
cv2.waitKey(0)
cv2.destroyAllWindows()
