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
