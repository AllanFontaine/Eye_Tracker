clc; clear all; close all;
run("text_extrait.m");
x=cell2mat(l_por_x);
y=cell2mat(l_por_y);
t=cell2mat(time);
a = 1;
b = [1/100 1/100 1/100 1/100];
o=filter(b,a,x);
%imfilter(x,[1 1 1]);
%plot(t,x,'g--');
plot(t,x,'g--',t,o,'r-');
legend('Original data','filtered data');
