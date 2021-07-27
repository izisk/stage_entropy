n=$1
m=$2
k=$3

script=~/stage_entropy/plots/plotscript_temps_all.plot

for fichier in *_1000_100_2.txt; do
    if [[ ! $fichier =~ "papi" ]]; then
	algo=`cut -d'_' -f1 <<< $fichier`
	grep "$n $m" $fichier > tmp/"$algo"_"$n"_"$m"_"$k".plot		
    fi
done
sed -i 's/_N_/'"${n}"'/g' $script
sed -i 's/_M_/'"${m}"'/g' $script
cat $script | gnuplot 
sed -i 's/'"${n}"'/_N_/g' $script
sed -i 's/'"${m}"'/_M_/g' $script

echo "Suppression des fichiers dans le répertoire tmp"
rm -f tmp/*
