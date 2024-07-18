
clc
clear
close

n = input('Data stream (Eg [1 0 1]) = ');
fc = input('Enter the carrier signal frequency = ');
Rb = 2;
fs = 100*Rb;
// BINARY TO POLAR CONVERSION OF BITS
for m =1:length(n)
    if n(m) == 0
        nn(m) = -1;
    else
        nn(m) = 1;
    end
end

// Generating NRZ Waveform from bit sequence of bit duration 1 sec
i = 1/Rb;
z=1;
t = 0:1/fs:length(n)/Rb;
//t = 0:0.01:length(n);
for j =1:length(t)
    if t(j)<= i
        data(j)= nn(z);
    else
        i = i +1/Rb;
        z=z+1;
        data(j)= nn(z);
    end
end
figure(1)
subplot(3,1,1);
plot(t,data');
h = gca();
h.data_bounds =[0,-1.5;length(n)/Rb,1.5];
xlabel('TIME',"Fontsize",4);
ylabel('AMPLITUDE',"Fontsize",4);
title('BINARY INPUT',"Fontsize",4);
xgrid;

// CARRIER GENERATION
carrier =sin(2*%pi*fc*t);
subplot(3,1,2);
plot(t,carrier);
xlabel('TIME',"Fontsize",4);
ylabel('AMPLITUDE',"Fontsize",4);
title('CARRIER SIGNAL',"Fontsize",4);
xgrid;

//AMPLITUDE SHIFT KEYING SIGNAL GENERATION
for j =1:length(t)
    if data(j)==1
        ask(j) = carrier(j);
    else
        ask(j) = 0;
    end
end
subplot(3,1,3);
plot(t,ask');
xlabel('TIME',"Fontsize",4);
ylabel('AMPLITUDE',"Fontsize",4);
title('AMPLITUDE SHIFT KEYING SIGNAL',"Fontsize",4);
xgrid;

// GENERATION OF ASK SPECTRUM
frq= -fs/2:Rb/length(n):fs/2;
y1=fftshift(fft(ask));
figure(2)
subplot(3,1,1)
plot(frq,abs(y1'));
xlabel('FREQUENCY',"Fontsize",4) ;
ylabel('AMPLITUDE',"Fontsize",4)
title ('ASK Spectrum',"Fontsize",4)
xgrid;

// ASK SIGNAL DEMODULATION
for j =1:length(t)
    if ask(j) == carrier(j)
        demod(j) = 1
    else
        demod(j) = -1
    end
end
subplot(3,1,2)
plot(t,demod')
xlabel('TIME',"Fontsize",4);
ylabel('AMPLITUDE',"Fontsize",4);
title('DEMODULATED MESSAGE SIGNAL',"Fontsize",4);
xgrid;
h = gca();
h.data_bounds =[0,-1.5;length(n)/Rb,1.5];
