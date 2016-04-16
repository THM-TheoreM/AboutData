function test_x=TestImageRead(FILEPATH)
test_x=zeros(10000,784);
h_w = waitbar(0,'processing...>>');
for i=1:10000
    I=255-imread([FILEPATH,'TestImage_',num2str(i),'.bmp']);%read out the gray level image while white=255, but we need white=255
    test_x(i,:)=I(:);
    waitbar(i/10000);
end
close(h_w);