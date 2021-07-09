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
  long double dist_text[alphabet_size];
  long double dist_pattern[alphabet_size];
  unsigned char * text = malloc(sizeof(char) * (text_size + pattern_size + 1));
  unsigned char * pattern = malloc(sizeof(char) * (pattern_size + 1));
  char alphabet[alphabet_size];    
  int i;
  int nb_experiment = 10000;
  clock_t temps_deb, temps_fin;
  long double temps;
  long double tempsmoyen;

    
  create_alphabet(alphabet, alphabet_size);

  for(int n = 200; n <= text_size; n += 100){

    for(int m = 10; m <= pattern_size; m += 10){

      for(target = 0.001; target <= log2(alphabet_size); target +=0.01){
        nb_comparaisons = 0;
        tempsmoyen = 0;

        for(i = 0; i < nb_experiment; i++){
        
          random_distribution_generator(dist_text, target, alphabet_size, 1000);
          random_distribution_generator(dist_pattern, target, alphabet_size, 1000);
          text_generator(text, dist_text, alphabet, alphabet_size, n);
          text_generator(pattern, dist_pattern, alphabet, alphabet_size, m);
          //temps debut
          temps_deb = clock();

          search(pattern, m, text, n);

          //temps fin
          temps_fin = clock();
          temps=(long double)(temps_fin - temps_deb)/(long double)CLOCKS_PER_SEC;
          tempsmoyen+=temps;
        }
        tempsmoyen = tempsmoyen/nb_experiment;

        printf("%d %d %Lg %Lg %Lg\n", n, m, target, nb_comparaisons/(long double)(nb_experiment), tempsmoyen);
      }
    }
  }

  free(text);
  free(pattern);

  return EXIT_SUCCESS;
}