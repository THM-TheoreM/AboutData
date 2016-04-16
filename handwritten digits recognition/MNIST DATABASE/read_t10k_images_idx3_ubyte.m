% ���ص�ַ��http://yann.lecun.com/exdb/mnist/
% ���ڶ�ȡMNIST���ݼ���t10k-images.idx3-ubyte�ļ�������ת����bmp��ʽͼƬ�����
% �÷������г��򣬻ᵯ��ѡ�����ͼƬ�����ļ�t10k-labels.idx1-ubyte·���ĶԻ����
% ѡ�񱣴����ͼƬ·���ĶԻ���ѡ��·��������Զ�������ϣ��ڼ����������ʾ������ȡ�
% ͼƬ��TestImage_00001.bmp��TestImage_10000.bmp�ĸ�ʽ������ָ��·����10000���ļ�ռ�ÿռ�39M����
% �����������й����輸����ʱ�䡣
clear all;
clc;
%��ȡѵ��ͼƬ�����ļ�
[FileName,PathName] = uigetfile('*.*','ѡ�����ͼƬ�����ļ�t10k-images.idx3-ubyte');
TestFile = fullfile(PathName,FileName);
fid = fopen(TestFile,'r'); %fopen����������ĵĺ����������ļ�����r���������
a = fread(fid,16,'uint8'); %uint8��ʾ���޷���8λ������ʽ����������������ܹ�����16��8λ������ʽֵ��������ǰʮ��λ��˵����Ϣ�������ص�ַ����ҳ���Կ���������һλ����ʲô���塣����a������ȡ����Щ��Ϣ������¼�������������Ľ�������ȶ�����
MagicNum = ((a(1)*256+a(2))*256+a(3))*256+a(4); % ��һ��32 bit integer=2051
ImageNum = ((a(5)*256+a(6))*256+a(7))*256+a(8); % �ڶ���32 bit integer=number of images=10000
ImageRow = ((a(9)*256+a(10))*256+a(11))*256+a(12); % ������32 bit integer=number of rows=28
ImageCol = ((a(13)*256+a(14))*256+a(15))*256+a(16); % ���ĸ�32 bit integer=number of columns =28
%�ų�ѡ�������ļ�
if ((MagicNum~=2051)||(ImageNum~=10000)||(ImageRow~=28)||(ImageCol~=28))
    error('���� MNIST t10k-images.idx3-ubyte �ļ���');
    fclose(fid);    
    return;    
end
savedirectory = uigetdir('','ѡ�����ͼƬ·����');
h_w = waitbar(0,'���Ժ򣬴�����>>');
for i=1:ImageNum
    b = fread(fid,ImageRow*ImageCol,'uint8');   %fread����Ҳ�Ǻ��ĵĺ���֮һ��b��¼����һ��ͼ�����ݴ���ע�����ﻹ�Ǹ������ǿ������κζ��ߵġ�
    c = reshape(b,[ImageRow ImageCol]); %�������ˣ�reshape���¹��ɾ������ڰѴ�ת�������ˡ�������֪ͼƬ���Ǿ�������reshape�����ĻҶȾ�����Ǹ���д���ֵľ����ˡ�
    d = c'; %ת��һ�£���Ϊc�������Ǻ��ŵġ�����
    e = 255-d; %���ݻҶ����ۣ�0�Ǻ�ɫ��255�ǰ�ɫ��Ϊ��Ū�ɰ׵׺��־ͼ�����e
    e = uint8(e);
    savepath = fullfile(savedirectory,['TestImage_' num2str(i,'%d') '.bmp']);
    imwrite(e,savepath,'bmp'); %�����imwriteд��ͼƬ
    waitbar(i/ImageNum);
end
fclose(fid);
close(h_w);