clc; clear all; close all;

disp('video has been played');

textFileName = 'C:\Users\celia\Documents\info 3eme\traitement de signal\projet\Test Your Awareness eyes data.txt';
fid = fopen(textFileName);
C = textscan(fid, '');
% data = textscan(fid, '%*s %*s %f %*[^\n]','HeaderLines',1);

v = VideoReader('Test Your Awareness.avi')
n = 1;
while hasFrame(v)
	img = readFrame(v);
	imwrite(img, strcat('frames/image_',num2str(n),'.png'));
	n = n+1;
end
n = n+1;
disp('option numéro 1, faites')

imgNum = 1709

for i = 1: imgNum
	img=imread(strcat('frames/images_', num2str(i), '.png')); % changement de l image la
	
	video(:,:,:,i) = img
end

v = VideoWriter('Test Your Awareness copy.avi')
open(v)
writeVideo(v, video)
close(v)
disp('video converted, check it out')