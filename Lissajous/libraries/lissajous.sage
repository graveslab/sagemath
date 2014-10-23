### Python style guide: http://legacy.python.org/dev/peps/pep-0008/
reset()
from numpy import convolve, ones

def moving_average(interval, window_size):
    """Finds the moving average of a dataset over a window size."""
    # algorithm via http://stackoverflow.com/questions/11352047/finding-moving-average-from-data-points-in-python
    window= ones(int(window_size))/float(window_size)
    return convolve(interval, window, 'same')

def data_import(fileName,fileSeparator,firstColumn=1):
    """Imports data from .csv and puts it into an array."""
    dataFile = open(fileName, 'r')
    line = dataFile.readline()
    holdingList = []
    while(line != ''): 
        holdingLine = tuple(float(item.strip()) for item in line.split(',')[firstColumn-1:firstColumn+1])
        holdingList.append(holdingLine)
        line = dataFile.readline()
    return holdingList

def data_pasted(dataString,fileSeparator,firstColumn=1):
    """Prepares data that has been copied and pasted into the worksheet from a CSV file."""
    dataList = dataString.splitlines()
    dataReturn = []
    for line in dataList:
        dataLine = tuple(float(item.strip()) for item in line.split(',')[firstColumn-1:firstColumn+1])
        if len(dataLine)!=0: dataReturn.append(dataLine)
    return dataReturn

def find_area(array):
    """Find the array of a polygon defined as a set of Cartesian points in an array."""
    # algorithm via http://www.arachnoid.com/area_irregular_polygon/index.html
    a = 0
    ox,oy = array[0]
    for x,y in array[1:]:
        a += (x*oy-y*ox)
        ox,oy = x,y
    return abs(a/2)

def create_lissajous(Vapp,Vcap,window=1):
    """Generates a Lissajous figure from the applied and capacitor voltage oscilloscope traces."""
    x=[Vapp[i][1] for i in range(0,len(Vapp))]
    y=[Vcap[i][1] for i in range(0,len(Vcap))]
    if window!= 1:
        x = moving_average(x,window)
        y = moving_average(y,window)
    Liss = []
    for i in range(0,len(Vapp)):
        Liss.append((x[i],y[i]))
    return Liss
