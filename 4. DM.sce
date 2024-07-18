clc
clear
close

am = input('Enter the message signal amplitude = ');
fm = input('Enter the message signal frequency = ');
// Higher Samplig Frequency gives better recovery of message Signal
fs = input('Enter the sampling frequency (50−300) = ');
t =0:1/fs:1;

msg = am*sin(2.*%pi*fm*t);
p = length(msg);

subplot(3,1,1)
plot(t,msg);
title('Message Signal');
xlabel('TIME');
ylabel('Amplitude');

delta =(2.*%pi*am*fm)/fs; //To prevent slope overload distortion and Granualar Noise
disp('The Step Size is ',delta)


// Generation of Delta Modulation
delta_mod =0;
for i =1:p
if msg(i)>delta_mod(i)
d(i)=1;
delta_mod(i +1) = delta_mod(i) + delta;
else
d(i)=0;
delta_mod(i +1) = delta_mod(i) - delta ;
end
end


subplot(3,1,2)
plot2d2(delta_mod)
title('Delta Modulated Output');
xlabel ('TIME');
ylabel ('AMPLITUDE');


// Recovery of Message signal (Demodulation)
demod =0
for i =1:p
if d(i)==1;
demod(i +1) = delta_mod(i)+ delta ;
else
demod(i +1) = delta_mod(i) - delta ;
end
end

subplot(3,1,3)
plot(demod);
title ('RECOVERED MESSAGE SIGNAL');
xlabel('TIME');
ylabel('AMPLITUDE');
