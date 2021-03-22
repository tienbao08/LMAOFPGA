import numpy as np
import cv2

cap = cv2.VideoCapture('test.mp4')
print(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
print(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
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
    # print(frame)
    blue = frame[:, :, 0].flatten()  # Gives **Blue**
    green = frame[:, :, 1].flatten()  # Gives **Green**
    red = frame[:, :, 2].flatten()  # Gives **Red**
    with open(name_red, 'w') as f:
        f.write("\n".join(map(str, red)))
    with open(name_green, 'w') as f:
        f.write("\n".join(map(str, green)))
    with open(name_blue, 'w') as f:
        f.write("\n".join(map(str, blue)))
    f.close()
    # gray = cv2.ctColor(frame, cv2.COLOR_BGR2GRAY)
    # cv2.imshow('frame', frame)
    # if cv2.waitKey(1) & 0xFF == ord('q'):
    #     break

if not cap.isOpened():
    print("Finish?")

cap.release()
cv2.destroyAllWindows()
