import numpy as np
import cv2

# print(np.array([[-1, 0, 1], [-2, 0, 2], [-1, 0, 1]]))
n = 451
m = 6

# state 4
for i in range(n):
    print("pos[" + str(450-i) + "] <= pos[" + str(450-i+1) + "];")

# # padding
# for j in range(m):
#     print("temp[" + str((7-j)-1) + "] <= 32'h0;")

# # state 1
# v = 64
# for i in range(v):
#     print("temp[" + str(63-i) + "] <= temp[" + str(63-(i-1)) + "];")

# # state 2
# v = 6
# j = 0
# for i in range(v):
#     print("(count >= 17'd" + str(i+j+36) + " && count < 17'd" + str(i+j+41) + ") ||")
#     j = j + 5

# state 3
# v = 5
# j = 0
# for i in range(v):
#     print("count == 17'd" + str(41+j) + " ||")
#     j = j + 6
