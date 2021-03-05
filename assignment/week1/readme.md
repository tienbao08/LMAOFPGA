# Week 1
## Class Assignment


<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#Setup Environment">Setup Environment</a></li>
        <ul>
            <li><a href="#Create Github repo">Create Github repo</a></li>
        </ul>
        <ul>
            <li><a href="#Install Ubuntu Desktop">Install Ubuntu Desktop</a></li>
        </ul>
        <ul>
            <li><a href="#Install Python and Opencv">Install Python and Opencv</a></li>
        </ul>
    <li><a href="#Read, write and display video from webcam using opencv">Read, write and display video from webcam using opencv</a></li>
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
```sh
import cv2

vid_width = 640
vid_height = 480
cap = cv2.VideoCapture(0)
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
*[Result](output_webcam.gif)





