clc; clear all; close all;

full_path = 'C:\Users\HE201632\Downloads\projet\projet';

textFileName = 'Test Your Awareness eyes data.txt';
fid = fopen(textFileName);
header = fgetl(fid);
second_line = fgetl(fid);
third_line = fgetl(fid);
fclose( fid ) ;
total_header = regexp( header, '[^\t]+', 'match' );
total_line = regexp( third_line, '[^\t]+', 'match' );
total_line{44} = 'hi';
isStrCol = isnan( str2double( total_line)) ;
% - Build formatSpec for TEXTSCAN.
fmt = cell( 1, numel(isStrCol) ) ;
fmt(isStrCol)  = {'%s '} ;
fmt(~isStrCol) = {'%f '} ;
fmt = [fmt{:}] ;
% - Read full file.
fid = fopen(textFileName);
data = textscan( fid, fmt, Inf, 'Delimiter', '\t', 'headerLines', 2 ) ;
fclose( fid ) ;

index = find(contains(total_header, 'POR'));

l_por_x = num2cell(data{index(1)});
l_por_y = num2cell(data{index(2)});
r_por_x = num2cell(data{index(3)});
r_por_y = num2cell(data{index(4)});

Img = imread( '%s\frames\images_500.png', full_path);
imshow(Img)