import numpy as np
import cv2
verilog_vid_gray = np.loadtxt("/home/nguyentienbao/Documents/PycharmProjects/images_processing/gray_frame_verilog/gray_verilog_frame.txt", dtype=int)
cv_gray = np.loadtxt("/home/nguyentienbao/Documents/PycharmProjects/images_processing/gray_frame/gray_all_frame.txt", dtype=int)
index = [0, 1]
verilog_vid_gray = np.delete(verilog_vid_gray, index)
verilog_vid_gray = verilog_vid_gray[: len(verilog_vid_gray) - 141]
error = np.amax(cv_gray - verilog_vid_gray)
print(error)
newarr = np.asarray(np.array_split(verilog_vid_gray, 143))
fourcc = cv2.VideoWriter_fourcc(*'MP4V')
out = cv2.VideoWriter('output.mp4', fourcc, 20.0, (1280, 720))
for i in range(143):
    gray_vid = newarr[i].reshape(720, 1280)
    gray_vid = np.uint8(np.asarray(gray_vid))
    print(gray_vid)
    out.write(gray_vid)

out.release()
cv2.destroyAllWindows()
