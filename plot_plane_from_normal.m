point = [0,0,0];
normal = [0.8644,0.0085,0.5028];

%# a plane is a*x+b*y+c*z+d=0
%# [a,b,c] is the normal. Thus, we have to calculate
%# d and we're set
d = -point*normal'; %'# dot product for less typing

%# create x,y
[xx,yy]=ndgrid(1:10,1:10);

%# calculate corresponding z
z = (-normal(1)*xx - normal(2)*yy - d)/normal(3);

%# plot the surface
figure
surf(xx,yy,z,normal,"FaceColor","red")
hold on;
point = [0,0,1];
normal = [0,0,1];

%# a plane is a*x+b*y+c*z+d=0
%# [a,b,c] is the normal. Thus, we have to calculate
%# d and we're set
d = -point*normal'; %'# dot product for less typing

%# create x,y
[xx,yy]=ndgrid(1:10,1:10);

%# calculate corresponding z
z = (-normal(1)*xx - normal(2)*yy - d)/normal(3);

%# plot the surface
surf(xx,yy,z,normal,"FaceColor","green")
hold on

point = [0,0,-1];
normal = [0,0,1];
d = -point*normal';
[xx,yy]=ndgrid(1:10,1:10);
z = (-normal(1)*xx - normal(2)*yy - d)/normal(3);
surf(xx,yy,z,normal,"FaceColor","green")
hold on
point = [0,0,-3];
normal = [0,0,1];
d = -point*normal';
[xx,yy]=ndgrid(1:10,1:10);
z = (-normal(1)*xx - normal(2)*yy - d)/normal(3);
surf(xx,yy,z,normal,"FaceColor","green")
hold on
point = [0,0,-6];
normal = [0,0,1];
d = -point*normal';
[xx,yy]=ndgrid(1:10,1:10);
z = (-normal(1)*xx - normal(2)*yy - d)/normal(3);
surf(xx,yy,z,normal,"FaceColor","green")
hold on
point = [0,0,-9];
normal = [0,0,1];
d = -point*normal';
[xx,yy]=ndgrid(1:10,1:10);
z = (-normal(1)*xx - normal(2)*yy - d)/normal(3);
surf(xx,yy,z,normal,"FaceColor","green")
hold on
point = [0,0,-12];
normal = [0,0,1];
d = -point*normal';
[xx,yy]=ndgrid(1:10,1:10);
z = (-normal(1)*xx - normal(2)*yy - d)/normal(3);
surf(xx,yy,z,normal,"FaceColor","green")
hold off
xlabel('X axis')
ylabel ('Y Axis')
zlabel('Z Axis')
legend('stationary plane [NOT TO SCALE]','Propigating wavefronts','Location','northoutside')

