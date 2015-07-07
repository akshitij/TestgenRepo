set terminal png
set output 'comparison.png'

set xdata time
set timefmt "%S"
set xlabel "time"

set autoscale

set ylabel "highest seq number"
set format y "%s"

set title "seq number over time"
set key reverse Left outside
set grid

set style data linespoints

plot "Intra.txt" using 1:2 title "Intra", \
plot "Inter.txt"  using 1:2 title "Inter"
