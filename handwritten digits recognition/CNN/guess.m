function y=guess(cnn,x)
if length(size(x))==2%x should be a*b*c but if x is just one image instead of a set, x is a*b, then function cnnff may go wrong
    tmp=zeros(size(x,1),size(x,2),2);
    tmp(:,:,1)=x;
    tmp(:,:,2)=x;
    x=tmp;
    net = cnnff(cnn, x);
    [~, tmp] = max(net.o);
    y=tmp(1);
else
    net = cnnff(cnn, x);
    [~, y] = max(net.o);
end
y=y-1;