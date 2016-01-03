function s = sparser( input)
    bb = diff(input);
    bb(abs(bb)<0.0001)=0;
    bb = any(bb,3);
    bb = bb(:,2);
    s = input(bb==1,:);
end