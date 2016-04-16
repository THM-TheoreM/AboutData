function train_x=TrainImageRead(FILEPATH)
train_x=zeros(60000,784);
h_w = waitbar(0,'processing...>>');
for i=1:60000
    I=255-imread([FILEPATH,'TrainImage_',num2str(i),'.bmp']);%read out the gray level image while white=255, but we need white=255
    train_x(i,:)=I(:);
    waitbar(i/60000);
end
close(h_w);