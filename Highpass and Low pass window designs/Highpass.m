clc
clear all;
close all

N=input("Enter the value :");
Wc=input("Enter the cut off frequency :");
alpha=(N-1)./2;
n=0:1:N-1;
Hd=((-1).^n).*(Wc/pi).* sinc(Wc.*(n-alpha)./pi);
% %B1=hamming(N);
% H1=B1'.*Hd;
 W=0:0.01:pi;
% h1=freqz(H1,1,W);
% plot(W/pi,20*log(abs(h1)))
B2=hann(N);
H2=B2'.*Hd;

h2=freqz(H2,1,W);
plot(W/pi,20*log(abs(h2)))
legend('21UEC095')
ylabel('Frequency')
xlabel('20*log(abs(h2)')
%plot(W/pi,phase(h2))





