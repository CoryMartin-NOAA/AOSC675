#!/usr/bin/env python
"""
Crude plotting script to test model output
C. Martin - 5/2015
"""
import matplotlib.pyplot as plt
import numpy as np

data = np.loadtxt('model_output.txt')

insol = data[:,1]
temp = data[:,2]
GPP = data[:,3]
Rh = data[:,4]
NPP = data[:,5]

plt.figure()
plt.plot(insol)
plt.title('Insolation')

plt.figure()
plt.plot(temp)
plt.title('Temperature')

plt.figure()
plt.plot(GPP)
plt.title('GPP')

plt.figure()
plt.plot(Rh)
plt.title('Rh')

plt.figure()
plt.plot(NPP)
plt.title('NPP')

plt.show()
