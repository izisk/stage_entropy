#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>
#include"../entropy.h"
#include"text_algorithm.h"
#include"text_generator.h"
#include"benchmarks.h"

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
    double tempsmoyen = 0;

    
    create_alphabet(alphabet, alphabet_size);
    for(target = 0.001; target <= log2(alphabet_size); target +=0.01){
      	nb_comparaisons = 0;

	for(i = 0; i < nb_experiment; i++){
    //temps debut
    temps_deb = clock();
  
	  if(i % 100 == 0)
	    random_distribution_generator(distribution, target, alphabet_size, 1000);
	  text_generator(text, distribution, alphabet, alphabet_size, text_size);
	  text_generator(pattern, distribution, alphabet, alphabet_size, pattern_size);
	  search(pattern, pattern_size, text, text_size);

    //temps fin
    temps_fin = clock();
    temps=(double)(temps_fin - temps_deb)/(double)CLOCKS_PER_SEC;
    tempsmoyen+=temps;
	}
  tempsmoyen = tempsmoyen/nb_experiment;

	printf("%Lg %Lg %f\n", target, nb_comparaisons/(long double)(nb_experiment), tempsmoyen);
	
    }
    return EXIT_SUCCESS;
}