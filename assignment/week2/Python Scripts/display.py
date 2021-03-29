import cv2
import fire


def display(cv_gray, hdl_gray):
    cv_cap = cv2.VideoCapture(cv_gray)
    hdl_cap = cv2.VideoCapture(hdl_gray)
    while cv_cap.isOpened() and hdl_cap.isOpened():
        cv_ret, cv_frame = cv_cap.read()
        hdl_ret, hdl_frame = hdl_cap.read()
        cv2.imshow('cv_gray', cv_frame)
        cv2.imshow('hdl_gray', hdl_frame)
        if cv2.waitKey(25) & 0xFF == ord('q'):
            break
        if not cv_cap.isOpened() and hdl_cap.isOpened():
            print("Finish?")

    cv_cap.release()
    hdl_cap.release()
    cv2.destroyAllWindows()


if __name__ == '__main__':
    fire.Fire(display)
