function index = findClosest(point,data)
    s = size(data,1);
    dist = zeros(s,1);
    for i = 1:s
        dist(i) = norm(point-data(i,:));
    end
    minimum = min(dist);
    index = find(dist == minimum,1,'first');
end