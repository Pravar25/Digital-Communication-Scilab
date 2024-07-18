clc ;
close ;
clear;
fs =100;
t =0:1/ fs :1;

//GENERATION OF 3 MESSAGE SIGNALS FOR MULTIPLEXING

// Message Signal 1
message_1 = 2*sin (2*%pi*3*t) ;  // Sine signal of frequency 3 hz
figure(1)
subplot(3,1,1)
plot2d3(t,message_1);
xlabel('TIME');
ylabel('AMPLITUDE');
title('MESSAGE SIGNAL1 (SINE WAVE') ;

// Message Signal 2
message_2 = 1*squarewave(2*%pi*3*t); // Square wave signal of frequency 3 hz
subplot(3,1,2)
plot2d3(t,message_2);
xlabel('TIME') ;
ylabel('AMPLITUDE');
title('MESSAGE SIGNAL 2 (SQUAREWAVE)');

// Message Signal 3
message_3 = 3*cos (2*%pi*3*t) // Cosine signal of frequency 3 hz
subplot(3,1,3)
plot2d3(t,message_3);
xlabel('TIME');
ylabel('AMPLITUDE');
title('MESSAGE SIGNAL 3 (COSINE WAVE)');

// GENERATIONN OF TIME DIVISION MULTIPLEXED SIGNAL
tdm =0;
j =1;
for i =1:3:3*length(t)
tdm(i) = message_1(j);
i = i +1;
tdm(i) = message_2(j);
i = i +1;
tdm(i) = message_3(j);
j = j +1;
end
figure(2)
subplot(2,1,1)
plot2d3(tdm)
xlabel('TIME') ;
ylabel('AMPLITUDE');
title('TIME DIVISION MULTIPLEXED SIGNAL');

// DEMULTIPLEXING OF TDM SIGNAL
n =1;
for k =1:1:length(t)
    m3(k) = tdm(n);
    n = n +1;
    m4(k) = tdm(n);
    n = n +1;
    m5(k) = tdm(n);
    n = n +1;
end
figure(3)
subplot(3,1,1)
plot2d3(m3)
xlabel('TIME');
ylabel('AMPLITUDE');
title('DEMUX MESSAGE SIGNAL 1 (SINE WAVE)');
subplot(3,1,2)
plot2d3(m4)
xlabel('TIME ');
ylabel('AMPLITUDE');
title('DEMUX MESSAGE SIGNAL 2 (SQUAREWAVE)');
subplot(3,1,3)
plot2d3(m5)
xlabel('TIME ');
ylabel('AMPLITUDE');
title('DEMUX MESSAGE SIGNAL 3 (COSINE WAVE)');
