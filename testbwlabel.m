clear all;close all;
I = imread('rice.png');
imshow(I);
background = imopen(I,strel('disk',15));
figure, imshow(background);
I2 = imsubtract(I,background);
figure, imshow(I2);
I3 = imadjust(I2);
figure, imshow(I3);
level = graythresh(I3);
bw = im2bw(I3,level); 
figure, imshow(bw);
[labeled,numObjects] = bwlabel(bw,4); %homework *: design your own bwlabel() code to replace this line.
figure, imshow(labeled,[]);