#!/bin/bash
cd /home/nguyentienbao/Documents/PycharmProjects/images_processing/
python3 rgb2gray_vid.py test.mp4
python3 merged.py red
python3 merged.py green
python3 merged.py blue
python3 merged.py gray
#end

