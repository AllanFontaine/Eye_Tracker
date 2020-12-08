%Ce fichier permet de couper la vidéo en plusieurs images.
disp('video has been played');

v = VideoReader('Test Your Awareness.avi');
n = 1;
%met la video en frame
while hasFrame(v)
	img = readFrame(v);
	imwrite(img, strcat('frames/image_',num2str(n),'.png'));
	n = n+1;
end
n = n+1;