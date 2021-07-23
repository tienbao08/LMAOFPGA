import numpy as np
import os
from tqdm import tqdm

directory = "/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/weight/weight_details"
files_in_directory = os.listdir(directory)
filtered_files = [file for file in files_in_directory if file.endswith(".txt")]
for file in filtered_files:
    path_to_file = os.path.join(directory, file)
    os.remove(path_to_file)

cnt = 0
weight_layers = 6
for layer in tqdm(range(weight_layers)):
    weight = np.load(
        '/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/weight/weight' + str(cnt) + '.npy')
    if cnt <= 10:
        for i in tqdm(range(weight.shape[1])):
            for j in tqdm(range(len(weight))):
                data = weight[j][i].flatten()
                with open(
                        r'/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/weight/weight_details/weight' + str(
                            cnt) + '_' + str(i) + '.txt', 'a') as f:
                    f.write("\n".join(map(str, data)))
                    f.write('\n')
                    f.close()
    cnt = cnt + 2
f.close()
