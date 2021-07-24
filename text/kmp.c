#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>
#include"../entropy.h"
#include"text_algorithm.h"
#include"text_generator.h"


void create_alphabet(char * alphabet, int size){
  int i;
  for(i = 0; i < size; i++)
    alphabet[i] = 'a'+i;
}

int main(int argc, char ** argv){
    srand(time(NULL));
    if(argc != 4){
        perror("./a.out text_size pattern_size alphabet_size");
        return EXIT_FAILURE;
    }
    int text_size = atoi(argv[1]);
    int pattern_size = atoi(argv[2]);
    int alphabet_size = atoi(argv[3]);
    long double target;
    long double distribution[alphabet_size];
    unsigned char text[text_size];
    unsigned char pattern[pattern_size];
    char alphabet[alphabet_size];    
    int i;
    int nb_experiment = 10000;
    clock_t temps_deb, temps_fin;
    double temps;
    double tempsmoyen;
    
    create_alphabet(alphabet, alphabet_size);

    for(int n = 200; n <= text_size; n += 100){

    for(int m = 10; m <= pattern_size; m += 10){

    for(target = 0.001; target <= (log2(alphabet_size)); target +=0.01){
      	nb_comparaisons = 0;
        tempsmoyen = 0;

	for(i = 0; i < nb_experiment; i++){


	  random_distribution_generator(distribution, target, alphabet_size, 1000);
	  text_generator(text, distribution, alphabet, alphabet_size, n);
	  text_generator(pattern, distribution, alphabet, alphabet_size, m);
     //temps debut
    temps_deb = clock();

	  knuth_morris_pratt(text, pattern, n, m);

    //temps fin
    temps_fin = clock();
    temps=(double)(temps_fin - temps_deb)/(double)CLOCKS_PER_SEC;
    tempsmoyen+=temps;
	}

    tempsmoyen = tempsmoyen/nb_experiment;
    
	printf("%d %d %Lg %Lg %f\n", n, m, target, nb_comparaisons/(long double)(nb_experiment), tempsmoyen);
    }
    }
    }
    return EXIT_SUCCESS;
}
