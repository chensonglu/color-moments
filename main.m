img = imread('spr.png');

img_hsv = rgb2hsv(img);

CM = extractCM(img_hsv, 3)