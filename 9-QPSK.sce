clear all ;
clc ;
close ;
T =2; // One symbol p e r i o d
t = 0:0.01: T /2; // Sampl ing Mat r ix f o r h a l f symbol period

f =1; // Ca r r i e r f r e q u e n c y ( c y c l e s pe r b i t p e r i o d )
// I =[0 0 1 1 0 0 1 1 ] ; // data s t r eam
I =[0 0 0 1 1 0 1 1]; // data s t r eam g i v i n g d i b i t
// Po l a r NRZ Conve r t e r
I_PNRZ = [] // empty mat r ix f o r Po l a r NRZ data
for n = 1: length (I)
if I(n)== 0 then
I_PNRZ = [I_PNRZ , -1]
else
I_PNRZ = [I_PNRZ , 1]
end
end
I_Carrier = sqrt (2/T)* cos (2* %pi *f*t); // In phas e c a r r i e r
Q_Carrier = sqrt (2/T)* sin (2* %pi *f*t); // Quadratur e phas e c a r r i e r

// Gene r a t i on o f OQPSK Waveform
z =0; // S t a r t i n g p o i n t o f p l o t on x−a x i s
subplot (3 ,1 ,1) // I−PSK Pl o t
a= gca ();
a. data_bounds =[0,-1.5;length(I_PNRZ),1.5];
//a. x_location =”oigin”;
a. grid =[1 ,1];
//title ( ’I−Data and I−PSK’ )
plot ((t+z),I_Carrier * I_PNRZ (1)); //I C a r r i e r ∗ F i r s t b i t ( I Balanc e Modulator )
plot ((t+z),I_PNRZ (1) ); // F i r s t b i tData f o r r e f e r e n c e
// xpaus e ( 2 0 0 0 0 0 0 ) ; / / Delay f o r o b s e r v a t i o n
z=z+1; //Move s t a r t i n g p o i n t o f p l o t on x−a x i s by 1 b i t ( h a l f symbol ) p e r i o d
for n =2:1: length ( I_PNRZ )
if modulo (n ,2) ==0 then //Check f o r odd−even b i t
I_Bit = I_PNRZ (n -1) // s e t I b i t as p r e v i o u s b i t
Q_Bit = I_PNRZ (n) // s e t Q b i t as c u r r e n t b i t
else
I_Bit = I_PNRZ (n) // s e t I b i t as c u r r e n t b i t
Q_Bit = I_PNRZ (n -1) // s e t Q b i t as p r e v i o u s b i t
end
subplot (3 ,1 ,1) // I−PSK Pl o t
a= gca ();
a. data_bounds =[0,-1.5;length( I_PNRZ ),1.5];
//a. x_location =”oigin”;
a. grid =[1 ,1];
//title ( ’ I−Data,I−PSK ’ )
plot ((t+z),I_Carrier * I_Bit ); // I C a r r i e r ∗ Even b i t ( I Balanc e Modulator )
plot ((t+z),I_Bit); // I Data f o r r e f e r e n c e
subplot (3 ,1 ,2) //Q−PSK Pl o t
a= gca ();
a. data_bounds =[0,-1.5;length(I_PNRZ),1.5];
//a. x_location =”origin”;
a. grid =[1 ,1];
//title (’Q−PSK’)
plot ((t+z),Q_Carrier * Q_Bit ); // Q Ca r r i e r∗ Odd b i t (Q Balanc e Modulator )
plot ((t+z),Q_Bit ); //Q Data f o r r e f e r e n c e
subplot (3 ,1 ,3) //QPSK Pl o t
a= gca ();
a. data_bounds =[0,-1.5;length(I_PNRZ ),1.5];
//a. x_location =”oigin”;
a. grid =[1 ,1];
//title ( 'OQPSK and I−Ca r r i e r’ )
plot ((t+z) ,( I_Carrier * I_Bit )+( Q_Carrier *Q_Bit )); // I−PSK + Q−PSK ( Adder )
plot ((t+z),I_Carrier); // I Ca r r i e r f o r r e f e r e n c e
z=z+1; //Move s t a r t i n g p o i n t o f p l o t on x−a x i s by 1 b i t ( h a l f symbol ) p e r i od

// xpaus e ( 2 0 0 0 0 0 0 ) ; / / Delay f o r o b s e r v a t i o n
 end
