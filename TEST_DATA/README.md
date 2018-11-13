This directory contains the scripts required to run the vector fit process
and then the network synthesis process so that we can produce Spice subcircuit
models which reproduce the complex imepdance data provided as input.

The script spice_impedance_synthesis runs the vector fit process with a given model order
and then the network synthesis process to produce a Spice circuit model. The Spice circuit model
is run using ngspice to determine the complex impedance produced by the Spice model.

The comparison between the input data and the vector fit
model data is plotted, then the comparison between the Spice model data 

Example:
The file CAPACITOR_Z_measured_plus_LF_model.CSV contains complex impedance data for
a capacitor from 10Hz to 3GHz. This is a combination of measured data from a VNA (300kHz to 3GHz) plus an extrapolation to low frequency assuming the impedance takes the form Z=R+1/(jwC).

Run the test case with

spice_impedance_synthesis CAPACITOR_Z_measured_plus_LF_model.CSV 6
