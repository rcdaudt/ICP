function s = superSparser( input, thresh)
    for i = 1:3
       [~,ind] = sort(input(:,i));
       input = input(ind,:);
       b = diff(input);
       b(abs(b)<thresh)=0;
       b = any(b,3);
       b = b(:,i);
       input = input(b==1,:);
    end
    s = input;
end