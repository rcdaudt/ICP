function T = ICP(data1,data2)
    %%% ICP generates transformation T that maps data1 to data2
    
    % Size of data1
    N = size(data1,1);
    
    % Initialise transformation
    T = [0 0 0 0 0 0]; % TODO: change this to identity transformation
    
    % Calculation parameters
    precision = 0.01; % Good precision?
    d_max = 0.1; % Good value?
    max_it = 100;
    
    % Calculation variables
    T_prev = T + 1;
    counter = 0;
    mi = zeros(N,1);
    wi = zeros(N,1);
    
    while norm(T-T_prev)>precision && counter>max_it
        for i = 1:N
            % Transform point
            currentPoint = applyTransformation(data(i,:),T); %TODO: applyTransformation
            indices(i) = findClosest(currentPoint,data2);
            dist = norm(currentPoint-data2(indices(i),:));
            if dist <= d_max
                w(i) = 1;
            else
                w(i) = 0;
            end
        end
        
        % TODO: Minimize T here
        
        counter = counter+1;
    end
%     counter
end