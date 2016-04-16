function labels = loadMNISTLabels(filename)
%loadMNISTLabels returns a [number of MNIST images]x1 matrix containing
%the labels for the MNIST images

% ���ص�ַ��http://yann.lecun.com/exdb/mnist/
% ���ڶ�ȡMNIST���ݼ���t10k-labels.idx1-ubyte��train-labels.idx1-ubyte�ļ�������ת����һ��label����

%���ļ�
fp = fopen(filename, 'rb');
assert(fp ~= -1, ['Could not open ', filename, '']);

%��һ��˵����Ϣ32 bit integer=2051
magic = fread(fp, 1, 'int32', 0, 'ieee-be');
assert(magic == 2049, ['Bad magic number in ', filename, '']);

%�ڶ���˵����Ϣ32 bit integer=number of images
numLabels = fread(fp, 1, 'int32', 0, 'ieee-be');

%��ʣ�µ�label��Ϣ��������label����=�ڶ���˵����Ϣ�и���������
labels = fread(fp, inf, 'unsigned char');
assert(size(labels,1) == numLabels, 'Mismatch in label count');
 
fclose(fp);
 
end