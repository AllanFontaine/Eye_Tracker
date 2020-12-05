close all; clear all; clc;
run('filter_data.m');
first=1;
last=20;
for numb = 1: 1700
    %x=[];
    %y=[];
    x=0;
    y=0;
    for j = first:last
        %x= [x,r_por_x{j}];
        %y= [y,r_por_y{j}];
        x=x+porX(j);
        y=y+porY(j);
    end
    first= first+20;
    last = last+20;
    x=x/20;
    y=y/20;
    disp(strcat("frame numéro :",num2str(numb),' x= ',num2str(x/1.6),'/ y= ',num2str(y/1.6)));
    I = imread(strcat('frames/image_',num2str(numb),'.png'));

    imshow(I);

    hold on;
    %for p = 1:19
       % plot(x(p), y(p), 'g+', 'MarkerSize', 10);
    %end
    
    plot(x/1.6, y/1.6, 'go', 'MarkerSize', 10);
    hold off;

    a = getframe;

    imwrite(a.cdata, strcat('framescopy/imagecopy_',num2str(numb),'.png'));
end