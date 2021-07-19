#include <stdio.h>
#include <stdlib.h>
#include <string.h> 
#include <sys/stat.h>
#include <math.h>
#include<time.h>
#include "benchmarks_langnat.h"


int main(int argc, char ** argv){
    srand(time(NULL));
    
    char * fichier = argv[1];
    struct stat st;
    FILE *fp;
    int text_size, alphabet_size = 0;
    int pattern_size = atoi(argv[2]);

    fp = fopen(fichier, "r");
    if (fp == NULL)
    {
        perror("Error while opening the file.\n");
        exit(EXIT_FAILURE);
    }
    stat(fichier, &st);  
    text_size = st.st_size;

    char text[text_size];

    fgets(text, text_size, fp);
    fclose(fp);

    int i;
    long double entropy = 0;
    clock_t temps_deb, temps_fin;
    long double temps;
    int x, y;
    long double alphabet[255] = {0};  

    for(i = 0; i < text_size; i++){
        alphabet[(int)text[i]]++;
    }

    for(i = 0; i < 255; i++){
        if (alphabet[i] != 0) {
            alphabet_size++;
            alphabet[i] = (long double) alphabet[i]/(text_size - 1);
            entropy = entropy - alphabet[i]*log(alphabet[i]);
        }
    }
    
    printf("n=%d m=%d k=%d\n", text_size, pattern_size, alphabet_size);

    for(int n = 200; n <= text_size; n += 100){

        for(int m = 10; m <= pattern_size; m += 10){

            nb_comparaisons = 0;
                
                x=rand()%(text_size - n);
                y=rand()%(text_size - m);


                //temps debut
                temps_deb = clock();
                
                search(&text[y], m, &text[x], n);

                //temps fin
                temps_fin = clock();
                temps=(long double)(temps_fin - temps_deb)/(long double)CLOCKS_PER_SEC;

            printf("%d %d %Lg %lld %Lg\n", n, m, entropy, nb_comparaisons, temps);
        }
    }

    return EXIT_SUCCESS;

}


