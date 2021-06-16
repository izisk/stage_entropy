#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>
#include<papi.h>
#include"../entropy.h"
#include"text_algorithm.h"
#include"text_generator.h"

#define PAPI_events_number 2
#define ERROR_RETURN(retval) { fprintf(stderr, "Error %d, %s, %s:line %d: \n", retval, PAPI_strerror(retval), __FILE__,__LINE__);  exit(retval); }

int set_PAPI(){
  int eventSet = PAPI_NULL;
  int retval;
  int events[PAPI_events_number] = {PAPI_TOT_INS, PAPI_BR_MSP};
  int i;

  /* We use number to keep track of the number of events in the eventSet */ 
  if((retval = PAPI_library_init(PAPI_VER_CURRENT)) != PAPI_VER_CURRENT )
    ERROR_RETURN(retval);
    
  /* Creating the eventset */              
  if ( (retval = PAPI_create_eventset(&eventSet)) != PAPI_OK)
    ERROR_RETURN(retval);
  
  /* Fill eventSet */
  for (i = 0; i < PAPI_events_number; ++i){
    if ( (retval = PAPI_add_event(eventSet, events[i])) != PAPI_OK)
      ERROR_RETURN(retval);
  }
  return eventSet;
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
    unsigned char text[text_size];
    unsigned char pattern[pattern_size];
    char alphabet[alphabet_size];    
    int i;
    int nb_experiment = 10000;
    long long values[PAPI_events_number];


    create_alphabet(alphabet, alphabet_size);

    for(int n = 200; n <= text_size; n += 100){

    for(int m = 10; m <= pattern_size; m += 10){

    for(target = 0.001; target <= (log2(alphabet_size)-0.2); target +=0.01){
      	nb_comparaisons = 0;
        tempsmoyen = 0;

	for(i = 0; i < nb_experiment; i++){


	  if(i % 100 == 0)
	    random_distribution_generator(distribution, target, alphabet_size, 1000);
	  text_generator(text, distribution, alphabet, alphabet_size, n);
	  text_generator(pattern, distribution, alphabet, alphabet_size, m);
      if ( (retval = PAPI_start(eventSet)) != PAPI_OK)
          ERROR_RETURN(retval);
	  knuth_morris_pratt(text, pattern, n, m);
      if ( (retval = PAPI_stop(eventSet, values)) != PAPI_OK)
          ERROR_RETURN(retval);



	}
	printf("%d %d %Lg %Lg %lld %lld\n", n, m, target, nb_comparaisons/(long double)(nb_experiment), values[0]/long double)(nb_experiment), values[1]/long double)(nb_experiment));
    }
    }
    }
    return EXIT_SUCCESS;
}
