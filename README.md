# feature-extraction-matlab
extract color moments features from a image.

Demo: 

1. img = imread('./spr.png');
2. img = rgb2hsv(img);
3. CM = extractCM(img, 3); % 3 means grid partition constant
