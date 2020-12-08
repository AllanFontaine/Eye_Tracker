run("text_extrait.m");
xd = cell2mat(l_por_x);
yd = cell2mat(l_por_y);

n=50;
xi = linspace(min(xd(:)),max(xd(:)),n);
yi = linspace(min(yd(:)),max(yd(:)),n);

xr = interp1(xi,1:numel(xi),xd,'nearest')';
yr = interp1(yi,1:numel(yi),yd,'nearest')';

z = accumarray([xr' yr'], 1, [n n]);

figure(2)
surf(z)