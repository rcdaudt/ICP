load('dragon.mat');
a = pi/3;
b = 0;
g = 0;
tx = 0;
ty = 0;
tz = 0;
T = [cos(b)*cos(g),-cos(b)*sin(g),sin(b), tx;
 cos(a)*sin(g) + cos(g)*sin(a)*sin(b), cos(a)*cos(g) - sin(a)*sin(b)*sin(g), -cos(b)*sin(a), ty;
 sin(a)*sin(g) - cos(a)*cos(g)*sin(b), cos(g)*sin(a) + cos(a)*sin(b)*sin(g),  cos(a)*cos(b), tz;
 0,0,0,1];
dragon(:,4) = 1;
out = (T*dragon')';
save('dragonSource.mat', 'out');