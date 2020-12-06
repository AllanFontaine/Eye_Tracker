x_data = data{index(1)};
y_data = data{index(2)};

temps =cell2mat(time);
t_points = linspace(min(temps),max(temps),1709); 
x = spline(temps,x_data,t_points);
y = spline(temps,y_data,t_points); 

% Savitsky-golay Filter

test_sgolayfilter_x = sgolayfilt(x, 100, 1709);
test_sgolayfilter_y = sgolayfilt(y, 100, 1709);

% Median filter

test_median_x = median_custom(x);
test_median_y = median_custom(y);

%Moving average filter

test_moving_x = moving(x);
test_moving_y = moving(y);

test_moving_med_x = median_custom(test_moving_x);
test_moving_med_y = median_custom(test_moving_y);

%Présentation
subplot(2,1,1);
plot(t_points,x,'--', t_points,test_sgolayfilter_x);
legend('Signal de base', "Signal X filtered");
subplot(2,1,2);
plot(t_points,y,'--', t_points,test_sgolayfilter_y);
legend('Signal de base', "Signal Y filtered");
title('Savitsky-golay filter');

subplot(2,1,1);
plot(t_points, x, '--', t_points, test_median_x);
legend('Signal de base', "Signal X filtered");
subplot(2,1,2);
plot(t_points, y, '--', t_points, test_median_y);
legend('Signal de base', "Signal Y filtered");
title('Médiane filter');

subplot(2,1,1);
plot(t_points,x,'--', t_points,test_moving_x);
legend('Signal de base', "Signal X filtered");
title('Moving average filter');
subplot(2,1,2);
plot(t_points,y,'--', t_points,test_moving_y);
legend('Signal de base', "Signal Y filtered");
title('Moving average filter');

subplot(2,1,1);
plot(t_points,test_moving_x,'--', t_points,test_moving_med_x, 'r');
legend('Signal moving', "Signal moving puis SG");
title('Signal moving puis SG')
subplot(2,1,2);
plot(t_points,test_moving_y,'--', t_points,test_moving_med_y, 'r');
legend('Signal moving', "Signal moving puis SG");
title('Signal moving puis SG');

% Functions

function name = moving(var)
    name = (1709);
    name(1) = 1/3*(0 + var(1) + var(2));
    for i=2: length(var)-1
        name(i) = 1/3*(var(i-1) + var(i) + var(i+1));
    end
    name(1709) = 1/3*( var(1708) + var(1709) + 0);
end

function name = median_custom(var)
    name = [1709];
    name(1) = median([0 0 var(1) var(2) var(3)]);
    name(2) = median([0 var(1) var(2) var(3) var(4)]);
    for i=3: length(var)-2
        name(i) = median([var(i-2) var(i-1) var(i) var(i+1) var(i+2)]);
    end
    name(1708)=median([var(1705) var(1706) var(1707) var(1708) 0]);
    name(1709)=median([var(1706) var(1707) var(1708) var(1709) 0]);
end