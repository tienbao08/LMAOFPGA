import torch
from PIL import Image
from torchvision import transforms
import numpy as np

model = torch.hub.load('pytorch/vision:v0.9.1', 'vgg11', pretrained=True)
model.eval()

input_image = Image.open('/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/test_img/cup.jpg')
preprocess = transforms.Compose([
    transforms.Resize(256),
    transforms.CenterCrop(224),
    transforms.ToTensor(),
    transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225]),
])
input_tensor = preprocess(input_image)
# print(input_tensor)
img_array = input_tensor.cpu().detach().numpy()
img_array = img_array.reshape(224, 224, 3)
# print(img_array)
red = img_array[:, :, 0].flatten()
green = img_array[:, :, 1].flatten()
blue = img_array[:, :, 2].flatten()
with open(r'/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/normalized_pixel_value/red.txt', 'w') as f:
    f.write("\n".join(map(str, red)))
    f.close()
with open(r'/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/normalized_pixel_value/green.txt', 'w') as f:
    f.write("\n".join(map(str, green)))
    f.close()
with open(r'/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/normalized_pixel_value/blue.txt', 'w') as f:
    f.write("\n".join(map(str, blue)))
    f.close()

input_batch = input_tensor.unsqueeze(0)  # create a mini-batch as expected by the model

# move the input and model to GPU for speed if available
if torch.cuda.is_available():
    input_batch = input_batch.to('cuda')
    model.to('cuda')

with torch.no_grad():
    output = model(input_batch)
# Tensor of shape 1000, with confidence scores over Imagenet's 1000 classes
# print(output[0])
# The output has unnormalized scores. To get probabilities, you can run a softmax on it.
probabilities = torch.nn.functional.softmax(output[0], dim=0)
# print(probabilities)

# Read the categories
with open("/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/classes_label/imagenet_classes.txt", "r") as f:
    categories = [s.strip() for s in f.readlines()]
# Show top categories per image
top5_prob, top5_catid = torch.topk(probabilities, 5)
for i in range(top5_prob.size(0)):
    print(categories[top5_catid[i]], top5_prob[i].item())

w = model.state_dict()
w = list(w.values())
# print(len(w[16]))
# with open(r'/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/test.txt', 'w') as f:
#     f.write("\n".join(map(str, w[16])))
for i in range(len(w)):
    new_weights = w[i]
    weights = new_weights.cpu().detach().numpy()
    if i % 2 == 0:
        with open(r'/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/weight/weight' + str(i) + '.npy', 'wb') as f:
            np.save(f, weights)
    else:
        with open(r'/home/nguyentienbao/Documents/PycharmProjects/img_preprocessing/bias/bias' + str(i-1) + '.txt', 'w') as f:
            f.write("\n".join(map(str, weights)))
            f.close()
