
# Week 2
## Class Assignment


<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#Images processing via Python">Images processing via Python</a></li>
        <ul>
            <li><a href="RGB2GRAY">RGB2GRAY</a></li>
        </ul>
        <ul>
            <li><a href="#IEEE754 converter tool (Single precision)">IEEE754 converter tool (Single precision)</a></li>
        </ul>
        <ul>
            <li><a href="#TXT2IMAGE">TXT2IMAGE</a></li>
        </ul>
    <li><a href="Images procssing via HDL">Images procssing via HDL</a></li>
  </ol>
</details>


## 1. Images procssing via python
### RGB2GRAY
```py
import cv2
import fire


def rgb2gray(stockimg):
    img = cv2.imread(stockimg)
    blue = img[:, :, 0].flatten()  # Gives **Blue**
    green = img[:, :, 1].flatten()  # Gives **Green**
    red = img[:, :, 2].flatten()  # Gives **Red**
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    cv2.imshow('Original image', img)
    cv2.imshow('Gray image', gray)
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    # Y = 0.299 R + 0.587 G + 0.114 B
    cv2.imwrite("test_gray.jpg", gray)
    gray_pix = gray.flatten()
    with open(r'test_gray.txt', 'w') as f:
        f.write("\n".join(map(str, gray_pix)))
    with open(r'red.txt', 'w') as f:
        f.write("\n".join(map(str, red)))
    with open(r'green.txt', 'w') as f:
        f.write("\n".join(map(str, green)))
    with open(r'blue.txt', 'w') as f:
        f.write("\n".join(map(str, blue)))
    f.close()
    print(red, green, blue, gray_pix)


if __name__ == '__main__':
    fire.Fire(rgb2gray)

```
Export every pixel value of 3 RGB channels and gray channel into separate txt files.
>Terminal command: python 3 rgb2gray.py test.jpg (or every other URL of images)
### IEEE754 converter tool (Single precision)
* [Dec_to_Bin32] (https://github.com/tienbao08/ieee754tobin)
>Terminal command: python3 main.py gray.txt (or every other txt contain dec format numbers)

* [Bin32_to_Dec] (https://github.com/tienbao08/bintodec)
>Teminal command: python3 main.py gray_ieee754.txt (or every other txt contain ieee754 format numbers)

### TXT2IMAGE
_Gray version_
```py
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

```
Read txt file contain pixel value and display image.
>Terminal command: python3 reverse.py test_gray.txt
# 2. Images processin via HDL





