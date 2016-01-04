function [TT] = levMarq(q,p)
    Rx = @(a)[1     0       0        0;
              0     cos(a)  -sin(a), 0;
              0     sin(a)  cos(a),  0;
              0,    0,      0,       1];

    Ry = @(b)[cos(b)    0   sin(b), 0;
              0         1   0,      0;
              -sin(b)   0   cos(b), 0
              0,        0,  0,      1];

    Rz = @(g)[cos(g)    -sin(g) 0, 0;
              sin(g)    cos(g)  0, 0;
              0         0       1, 0;
              0,        0,      0, 1];

    Rot = @(x)Rx(x(1))*Ry(x(2))*Rz(x(3));
    myfun = @(x,xdata)Rot(x(1:3))*xdata+repmat(x(4:7),1,length(xdata));


    options = optimset('Algorithm', 'levenberg-marquardt', 'Display', 'off');
    x = lsqcurvefit(myfun, zeros(7,1), p, q, [], [], options);
    R = Rot(x(1:3));
    T = x(4:7);
    TT = R; TT(1:3, 4) = T(1:3);
