close all; clear all; clc;
run('text_extrait.m');
first=1;
last=20;
for numb = 1: 500
    x=0;
    y=0;
    for j = first:last
        x= x+r_por_x{j};
        y= y+r_por_y{j};
    end
    first= first+20;
    last = last+20;
    x=x/20;
    y=y/20;
    disp(strcat('x= ',num2str(x),'/ y= ',num2str(y)));
    I = imread(strcat('frames/image_',num2str(numb),'.png'));

    imshow(I);

    hold on;
    
    plot(x/2, y/2, 'g+', 'MarkerSize', 10);

    hold off;

    a = getframe;

    imwrite(a.cdata, strcat('framescopy/imagecopy_',num2str(numb),'.png'));
end