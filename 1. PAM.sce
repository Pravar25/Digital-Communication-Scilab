clc ;
clear ;
close ;
fm= input('Enter the message signal frequency =' );
fc= input('Eneter the carrier signal freqency (fc>>>fm) =' );
am= input('Enter the message signal amplitude =' );
ac= input('Enter the carrier signal amplitude =' );
fs =100*fc;
t =0:1/fs:2;
p= length(t);
// Message Signal Generation
msg =am+am*sin(2*%pi*fm*t);
figure(1);
subplot(3,1,1);
plot(t,msg);
xlabel('time');
ylabel('amplitude')
title('Message Signal');

// Carrier Signal generation
carrier =ac+ac*squarewave(2*%pi*fc*t);
subplot (3,1,2);
plot(t,carrier);
h= gca();
h.data_bounds =[0,-1;2,3*ac]
xlabel('time');
ylabel('amplitude')
title('Carrier Signal');
// Generation of PAM Signal
pam_mod =msg .* carrier ;
subplot(3,1,3);
plot (t,pam_mod);
xlabel('time');
ylabel('amplitude')
title('Pulse Amplitude Modulated Signal');
// Demodulation of PAM Signal
demod = pam_mod.*carrier ;
k= abs(fft(demod));
filt = [ones(1,3*fm),zeros(1,p-3*fm)];
out =k.*filt ;
figure(2)
subplot(3,1,1);
plot(t,ifft(out));
xlabel('TIME');
ylabel('AMPLITUDE');
title('Demodulated Message')
