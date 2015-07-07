set border linewidth 1.5
set style line 1 lc rgb '#0060ad' lt 1 lw 2 pt 7 ps 1.5 # --- blue
set style line 2 lc rgb '#dd181f' lt 1 lw 2 pt 5 ps 1.5 # --- red

unset key

set ytics 1
set tics scale 1

set xrange [0:100]
set yrange [0:100]

plot 'inter.dat' index 0 with linespoints ls 1
