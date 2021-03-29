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
