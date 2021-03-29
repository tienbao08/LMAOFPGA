
# Week 2
## Class Assignment

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

### TXT2IMAGE and check error:
```py
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

```
Read txt file contain pixel value and display image.
>Terminal command: python3 error_check.py test_gray.txt

### RGB2GRAY_VID to TXT
```py
import numpy as np
import cv2
import fire


def video_processing(video):
    cap = cv2.VideoCapture(video)
    w = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
    h = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
    size = (w, h)
    print(size)
    fps = cap.get(cv2.CAP_PROP_FPS)      # OpenCV2 version 2 used "CV_CAP_PROP_FPS"
    frame_count = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))
    duration = frame_count/fps

    print('fps = ' + str(fps))
    print('number of frames = ' + str(frame_count))
    print('duration (S) = ' + str(duration))
    minutes = int(duration/60)
    seconds = duration%60
    print('duration (M:S) = ' + str(minutes) + ':' + str(seconds))

    count = 0
    while cap.isOpened():
        ret, frame = cap.read()
        count = count + 1
        if count > frame_count:
            print("Finish")
            break
        else:
            print(count)
        name_red = "/home/nguyentienbao/Documents/PycharmProjects/images_processing/red_frame/" + "red_vid_" + str(count) + ".txt"
        name_green = "/home/nguyentienbao/Documents/PycharmProjects/images_processing/green_frame/" + "green_vid_" + str(count) + ".txt"
        name_blue = "/home/nguyentienbao/Documents/PycharmProjects/images_processing/blue_frame/" + "blue_vid_" + str(count) + ".txt"
        name_gray = "/home/nguyentienbao/Documents/PycharmProjects/images_processing/gray_frame/" + "gray_vid_" + str(count) + ".txt"
        # print(frame)
        blue = frame[:, :, 0].flatten()  # Gives **Blue**
        green = frame[:, :, 1].flatten()  # Gives **Green**
        red = frame[:, :, 2].flatten()  # Gives **Red**
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        gray = gray.flatten()
        with open(name_red, 'w') as f:
            f.write("\n".join(map(str, red)))
        with open(name_green, 'w') as f:
            f.write("\n".join(map(str, green)))
        with open(name_blue, 'w') as f:
            f.write("\n".join(map(str, blue)))
        with open(name_gray, 'w') as f:
            f.write("\n".join(map(str, gray)))
        f.close()
        cv2.imshow('frame', frame)
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    if not cap.isOpened():
        print("Finish?")

    cap.release()
    cv2.destroyAllWindows()


if __name__ == '__main__':
    fire.Fire(video_processing)

```

### TXT2VID and error_check:
```py
import cv2
import numpy as np
import fire


def error(filename1, filename2):
    h = 720
    w = 1280
    size = (w, h)
    frame = 143
    cv_gray = np.loadtxt("/home/nguyentienbao/Documents/PycharmProjects/images_processing/gray_frame/" + filename1, dtype=np.uint8)
    hdl_gray = np.loadtxt("/home/nguyentienbao/Documents/PycharmProjects/images_processing/gray_frame_verilog/" + filename2, dtype=np.uint8)
    index = [0, 1]
    hdl_gray = np.delete(hdl_gray, index)
    error = cv_gray - hdl_gray
    print("Max error: " + str(np.amax(error)))
    one_hdl_frame = np.array_split(hdl_gray, 143)
    one_cv_frame = np.array_split(cv_gray, 143)
    cv_result = cv2.VideoWriter('cv_gray.avi', cv2.VideoWriter_fourcc(*'MJPG'), 25, size, 0)
    hdl_result = cv2.VideoWriter('hdl_gray.avi', cv2.VideoWriter_fourcc(*'MJPG'), 25, size, 0)
    for f in range(frame):
        hdl_gray_vid = one_hdl_frame[f].reshape(h, w)
        hdl_result.write(hdl_gray_vid)
        cv_gray_vid = one_cv_frame[f].reshape(h, w)
        cv_result.write(cv_gray_vid)
        cv2.imshow("hdl_gray", hdl_gray_vid)
        cv2.imshow("cv_gray", cv_gray_vid)
        if cv2.waitKey(25) & 0xFF == ord('q'):
            break

    hdl_result.release()
    cv_result.release()
    cv2.destroyAllWindows()


if __name__ == '__main__':
    fire.Fire(error)

```
# 2. Images processing via HDL
## Idea for RTL module
> cv2.COLOR_BGR2GRAY original formula: Y = 0.299 x red + 0.587 x green + 0.114 x blue


> 0.299 << 16 = 0.299 * 2^16 = 19595.264 = 19595 (integer)


> 0.587 << 16 = 0.587 * 2^16 = 38469.632 = 38469 (integer)


> 0.114 << 16 = 0.114 * 2^16 = 7471.104 = 7471 (integer)


### Group choose left shift 16 becasue it gave the most accurate result.
 - Y = 19595 x red + 38469 x green + 7471 x blue
 - Y >> 16
 - Max error: 1 pixel value
```sh
Example: R = 49, G = 106, B = 16
cv2 formula: 0.299 x 49 + 0.587 x 106 + 0.114 x 16 = 78.697 -> cv2 rounding = 79
hdl formula: (19595 x 49 + 38469 x 106 + 7471 x 16) >> 16 = 78
```
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







