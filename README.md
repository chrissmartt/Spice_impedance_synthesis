# Spice_impedance_synthesis
Synthesis of spice sub-circuits from complex impedance data in the frequency domain

This project contains a script to tie together the Vector fit process
(https://github.com/chrissmartt/vector_fit) and the 
network synthesis process (https://github.com/chrissmartt/network_synthesis) to 
give the capability of developing Spice sub-circuit models which reproduce 
complex frequency domain impedance data for one port devices.

A typical application would be developing high frequency models of real components 
based on measured impedance data. These models then include the parasitic elements 
which represent the component behaviour at frequencies beyond the range for which 
they can be considered to be 'ideal' components. 
