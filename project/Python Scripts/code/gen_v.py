# n = 576
# for i in range(576):
#     with open(r'/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/code.txt', 'a') as f:
#         f.write('assign out' + str(i) + ' = ' + 'weight0_red[' + str(i) + '];')
#         f.write('\n')
n = 9
m = 64
for i in range(m):
    # for j in range(n):
    with open(r'/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/code.txt', 'a') as f:
        f.write('in_weight' + str(i) + '_8,')
        f.write('\n')
f.close()
