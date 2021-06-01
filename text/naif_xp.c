#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>
#include"entropy.h"
#include"text_algorithm.h"
#include"text_generator.h"

long double collision_probability(long double * t, int n){
    long double ent = 0;
    int i;
    for(i = 0; i < n; i++)
        ent += t[i]*t[i];
    return ent;
}



long double expected_cmp_number(long double * distribution, int alphabet_size,
				int pattern_size){
  int cmp;
  long double collision_pr = collision_probability(distribution, alphabet_size);
  long double pow_ent = 1;
  long double result = 0;
  for(cmp = 0; cmp < pattern_size; cmp++, pow_ent *= collision_pr)
    result += (cmp+1) * pow_ent * (1 - collision_pr);
  result += cmp * pow_ent;
  return result;
}

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
    char text[text_size];
    char pattern[pattern_size];
    char alphabet[alphabet_size];    
    int i;
    int nb_experiment = 10000;
    
    create_alphabet(alphabet, alphabet_size);
    for(target = 0.001; target <= log2(alphabet_size); target +=0.01){
      	nb_comparaisons = 0;

	for(i = 0; i < nb_experiment; i++){
	  if(i % 100 == 0)
	    random_distribution_generator(distribution, target, alphabet_size, 1000);
	  text_generator(text, distribution, alphabet, alphabet_size, text_size);
	  text_generator(pattern, distribution, alphabet, alphabet_size, pattern_size);
	  algorithme_naif(text, pattern, text_size, pattern_size);
	}
	printf("%Lg %Lg\n", target,
	       //expected_cmp_number(distribution, alphabet_size, pattern_size),
	       nb_comparaisons/(long double)(nb_experiment));
	
	
    }
    return EXIT_SUCCESS;
}
