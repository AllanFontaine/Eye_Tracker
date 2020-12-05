close all; clear all; clc;
run('text_extrait.m');
run('test_interp.m');
for numb = 1: 500
    I = imread(strcat('frames/image_', num2str(numb), '.png'));

    imshow(I);

    hold on;
    
    plot(x(numb)/1.6, y(numb)/1.6, 'g+', 'MarkerSize', 10);

    hold off;

    a = getframe;

    imwrite(a.cdata, strcat('framescopy/imagecopy_',num2str(numb),'.png'));
end

imgNum = 500;
%remet les frames en vidéo
for i = 1: imgNum
	img=imread(strcat('framescopy/imagecopy_', num2str(i), '.png')); % changement de l image la
	video(:,:,:,i) = img;
end

v = VideoWriter('Test Your Awareness copy.avi');
open(v)
writeVideo(v, video)
close(v)
disp('video converted, check it out')
