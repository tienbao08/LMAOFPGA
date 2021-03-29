
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
    <li><a href="#Images procssing via HDL">Images procssing via HDL</a></li>
        <ul>
            <li><a href="#Datapath">Datapath</a></li>
        </ul>
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
# 2. Images processing via HDL
## Idea for RTL module
> cv2.COLOR_BGR2GRAY original formula: Y = 0.299 x red + 0.587 x green + 0.114 x blue
> 0.299 << 16 = 0.299 * 2^16 = 19595.264 = 19595 (integer)
> 0.299 << 16 = 0.587 * 2^16 = 38469.632 = 38469 (integer)
> 0.114 << 16 = 0.114 * 2^16 = 7471.104 = 7471 (integer)


### Group choose left shift 16 becasue it gave the most accurate result.
 - Y = 19595 x red + 38469 x green + 7471 x blue
 - Y >> 16
### Board used: Ultra96 v2
## Block design: 
 - 1 single cycle
 - 24-bit RGB input (8-bit Red, 8-bit Green, 8-bit Blue)
 - 8-bit GrayScale output
## Diagram:
![Diagram](https://user-images.githubusercontent.com/76895207/112758451-a95d2200-9018-11eb-942e-c7e3de2379d7.png)
## Schematic:
![Schematic](https://user-images.githubusercontent.com/76895207/112743851-1c3cad80-8fc5-11eb-90f9-ad5850893e08.png)
## Resource:
![Resource](https://user-images.githubusercontent.com/76895207/112743867-2b236000-8fc5-11eb-8a4c-d6eb8f67ca32.png)







