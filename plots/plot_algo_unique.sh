if [ $# -eq 4 ]
then
## Récupération des variables passées en argument
algorithm=$1
n=$2
m=$3
k=$4

grep "$n $m" "$algorithm"_1000_100_2.txt > tmp/"$algorithm"_"$n"_"$m"_"$k".plot

## Lancement du script gnuplot
sed -i 's/ALGORITHM_/'"${algorithm}"'_/g' ~/stage_entropy/plots/plotscript.plot
sed -i 's/_N_/'"${n}"'/g' ~/stage_entropy/plots/plotscript.plot
sed -i 's/_M_/'"${m}"'/g' ~/stage_entropy/plots/plotscript.plot
cat ~/stage_entropy/plots/plotscript.plot | gnuplot 
sed -i 's/'"${algorithm}"'_/ALGORITHM_/g' ~/stage_entropy/plots/plotscript.plot
sed -i 's/'"${n}"'/_N_/g' ~/stage_entropy/plots/plotscript.plot
sed -i 's/'"${m}"'/_M_/g' ~/stage_entropy/plots/plotscript.plot

else
    echo "Veuillez entrer le nom de l'algorithme, n, m et k"
fi