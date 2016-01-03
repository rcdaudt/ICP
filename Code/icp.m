%[ref, src] = gen();
ref = load('../Data/bun000_dec1.mat');
ref = ref.bun000_dec1;
ref(:, 4) = 1;

src = load('../Data/bun045.mat');
src = src.bun045;
src(:, 4) = 1;

scatter3(ref(:,1), ref(:,2), ref(:,3), 'b'), hold on;
pl = scatter3(src(:,1), src(:,2), src(:,3), '.r');

n = size(src, 1);
count = 0;
k = waitforbuttonpress;
error = Inf;
meanError = 0;
eps = 0.00001;
tic
while 1
    count = count + 1;
    m = zeros(n, 4);
    [ind, dist] = knnsearch(ref, src, 'NSMethod', 'kdtree');
    m = ref(ind,:);
    error = sum(dist);
    fprintf('iteration: %d | Error: %.5f\n', count, error);
    dmax = 2*median(dist);
    weight = (dist < dmax);
    m(weight == 0, :) = [];
    s = src(weight ~= 0, :);
    [R, T] = eq_lmaPoint(m(:,1:3)', s(:,1:3)');
    TT = [R, T];
    TT = [TT; [0, 0, 0, 1]];
    src = (TT*src')';
    meanError = (2*meanError + error)/3;
    if abs(meanError - error) < eps
        break;
    end;
end;
delete(pl);
scatter3(src(:,1), src(:,2), src(:,3), '.r');
toc
