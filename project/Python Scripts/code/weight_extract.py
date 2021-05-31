import numpy as np

data = np.load('/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/weight/weight0.txt')
for r in range(64):
    red = data[r][0].flatten()
    with open(r'/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/weight/weight0_red.txt', 'a') as f:
        f.write("\n".join(map(str, red)))
        f.write('\n')
for g in range(64):
    green = data[g][1].flatten()
    with open(r'/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/weight/weight0_green.txt', 'a') as f:
        f.write("\n".join(map(str, green)))
        f.write('\n')
for b in range(64):
    blue = data[g][2].flatten()
    with open(r'/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/weight/weight0_blue.txt', 'a') as f:
        f.write("\n".join(map(str, blue)))
        f.write('\n')
f.close()
