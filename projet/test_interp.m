x_data = data{index(1)};
y_data = data{index(2)};

t=cell2mat(time);
x_temps = linspace(min(t),max(t),1709); 
x = spline(t,x_data,x_temps); 

y_temps = linspace(min(t),max(t),1709); 
y = spline(t,y_data,y_temps);
figure,plot(t,x_data,'x',x_temps,x);
figure,plot(t,y_data,'x',y_temps,y);


