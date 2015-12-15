# feature-extraction-matlab
extract color moments features from a image.

Demo:
img = imread('./spr.png');
img = rgb2hsv(img);
CM = extractCM(img, 3); % 3 means grid partition constant
