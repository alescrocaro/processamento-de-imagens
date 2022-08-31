import cv2
import numpy as np

img = cv2.imread('teste.jpg')

img.itemset((0:28, 85:100, 2), 255)
img.itemset((0:28, 85:100, 0:1), 0)