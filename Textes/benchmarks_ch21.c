#include <stdio.h>
#include <stdlib.h>
#include <string.h> 
#include <sys/stat.h>
#include <math.h>
#include<time.h>
#include"benchmarks_ch21.h"

void create_alphabet(char * alphabet, int size){
  int i;
  for(i = 0; i < size; i++)
    alphabet[i] = 'a'+i;
}


int main(int argc, char ** argv){
    srand(time(NULL));

    struct stat st;
    FILE *fp;
    int text_size, pattern_size = 200, alphabet_size = 4;

    fp = fopen("ch21.txt", "r");
    if (fp == NULL)
    {
        perror("Error while opening the file.\n");
        exit(EXIT_FAILURE);
    }
    stat("ch21.txt", &st);  
    text_size = st.st_size;

    char text[text_size];

    fgets(text, text_size, fp);
    fclose(fp);

    int i;
    long double entropy = 0;
    long double pA, pC, pG, pT;
    int nboccA = 0, nboccC = 0, nboccG = 0, nboccT = 0;
    clock_t temps_deb, temps_fin;
    long double temps;
    long double tempsmoyen;
    int x, y, nb_experiment = 2000;
    char alphabet[alphabet_size];  

    for(i=0; i<text_size; i++){
        if (text[i] == 'A') nboccA++;
        if (text[i] == 'C') nboccC++;
        if (text[i] == 'G') nboccG++;
        if (text[i] == 'T') nboccT++;
    }

    pA = (long double) nboccA/(text_size-1);
    pC = (long double) nboccC/(text_size-1);
    pG = (long double) nboccG/(text_size-1);
    pT = (long double) nboccT/(text_size-1);

    entropy = -(pA*log(pA) + pC*log(pC) + pG*log(pG) + pT*log(pT));

    create_alphabet(alphabet, alphabet_size);

    for(int n = 200; n <= text_size; n += 100){

        for(int m = 10; m <= pattern_size; m += 10){

            nb_comparaisons = 0;
            tempsmoyen = 0;

            for(i = 0; i < nb_experiment; i++){
                
                x=rand()%(text_size - n);
                y=rand()%(text_size - n - m);


                //temps debut
                temps_deb = clock();
                
                search(&text[y], m, &text[x], n);

                //temps fin
                temps_fin = clock();
                temps=(long double)(temps_fin - temps_deb)/(long double)CLOCKS_PER_SEC;
                tempsmoyen+=temps;
            }
            tempsmoyen = tempsmoyen/nb_experiment;

            printf("%d %d %Lg %Lg %Lg\n", n, m, entropy, nb_comparaisons/(long double)(nb_experiment), tempsmoyen);
        }
    }

    return EXIT_SUCCESS;

}


