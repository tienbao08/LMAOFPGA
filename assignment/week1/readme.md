# Week 1
## Class Assignment


<<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#Setup Environment">Setup Environment</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
  </ol>
</details>


## Setup Environment
### Create Github repo

* [Github repo](https://github.com/tienbao08/LMAOFPGA)

### Install Ubuntu Desktop

Group choose Ubuntu 20.04 LTS (Focal Fossa) and install on a physical PC.
* [Ubuntu](https://ubuntu.com/download/desktop)

### Install Python and Opencv

* [Python environment](https://www.python.org/downloads/)
* [Python IDE](https://www.jetbrains.com/pycharm/download/#section=linux)

```sh
# Install pycharm on ubuntu using snap
sudo snap install pycharm-community --classic
```
* [Opencv](https://pypi.org/project/opencv-python/)
```sh
# Install opencv using pycharm terminal
pip install opencv-python
```


## Read, write, display video from webcam using opencv
```python
import cv2

vid_width = 640
vid_height = 480
cap = cv2.VideoCapture(0) # changne 0 to other video file to read a video
fourcc = cv2.VideoWriter_fourcc(*"mp4v")
out = cv2.VideoWriter("output_webcam.mp4", fourcc, 15, (vid_width, vid_height))
while(cap.isOpened()):
    ret, frame = cap.read()
    if ret == True:
        out.write(frame)
    cv2.imshow("frame", frame)
    if cv2.waitKey(1) & 0xFF == ord("q"):
        break


cap.release()
out.release()
cv2.destroyAllWindows()
```
*RESULT*

![Result](output_webcam.gif)





