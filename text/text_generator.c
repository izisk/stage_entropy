#include"text_generator.h"
#include<stdlib.h>

void text_generator(unsigned char * result, long double * distribution, char * alphabet,
		    int alphabet_size, int size){
    int i, letter;
    for(i =0; i < size; i++){
        letter = draw_according_to_distribution(distribution, alphabet_size);
        result[i] = alphabet[letter];
    }
    result[size] = '\0';
}


