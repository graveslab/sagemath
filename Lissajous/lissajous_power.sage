fxn_lib = '/mnt/data/Repos/SageMath/Lissajous/libraries/lissajous.sage' # path to the library
attach fxn_lib

root = '/home/brandon/Desktop/lm/'
Vcap = data_import(fileName=root+'F0002CH1.CSV',fileSeparator=',',firstColumn=4) # series capacitor voltage trace
Vapp = data_import(fileName=root+'F0002CH2.CSV',fileSeparator=',',firstColumn=4) # applied voltage trace
windowSize = 10

Liss = create_lissajous(Vapp=Vapp,Vcap=Vcap,window=windowSize)
a = list_plot(Liss[0:1000],xmin=-4,xmax=4)
area = find_area(Liss[0:1000])
show('The area of the Lissajous figure is: ' + str(area))
show(a)
