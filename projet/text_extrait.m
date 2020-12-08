%Ce fichier permet de récupérer les infos dont on a besoin.

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
index2 = find(contains(total_header,'Time'));

time = num2cell(data{index2(1)});
l_por_x = num2cell(data{index(1)});
l_por_y = num2cell(data{index(2)});
r_por_x = num2cell(data{index(3)});
r_por_y = num2cell(data{index(4)});