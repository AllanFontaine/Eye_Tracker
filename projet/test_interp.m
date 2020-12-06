x_data = data{index(1)};
y_data = data{index(2)};

temps =cell2mat(time);
t_points = linspace(min(temps),max(temps),1709); 
x = spline(temps,x_data,t_points);
y = spline(temps,y_data,t_points); 

% Savitsky-golay Filter

test_sgolayfilter_x = sgolayfilt(x, 70, 1709);
test_sgolayfilter_y = y;

%Median filter

test_median_x = [1709];
test_median_x(1) = median([0 0 x(1) x(2) x(3)]);
test_median_x(2) = median([0 x(1) x(2) x(3) x(4)]);
for i=3: length(x)-2
    test_median_x(i) = median([x(i-2) x(i-1) x(i) x(i+1) x(i+2)]);
end
test_median_x(1708)=median([x(1705) x(1706) x(1707) x(1708) 0]);
test_median_x(1709)=median([x(1706) x(1707) x(1708) x(1709) 0]);

test_median_y = [1709];
test_median_y(1) = median([0 0 y(1) y(2) y(3)]);
test_median_y(2) = median([0 y(1) y(2) y(3) y(4)]);
for i=3: length(y)-2
    test_median_y(i) = median([y(i-2) y(i-1) y(i) y(i+1) y(i+2)]);
end
test_median_y(1708)=median([y(1705) y(1706) y(1707) y(1708) 0]);
test_median_y(1709)=median([y(1706) y(1707) y(1708) y(1709) 0]);

%Présentation

figure,plot(t_points,x,'-.', t_points,test_sgolayfilter_x);
title('Point X');
figure,plot(t_points,y,'x', t_points,test_sgolayfilter_y);
title('Point Y');

subplot(2,1,1);
plot(t_points, x, '--', t_points, test_median_x);
legend('Signal de base', "Signal X filtered");
subplot(2,1,2);
plot(t_points, y, '--', t_points, test_median_y);
legend('Signal de base', "Signal Y filtered");
