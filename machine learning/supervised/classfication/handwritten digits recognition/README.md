# handwritten digits recognition


- 对于手写字识别问题有GOOGLE提供的标准测试集MNIST，可以在下面这个公开的网站上下载数据：http://yann.lecun.com/exdb/mnist/

- 下载以后格式为idx3-ubyte和idx1-ubyte，MNIST DATABASE文件夹中提供了read_t10k_images_idx3_ubyte.m以及read_train_images_idx3_ubyte.m两个脚本文件将训练集和测试集中的图片变为bmp可视化格式，放入指定文件夹中，结果如TestImage文件夹和TrainImage文件夹所示

- loadMNISTLabels将t10k-labels.idx1-ubyte和train-labels.idx1-ubyte文件中对测试集和训练集的标签返回为一个向量

- TestImageRead.m以及TrainImageRead.m所有将bmp文件转化为灰度矩阵，每个灰度矩阵拉直后拼成一个N（文件数）*784点大矩阵

- LoadData.m将所有数据处理好放入test_x（image）,test_y（label）,train_x,trian_y中备用
 
- CNN文件夹来自于https://github.com/rasmusbergpalm/DeepLearnToolbox中CNN以及util文件夹

- train.m以及guess.m为仅有的两个新增文件，train.m通过训练集train_x,train_y调整cnn网络各参数，guess.m通过cnn网络各参数和输入的新的图片做分类预测

- mnist_uint8.mat为另一个已经存储好test_x（image）,test_y（label）,train_x,trian_y的数据文件，用load mnist_uint8;命令可直接调用

- 运行test_example_CNN.m文件可以进行样例数据的测试，画出平方误差函数图像