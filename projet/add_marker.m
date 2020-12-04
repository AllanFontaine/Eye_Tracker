close all; clear all; clc;

I = imread('frames/image_500.png');

imshow(I);

hold on;

plot(50, 100, 'r+', 'MarkerSize', 5);

hold off;

disp('gonna attribute');

a = getframe;

imwrite(a, 'image_1.png');
