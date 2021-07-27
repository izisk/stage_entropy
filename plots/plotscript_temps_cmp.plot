set terminal eps
set output "~/stage_entropy/plots/ALGORITHM__N___M__2.eps"
set grid
set xlabel "Entropy"
set ylabel "Number of comparisons divided by n*m"
set y2label "Time in microseconds"
plot "tmp/ALGORITHM__N___M__2.plot" using 3:($4/($1*$2)) w lines title "n=_N_ m=_M_" axis x1y1, "tmp/ALGORITHM__N___M__2.plot" using 3:($5*_M_**6) w lines notitle axis x1y2
