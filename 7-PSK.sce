//Study Carrier Modulation Techniques using BPSK

clc
clear
close

n = input ('Enter the Random binary Input (Eg [1 1 0 0 1])=' );  // Random binary Input
fc = input ('Enter the carrier frequency fc=' );  //Carrier Frequency
phi = input ('Enter the phase shift=' );  //Phase Shift of Carrier
Rb = input ('Enter the Bit rate Rb=' );  //Bit rate of input data;
fs = 100*Rb;

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
carrier_1 = sin(2.*%pi*fc*t); // Carrier Frequency
subplot(3,1,2);
plot(t,carrier_1);
xlabel('TIME');
ylabel('AMPLITUDE');
title('CARRIER SIGNAL');
xgrid;

carrier_2 = sin(2.*%pi*fc*t + phi); // Phase Shifted Carrier Frequency
subplot(3,1,3);
plot(t,carrier_2);
xlabel('TIME');
ylabel('AMPLITUDE');
title('Phase Shifted CARRIER SIGNAL');
xgrid;

//PSK SIGNAL GENERATION
for j=1:length(t)
    if data(j)==1
        psk(j)= carrier_1(j);
    else
        psk(j)= carrier_2(j);
    end
end
figure(2);
subplot(3,1,1);
plot(t,psk');
xlabel('TIME');
ylabel('AMPLITUDE');
title('PHASE SHIFT KEYING SIGNAL');

// GENERATION OF PSK SPECTRUM
frq= -fs/2:Rb/length(n):fs/2;
y1=fftshift(fft(psk));
figure(2)
subplot(3,1,2)
plot(frq,abs(y1'));
xlabel('FREQUENCY',"Fontsize",4) ;
ylabel('AMPLITUDE',"Fontsize",4)
title ('PSK Spectrum',"Fontsize",4)
xgrid;

// Demodualation of PSK Signal
for j=1:length(t)
    if psk(j)== carrier_1(j)
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
