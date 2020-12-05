clc; clear all; close all;
disp('video has been played');

v = VideoReader('Test Your Awareness.avi');
n = 1;
%met la vidéo en frame
while hasFrame(v)
	img = readFrame(v);
	imwrite(img, strcat('frames/image_',num2str(n),'.png'));
	n = n+1;
end
n = n+1;
disp('option numéro 1, faites')

imgNum = 1709;
%remet les frames en vidéo
for i = 1: imgNum
	img=imread(strcat('frames/image_', num2str(i), '.png')); % changement de l image la
	video(:,:,:,i) = img;
end

v = VideoWriter('Test Your Awareness copy.avi');
open(v)
writeVideo(v, video)
close(v)
disp('video converted, check it out')