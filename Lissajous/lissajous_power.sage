fxn_lib = '/mnt/data/Repos/SageMath/Lissajous/libraries/lissajous.sage'
attach fxn_lib

window=5
root = '/home/brandon/Desktop/lm/'
CH1 = data_import(root+'F0002CH1.CSV',',')
CH2 = data_import(root+'F0002CH2.CSV',',')
windowSize = 10

Liss = create_lissajous(Vapp=CH1,Vcap=CH2,window=windowSize)
a = list_plot(Liss[0:1000],xmin=-4,xmax=4)
area = find_area(Liss[0:1000])
show(area)
show(a)
