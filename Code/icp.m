%[ref, src] = gen();
ref = load('bun000_dec1.mat');
ref = ref.bun000_dec1;
ref(:, 4) = 1;

src = load('../ICP/Data/bun045.mat');
src = src.bun045;
src(:, 4) = 1;

%%75 % data lost
% for i = 1:30000
%    src(uint32(length(src)+rand())-1,:)=[]; 
% end

%%just the center
% src(1:10000,:)=[];
% src(length(src)-10000:length(src),:)=[];

%%small overlap
% ref(1:15000,:) = [];
% src(length(src)-15000:length(src),:)=[];

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
    TT = levMarq(m', s');
    src = (TT*src')';
    meanError = (2*meanError + error)/3;
    if abs(meanError - error) < eps
        break;
    end;
end;
delete(pl);
scatter3(src(:,1), src(:,2), src(:,3), '.r');
toc
