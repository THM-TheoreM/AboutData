# handwritten digits recognition


- ������д��ʶ��������GOOGLE�ṩ�ı�׼���Լ�MNIST�����������������������վ���������ݣ�http://yann.lecun.com/exdb/mnist/

- �����Ժ��ʽΪidx3-ubyte��idx1-ubyte��MNIST DATABASE�ļ������ṩ��read_t10k_images_idx3_ubyte.m�Լ�read_train_images_idx3_ubyte.m�����ű��ļ���ѵ�����Ͳ��Լ��е�ͼƬ��Ϊbmp���ӻ���ʽ������ָ���ļ����У������TestImage�ļ��к�TrainImage�ļ�����ʾ

- loadMNISTLabels��t10k-labels.idx1-ubyte��train-labels.idx1-ubyte�ļ��жԲ��Լ���ѵ�����ı�ǩ����Ϊһ������

- TestImageRead.m�Լ�TrainImageRead.m���н�bmp�ļ�ת��Ϊ�ҶȾ���ÿ���ҶȾ�����ֱ��ƴ��һ��N���ļ�����*784������

- LoadData.m���������ݴ���÷���test_x��image��,test_y��label��,train_x,trian_y�б���
 
- CNN�ļ���������https://github.com/rasmusbergpalm/DeepLearnToolbox��CNN�Լ�util�ļ���

- train.m�Լ�guess.mΪ���е����������ļ���train.mͨ��ѵ����train_x,train_y����cnn�����������guess.mͨ��cnn�����������������µ�ͼƬ������Ԥ��

- mnist_uint8.matΪ��һ���Ѿ��洢��test_x��image��,test_y��label��,train_x,trian_y�������ļ�����load mnist_uint8;�����ֱ�ӵ���

- ����test_example_CNN.m�ļ����Խ����������ݵĲ��ԣ�����ƽ������ͼ��