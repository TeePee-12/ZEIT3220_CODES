%EMAG THT 4 Q5 Coax Cable Dimension Finder

a = 0.0000355% inner conductor radius
b = 0.0011731 % outer conductor inner radius

ln = log(b/a);

rhoa = 63.0e06;
rhob = 59.6e06;
rho  = (rhoa+rhob)/2;

f =43e09
w = 2*pi*f;
e = 2.6*8.85e-12;
mu= pi*4e-07;

C = 2*pi*e/ln;
L = (mu*ln)/(2*pi);
G = (2*pi*rho)/ln;

jwc = 1j*w*C
jwl = 1j*w*L

RS = sqrt((pi*f*mu)/rho);
R = (RS/(2*pi))*((1/a)+(1/b));
%R = (((sqrt((pi*f*mu)/rhoa))/(2*pi))*(1/a))+(((sqrt((pi*f*mu)/rhob))/(2*pi))*(1/b));
Ztop = R+(1j*w*L)
Zbot = G+(1j*w*C)
Z = sqrt(Ztop/Zbot)

ZEZ = sqrt(L/C)

alpha = sqrt(Ztop*Zbot)
alphanep2db = alpha/8.686

skindepth = 1/alpha


