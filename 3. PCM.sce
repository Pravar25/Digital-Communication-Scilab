clc ;
close ;
clear ;
f =2;
fs =20*f ; // Sampling Frequency
t =0:1/fs:2;
a =2;

msg = a*sin(2.*%pi*f*t);
subplot(3,1,1);
plot(t,msg)
xlabel('TIME');
ylabel('AMPLITUDE');
title('Message Signal');

x1 = msg + a; // Level Shifting to one sided signal
disp(x1,'Discrete Sampled Values of Message Signal') // Displays sampled values

quant = round (x1); // Quantization
disp(quant,'Quantized Sampled Values') ; // Displays quantized values
enco = dec2bin(quant); // Encoding into binary data
disp(enco,'PCM coded Values') ; // Displays PCM values

deco = bin2dec(enco); // Recovering Analog Message signal
recover = deco - a ;
subplot(3,1,2) ;
plot(t,recover)
xlabel('TIME');
ylabel('AMPLITUDE');
title('Recovered Signal');
h = gca();
h.data_bounds =[0,-3;2,3]
subplot(3,1,3) ;
plot (t,msg,'b',t,recover,'r') ;
xlabel('TIME');
ylabel('AMPLITUDE');
title('Recovered VS Original Signal') ;
h = gca() ;
h.data_bounds =[0,-3;2,3]
