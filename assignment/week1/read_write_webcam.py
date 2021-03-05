import cv2

vid_width = 640
vid_height = 480
cap = cv2.VideoCapture(0)
fourcc = cv2.VideoWriter_fourcc(*"mp4v")
out = cv2.VideoWriter("output.mp4", fourcc, 15, (vid_width, vid_height))
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
