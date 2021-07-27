n=$1
m=$2
k=$3


for fichier in *_1000_100_2.txt; do
    if [[ ! $fichier =~ "papi" ]]; then
	algo=`cut -d'_' -f1 <<< $fichier`
	~/stage_entropy/plots/plot_algo_unique.sh $algo $1 $2 $3
    fi
done
