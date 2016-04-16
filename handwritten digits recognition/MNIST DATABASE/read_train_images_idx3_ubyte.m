% 下载地址：http://yann.lecun.com/exdb/mnist/
% 用于读取MNIST数据集中train-images.idx3-ubyte文件并将其转换成bmp格式图片输出。
% 用法：运行程序，会弹出选择测试图片数据文件train-images.idx3-ubyte路径的对话框和
% 选择保存测试图片路径的对话框，选择路径后程序自动运行完毕，期间进度条会显示处理进度。
% 图片以TrainImage_00001.bmp～TrainImage_60000.bmp的格式保存在指定路径，60000个文件占用空间234M。。
% 整个程序运行过程需几分钟时间。
clear all;
clc;
%读取训练图片数据文件
[FileName,PathName] = uigetfile('*.*','选择测试图片数据文件train-images.idx3-ubyte');
TestFile = fullfile(PathName,FileName);
fid = fopen(TestFile,'r'); %fopen（）是最核心的函数，导入文件，‘r’代表读入
a = fread(fid,16,'uint8'); %uint8表示以无符号8位整数形式读，所以这个命令总共读出16个8位整数形式值，而包的前十六位是说明信息，从下载地址的网页可以看到具体那一位代表什么意义。所以a变量提取出这些信息，并记录下来，方便后面的建立矩阵等动作。
MagicNum = ((a(1)*256+a(2))*256+a(3))*256+a(4); % 第一个32 bit integer=2051
ImageNum = ((a(5)*256+a(6))*256+a(7))*256+a(8); % 第一个32 bit integer=number of images=60000
ImageRow = ((a(9)*256+a(10))*256+a(11))*256+a(12); % 第三个32 bit integer=number of rows=28
ImageCol = ((a(13)*256+a(14))*256+a(15))*256+a(16); % 第四个32 bit integer=number of columns =28
%排除选择错误的文件
if ((MagicNum~=2051)||(ImageNum~=60000)||(ImageRow~=28)||(ImageCol~=28))
    error('不是 MNIST train-images.idx3-ubyte 文件！');
    fclose(fid);    
    return;    
end
savedirectory = uigetdir('','选择测试图片路径：');
h_w = waitbar(0,'请稍候，处理中>>');
for i=1:ImageNum
    b = fread(fid,ImageRow*ImageCol,'uint8');   %fread（）也是核心的函数之一，b记录下了一副图的数据串。注意这里还是个串，是看不出任何端倪的。
    c = reshape(b,[ImageRow ImageCol]); %亮点来了，reshape重新构成矩阵，终于把串转化过来了。众所周知图片就是矩阵，这里reshape出来的灰度矩阵就是该手写数字的矩阵了。
    d = c'; %转置一下，因为c的数字是横着的。。。
    e = 255-d; %根据灰度理论，0是黑色，255是白色，为了弄成白底黑字就加入了e
    e = uint8(e);
    savepath = fullfile(savedirectory,['TrainImage_' num2str(i,'%d') '.bmp']);
    imwrite(e,savepath,'bmp'); %最后用imwrite写出图片
    waitbar(i/ImageNum);
end
fclose(fid);
close(h_w);