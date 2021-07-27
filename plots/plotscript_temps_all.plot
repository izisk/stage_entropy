set terminal eps
set output "~/stage_entropy/plots/all_algorithms__N___M__2.eps"
set grid
set xlabel "Entropy"
set ylabel "Time"
plot 'tmp/naif__N___M__2.plot' using ($3):(($5)) w lines title "naif", 'tmp/ag__N___M__2.plot' using ($3):(($5)) w lines title "ag", 'tmp/aoso6__N___M__2.plot' using ($3):(($5)) w lines title "aoso6", 'tmp/hash8__N___M__2.plot' using ($3):(($5)) w lines title "hash8", 'tmp/bmh-sbndm__N___M__2.plot' using ($3):(($5)) w lines title "bmh-sbndm", 'tmp/fjs__N___M__2.plot' using ($3):(($5)) w lines title "fjs", 'tmp/fs__N___M__2.plot' using ($3):(($5)) w lines title "fs", 'tmp/kmp__N___M__2.plot' using ($3):(($5)) w lines title "kmp", 'tmp/sa__N___M__2.plot' using ($3):(($5)) w lines title "sa", 'tmp/tunedbm__N___M__2.plot' using ($3):(($5)) w lines title "tunedbm"


