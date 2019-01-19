x = -2:0.05:2;
y = x;
[xx , yy] = meshgrid(x,y);
zz = func(xx,yy);
figure,surf(xx,yy,zz)
mesh(xx,yy,zz);

a = -4:0.05:4;
s = a;
[aa , ss] = meshgrid(a,s);
dd = func(aa,ss);
figure,surf(aa,ss,dd)
mesh(aa,ss,dd);

q = -50:0.1:50;
w = q;
[qq , ww] = meshgrid(q,w);
ee = func(qq,ww);
figure,surf(qq,ww,ee)
mesh(qq,ww,ee);
shading interp
