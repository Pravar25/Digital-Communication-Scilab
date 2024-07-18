//Study Carrier Modulation Techniques using BFSK

clc
clear
close

n = input ('Enter the Random binary Input (Eg [1 1 0 0 1])=' );  // Random binary Input
fH = input ('Enter the Higher carrier frequency fH=' );  //Higher Frequency Carrier
fL = input ('Enter the Lower carrier frequency fL=' );  //Lower Frequency Carrier
Rb = 1;
fs = 1000*Rb;

// Binary to polar conversion of Bits

for m=1:length(n)
    if n(m)==0
        nn(m)= -1;
    else
        nn(m) =1;
    end
end

// Generating NRZ Waveform from bit sequence of bit duration 1 sec

i = 1/Rb;
z=1;
t = 0:1/fs:length(n)/Rb;
//t =0:0.01: length(n);

for j=1: length(t)
    if t(j)<=i
        data(j)=nn(z);
    else
        i = i +1/Rb;
        z=z+1;
        data(j)=nn(z);
    end
end

// Plotting of NRZ Data
figure(1)
subplot(3,1,1);
plot(t,data');
h= gca();
h.data_bounds =[0,-1.5;length(n)/Rb,1.5]
xlabel('TIME');
ylabel('AMPLITUDE');
title('BINARY INPUT');
xgrid;

// Carrier Generation
carrier_1 = sin(2.*%pi*fH*t); // Higher Frequency Carrier
subplot(3,1,2);
plot(t,carrier_1);
xlabel('TIME');
ylabel('AMPLITUDE');
title('CARRIER SIGNAL 1');
xgrid;

carrier_2 = sin(2.*%pi*fL*t); // Lower Frequency Carrier
subplot(3,1,3);
plot(t,carrier_2);
xlabel('TIME');
ylabel('AMPLITUDE');
title('CARRIER SIGNAL 2');
xgrid;

//FSK SIGNAL GENERATION
for j=1:length(t)
    if data(j)==1
        fsk(j)= carrier_1(j);
    else
        fsk(j)= carrier_2(j);
    end
end
figure(2);
subplot(3,1,1);
plot(t,fsk');
xlabel('TIME');
ylabel('AMPLITUDE');
title('FREQUENCY SHIFT KEYING SIGNAL');

// GENERATION OF FSK SPECTRUM
frq= -fs/2:Rb/length(n):fs/2;
y1=fftshift(fft(fsk));
figure(2)
subplot(3,1,2)
plot(frq,abs(y1'));
xlabel('FREQUENCY',"Fontsize",4) ;
ylabel('AMPLITUDE',"Fontsize",4)
title ('FSK Spectrum',"Fontsize",4)
xgrid;

// Demodualation of FSK Signal
for j=1:length(t)
    if fsk(j)== carrier_1(j)
        demod(j)=1;
    else
        demod(j)=-1;
    end
end
figure(2);
subplot(3,1,3);
plot(t,demod');
h= gca();
h.data_bounds =[0,-1.5;length(n)/Rb,1.5]
xlabel('TIME');
ylabel('AMPLITUDE');
title('RECOVERED BINARY DATA');
xgrid;
