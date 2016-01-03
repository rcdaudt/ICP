function [ d1, d2 ] = gen()
    t = 0:pi/10:2*pi;
    [x, y, z] = cylinder(2+cos(t));%cylinder();
    x = reshape(x, 1, size(x,1)*size(x,2));
    y = reshape(y, 1, size(y,1)*size(y,2));
    z = reshape(z, 1, size(z,1)*size(z,2));
    z = z * 10;
%     x = [x(1,:),x(2,:)];
%     y = [y(1,:),y(2,:)];
%     z = [z(1,:),z(2,:)];
    d1(:,1) = x; d1(:,2) = y; d1(:,3) = z; d1(:,4) = 1;
    %d2 = transform(d1, pi/18, pi/10, pi/8, 0.3, 0.5, 0.4);
    d2 = transform(d1, pi/18, pi/10, pi/8, 10, 0.5, 0.4);
      figure, scatter3(d1(:,1), d1(:,2), d1(:,3), 'b'), hold on;
      scatter3(d2(:,1), d2(:,2), d2(:,3), '.g');
end