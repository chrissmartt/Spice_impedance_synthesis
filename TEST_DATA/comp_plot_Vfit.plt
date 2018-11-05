set xlabel "Frequency (Hz)"
set ylabel "Function value"

set logscale x

set title "Comparison of original data and Vector Fit function"
plot "function_data.fout" u 1:2 title "Re{f}" w p ,\
     "function_data.fout" u 1:3 title "Im{f}" w p ,\
     "function_data.fout" u 1:5 title "Re{Vector_fit}" w l ,\
     "function_data.fout" u 1:6 title "Im{Vector_fit}" w l
pause -1

set autoscale x
set autoscale y
set title "Compare rational function and Vector Fit function"
plot "Rational_funtion.fout" u 1:2 title "Re{H_rational}" w p,\
     "Rational_funtion.fout" u 1:3 title "Im{H_rational}" w p,\
     "function_data.fout" u 1:5 title "Re{Vector_fit}" w l ,\
     "function_data.fout" u 1:6 title "Im{Vector_fit}" w l   
pause -1

set autoscale x
set autoscale y
set title "Compare rational function fit and spice result"
plot "Rational_funtion.fout" u 1:2 title "Re{H_rational}" w p,\
     "Rational_funtion.fout" u 1:3 title "Im{H_rational}" w p,\
     "spice_result.fout" u 2:3 title "Re{Spice_model_result}" w l,\
     "spice_result.fout" u 2:4 title "Im{Spice_model_result}" w l
pause -1

set autoscale x
set autoscale y
set title "Compare input function data and spice result"
plot"function_data.fout" u 1:2 title "Re{f}" w p ,\
     "function_data.fout" u 1:3 title "Im{f}" w p ,\
     "spice_result.fout" u 2:3 title "Re{Spice_model_result}" w l,\
     "spice_result.fout" u 2:4 title "Im{Spice_model_result}" w l
pause -1
