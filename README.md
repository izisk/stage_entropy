# stage_entropy

## Experimental study on the exact string matching problem via Shannon entropy

The exact string match problem consists in finding all occurrences of a given pattern of size m in a text of size n based on an alphabet of size k.

In this study we explore a total of 24 algorithms. 
They are : naif_xp, kmp, kmp2, ag, aoso2, aoso6, bmh-sbndm, bndmq4, ebom, fjs, fs, fsbndm, graspm, hash3, hash5, hash8, kbndm, lbndm, sa, sbndm-bmh, sbndmq4, ssef, tunedbm and tvsbs. naif_xp and kmp are implemented in text_algorithm.c. The rest are downloaded from https://github.com/smart-tool/smart/releases to algos.
For each one we examine its time, number of comparisons, number of total instructions executed and number of conditional branch instructions mispredicted depending on entropy.

We selected the algorithms based on Simone Faro nd Thierry Lecroq paper, "The exact String Matching Problem: a Comprehensive Experimental Evaluation". The naif_xp algorithm can be considered as the control one. 


### 1st type of benchmark : 
Considered files : text/benckmarks.c, text/naif_xp.c, text/kmp.c, text/benckmarks_papi.c, text/naif_xp_papi.c, text/kmp_papi.c
For each benchmark we have a random distribution generated based on the considered entropy as well as a text and pattern generated based on that distribution. The text_size goes from 200 to the text_size given in argument by step of 100. For each text_size we have the pattern_size going from 10 to the pattern_size given in argument by step of 10. For each pattern_size we have the target (entropy level) going from 0.001 to log2 of alphabet_size (also given in argument) by step of 0.01. For each target we make 10000 experiments. The end results of the measures are means of the 10000 experiments. 
Note : the distribution changes every 100 experiments.

To evaluate an algorithm :
1. compile by taping this in terminal :
    make name_algorithm 
2. execute by taping this in terminal :
    ./name_algorithm text_size pattern_size alphabet_size

As resultat you get :
    text_size pattern_size target nb_comparison time

To get the number of total instructions executed and number of conditional branch instructions, do the same steps by replacing name_algorithm with name_algorithm**_papi**.
As result you get :
    text_size pattern_size target nb_total_instructions_executed nb_conditional_branch_instructions


### 2nd type of benchmark :
Considered files : text/benckmarks_dist.c, text/naif_xp_dist.c, text/kmp_dist.c, text/benckmarks_papi_dist.c, text/naif_xp_papi_dist.c, text/kmp_papi_dist.c

The only difference with the first type is that the pattern and the text have each their own distribution that changes every experiment.

To evaluate an algorithm use the same steps by adding "**_dist**" to name_algorithm or name_algorithm_papi. 


### 3rd type of benchmark :
Considered files : Textes/benckmarks_langnat.c, Textes/naif_xp_langnat.c, Textes/kmp_langnat.c, Textes/benckmarks_papi_langnat.c, Textes/naif_xp_papi_langnat.c, Textes/kmp_papi_langnat.c

In this case we evaluate the algorithms on some example of natural language presented a few txt files.
The files are bible.txt (The _Bible_ in French), ch21.txt (The DNA sequence of the 21st human chromosome), coran.txt (The _Coran_ in French), ecoli.txt (The DNA sequence of the bacteria Escherichia coli), shakespeare.txt (_Hamlet_ by Shakespeare in English) and tdm.txt (_Le_ _tour_ _du_ _monde_ _en_ _quatre_-_vingts_ _jours_ by Jules Verne in French).

For each text file, we calculate the alphabet size and its Shannon entropy. The text_size goes from 200 to the end of the text file doubling at each step. For each text_size we have the pattern_size going from 10 to the pattern_size given in argument by step of 10. For each pattern_size we make 10000 experiments. The end results of the measures are means of the 10000 experiments.

To evaluate an algorithm :
1. compile by taping this in terminal :
    make name_algorithm_langnat
2. execute by taping this in terminal :
    ./name_algorithm_langnat Textes/txt_file pattern_size

As resultat you get :
    text_size pattern_size target nb_comparison time

To get the number of total instructions executed and number of conditional branch instructions, do the same steps by replacing name_algorithm with name_algorithm_papi_langnat.
As result you get :
    text_size pattern_size target nb_total_instructions_executed nb_conditional_branch_instructions



For convenience you can execute all the algorithms at once using :
    make algos
    make algos_papi
    make algos_dist
    make algos_papi_dist
    make algos_langnat
    make algos_papi_langnat

You can use as well the prepared scripts where n=1000, m=100, k=2 :
    algosexp.sh
    algos_papiexp.sh
    algos_dist.sh
    algos_papi_dist.sh
Or those for the benchmarks on natural language with m=100 :
    algos_langnat_bible.sh
    algos_papi_langnat_bible.sh
    algos_langnat_ch21.sh
    algos_papi_langnat_ch21.sh
    algos_langnat_coran.sh
    algos_papi_langnat_coran.sh
    algos_langnat_ecoli.sh
    algos_papi_langnat_ecoli.sh
    algos_langnat_shakespeare.sh
    algos_papi_langnat_shakespeare.sh
    algos_langnat_tdm.sh
    algos_papi_langnat_tdm.sh

The resultats are redirected to resultats, resultats_dist and resultats_langnat respectively.

Or you can directly consult the results in the following folders :
resultats, resultats_dist and resultats_langnat.


