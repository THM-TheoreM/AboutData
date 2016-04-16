clear;clc;close all;
train_x=TrainImageRead('C:\\Users\\chenming\\Desktop\\handwritten digits recognition\\TrainImage\\');
test_x=TestImageRead('C:\\Users\\chenming\\Desktop\\handwritten digits recognition\\TestImage\\');
%test_y is a 10000*10 matrix with test_y(i,j)=1 meaning the ith image labels j-1
label_test=loadMNISTLabels('t10k-labels.idx1-ubyte');
test_y=zeros(length(label_test),10);
for i=1:length(label_test)
    test_y(i,label_test(i)+1)=1;
end
%train_y is a 60000*10 matrix with trian_y(i,j)=1 meaning the ith image labels j-1
label_train=loadMNISTLabels('train-labels.idx1-ubyte');
train_y=zeros(length(label_train),10);
for i=1:length(label_train)
    train_y(i,label_train(i)+1)=1;
end

train_x = reshape(train_x',28,28,60000)/255;
test_x = reshape(test_x',28,28,10000)/255;
train_y = train_y';
test_y = test_y';