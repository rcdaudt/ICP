function out = transform( data, a, b, g, tx, ty, tz)
    T = [cos(b)*cos(g),-cos(b)*sin(g),sin(b), tx;
 cos(a)*sin(g) + cos(g)*sin(a)*sin(b), cos(a)*cos(g) - sin(a)*sin(b)*sin(g), -cos(b)*sin(a), ty;
 sin(a)*sin(g) - cos(a)*cos(g)*sin(b), cos(g)*sin(a) + cos(a)*sin(b)*sin(g),  cos(a)*cos(b), tz;
 0,0,0,1];
    out = (T*data')';
end

% syms a b g tx ty tz
%     x = [
%         1, 0, 0, 0;
%         0, cos(a), -sin(a), 0;
%         0, sin(a), cos(a), 0;
%         0, 0, 0, 1
%         ];
%     y = [
%         cos(b), 0, sin(b), 0;
%         0, 1, 0, 0;
%         -sin(b), 0, cos(b), 0;
%         0, 0, 0, 1
%         ];
%     z = [
%         cos(g), -sin(g), 0, 0;
%         sin(g), cos(g), 0, 0;
%         0, 0, 1, 0;
%         0, 0, 0, 1
%         ];
%     tr = [
%         0, 0, 0, tx;
%         0, 0, 0, ty;
%         0, 0, 0, tz;
%         0, 0, 0, 1
%         ];
%     R = x*y*z+tr
    %end

