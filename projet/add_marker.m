reader = VideoReader('Test Your Awareness.avi');


for numb = 1: 1709
    I = imread(strcat('frames/image_', num2str(numb), '.png'));

    imshow(I);

    hold on;
    
    plot(test_moving_med_x(numb)/1.6, test_moving_med_y(numb)/1.6, 'mo', 'MarkerSize', 10);

    hold off;

    a = getframe;

    imwrite(a.cdata, strcat('framescopy/imagecopy_',num2str(numb),'.png'));
end

disp('image fini, maintenant video')

imgNum = 1709;
%remet les frames en vidéo
for i = 1: imgNum
	img=imread(strcat('framescopy/imagecopy_', num2str(i), '.png'));
	video(:,:,:,i) = img;
end

disp('video fichier cr�e, maintenant, cr�er la vid�o');
writer = VideoWriter('Test Your Awareness test.avi');
writer.FrameRate = reader.FrameRate;
open(writer);
writeVideo(writer, video);
close(writer);
disp('video converted, check it out');
