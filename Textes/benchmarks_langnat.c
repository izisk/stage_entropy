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
    long double target = 0;
    int nb_experiment = 10000;
    clock_t temps_deb, temps_fin;
    long double temps;
    long double tempsmoyen;
    int x, y;
    long double alphabet[256] = {0};  

    for(i = 0; i < text_size; i++){
        alphabet[(int)text[i]]++;
    }

    for(i = 0; i < 32; i++){
        alphabet[i] = 0;
    }
    

    for(i = 0; i < 256; i++){
        if (alphabet[i] != 0) {
            alphabet_size++;
            alphabet[i] = (long double) alphabet[i]/(text_size - 1);
            target = target - alphabet[i]*log(alphabet[i]);
        }
    }
    
    printf("n=%d m=%d k=%d\n", text_size, pattern_size, alphabet_size);

    for(int n = 200; n <= text_size; n += 100){

        for(int m = 10; m <= pattern_size; m += 10){

            nb_comparaisons = 0;
            tempsmoyen = 0;

            for(i = 0; i < nb_experiment; i++){
                
                x=rand()%(text_size - n);
                y=rand()%(text_size - m);


                //temps debut
                temps_deb = clock();
                
                search(&text[y], m, &text[x], n);

                //temps fin
                temps_fin = clock();
                temps=(long double)(temps_fin - temps_deb)/(long double)CLOCKS_PER_SEC;
                tempsmoyen+=temps;
            }
            tempsmoyen = tempsmoyen/nb_experiment;

            printf("%d %d %Lg %Lg %Lg\n", n, m, target, nb_comparaisons/(long double)(nb_experiment), tempsmoyen);

        }
    }

    return EXIT_SUCCESS;

}


