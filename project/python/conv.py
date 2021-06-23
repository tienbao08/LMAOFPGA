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
blue = image[:, :, 0].flatten()  # Gives **Blue**
green = image[:, :, 1].flatten()  # Gives **Green**
red = image[:, :, 2].flatten()  # Gives **Red**
with open(r'red.txt', 'w') as f:
    f.write("\n".join(map(str, red)))
with open(r'green.txt', 'w') as f:
    f.write("\n".join(map(str, green)))
with open(r'blue.txt', 'w') as f:
    f.write("\n".join(map(str, blue)))
f.close()
# image = cv2.cvtColor(src=image, code=cv2.COLOR_BGR2GRAY)
# image = cv2.resize(image, (h, w), interpolation=cv2.INTER_LINEAR)
cv2.imshow("dog", image)
kernal_red = np.array([[0.2881644, 0.035818692, -0.3849891], [0.17949042, 0.36680186, -0.5011846], [-0.09738678, 0.36481255, -0.22963253]])
kernal_green = np.array([[0.40151164, -0.046086375, -0.6842188], [0.444157, 0.44780582, -0.79494226], [0.11294162, 0.49167266, -0.37049103]])
kernal_blue = np.array([[0.21615116, -0.028970193, -0.39492893], [0.14896882, 0.2967297, -0.42939976], [-0.00945409, 0.34790632, -0.15582275]])
red_conv = convolution2d(image[:, :, 2], kernal_red, 1, 1)
green_conv = convolution2d(image[:, :, 1], kernal_green, 1, 1)
blue_conv = convolution2d(image[:, :, 0], kernal_blue, 1, 1)
new_image = (red_conv + green_conv + blue_conv + 0.19386716)
new_image = np.where(new_image < 0, 0, new_image)
hdl_conv = np.loadtxt('Conv_result_dec.txt', dtype=np.float32)
hdl_conv = hdl_conv[226:]
hdl_conv = hdl_conv.reshape(h, w).astype(np.float32)
error = new_image - hdl_conv
print("Max error: " + str(np.amax(error)))
print(new_image)
print("------------------")
print(hdl_conv)
cv2.imshow("conv_py", new_image)
cv2.imshow('hdl_conv', hdl_conv)
cv2.waitKey(0)
cv2.destroyAllWindows()
