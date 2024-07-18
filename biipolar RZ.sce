//Program Ti t l e : Codes − 1( Bipo l a r RZ)
clear ;
close ;
clc ;
clf ;
x =[1 0 1 1 0 1]; //Data Stream
z =0; // S t a r t i n g v a l u e on x a x i s
ob =-1;
for i =1:length (x)
t=[z:1:z+1]; // Se t o f x c o r d i n a t e s f o r c u r r e n t b i t d u r a t i o n
subplot (2 ,1 ,1)
a= gca ();
a. data_bounds =[0,-1.5;length(x),1.5];
a.grid =[1,-1]
//title(’Data’)
plot (t,x(i)) // Pl o t c u r r e n t data b i t
subplot (2 ,1 ,2)
a= gca ();
a. data_bounds =[0,-1.5;length(x),1.5];
a. grid =[1 , -1]
if(x(i)==0)
    t=[z:1:z+1];
plot (t,0) // Pl o t 0 f o r c u r r e n t b i t d u r a t i o n
else
 t=[z:0.5:z+0.5] // Pl o t r ang e on x−a x i s  f i r s t h a l f b i t p e r i o d )
ob=-ob // I n v e r t p r e v i o u s o /p b i t v a l u e
plot (t,ob) // Pl o t o /p b i t
t=[z+0.5:0.5:z+1] // Pl o t r ang e on x−a x i s ( s e c ond h a l f b i t p e r i o d )
plot (t,0)
end
z=z+1;
end
