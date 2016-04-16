function labels = loadMNISTLabels(filename)
%loadMNISTLabels returns a [number of MNIST images]x1 matrix containing
%the labels for the MNIST images

% 下载地址：http://yann.lecun.com/exdb/mnist/
% 用于读取MNIST数据集中t10k-labels.idx1-ubyte和train-labels.idx1-ubyte文件并将其转换成一个label向量

%打开文件
fp = fopen(filename, 'rb');
assert(fp ~= -1, ['Could not open ', filename, '']);

%第一个说明信息32 bit integer=2051
magic = fread(fp, 1, 'int32', 0, 'ieee-be');
assert(magic == 2049, ['Bad magic number in ', filename, '']);

%第二个说明信息32 bit integer=number of images
numLabels = fread(fp, 1, 'int32', 0, 'ieee-be');

%将剩下的label信息都读掉，label长度=第二个说明信息中给出的数字
labels = fread(fp, inf, 'unsigned char');
assert(size(labels,1) == numLabels, 'Mismatch in label count');
 
fclose(fp);
 
end