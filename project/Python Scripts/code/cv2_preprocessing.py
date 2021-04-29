import cv2
import numpy as np
import torch
from PIL import Image
from torchvision import transforms

model = torch.hub.load('pytorch/vision:v0.9.1', 'vgg11', pretrained=True)
model.eval()

(width, height) = (256, 256)
dim = (224, 224)
img = cv2.imread('cup.jpg', cv2.IMREAD_UNCHANGED)
img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
img = cv2.resize(img, (width, height), interpolation=cv2.INTER_AREA)

imagenet_mean = np.array([0.485, 0.456, 0.406])
imagenet_std = np.array([0.229, 0.224, 0.225])
print(imagenet_mean)
print(imagenet_std)

# process crop width and height for max available dimension
crop_width = dim[0] if dim[0] < img.shape[1] else img.shape[1]
crop_height = dim[1] if dim[1] < img.shape[0] else img.shape[0]
mid_x, mid_y = int(width / 2), int(height / 2)
cw2, ch2 = int(crop_width / 2), int(crop_height / 2)
crop_img = img[mid_y - ch2:mid_y + ch2, mid_x - cw2:mid_x + cw2]

img = crop_img / 255
img = (img - imagenet_mean) / imagenet_std

preprocess = transforms.Compose([
    transforms.ToTensor(),
])
input_tensor = preprocess(img)
print(input_tensor)
input_tensor = input_tensor.float()
input_batch = input_tensor.unsqueeze(0)  # create a mini-batch as expected by the model

# move the input and model to GPU for speed if available
if torch.cuda.is_available():
    input_batch = input_batch.to('cuda')
    model.to('cuda')

with torch.no_grad():
    output = model(input_batch)
# Tensor of shape 1000, with confidence scores over Imagenet's 1000 classes
print(output[0])
# The output has unnormalized scores. To get probabilities, you can run a softmax on it.
probabilities = torch.nn.functional.softmax(output[0], dim=0)
print(probabilities)

# Read the categories
with open("imagenet_classes.txt", "r") as f:
    categories = [s.strip() for s in f.readlines()]
# Show top categories per image
top5_prob, top5_catid = torch.topk(probabilities, 5)
for i in range(top5_prob.size(0)):
    print(categories[top5_catid[i]], top5_prob[i].item())




