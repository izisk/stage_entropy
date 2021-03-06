#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>
#include<papi.h>
#include <string.h> 
#include <sys/stat.h>
#include "benchmarks_langnat.h"


#define PAPI_events_number 2
#define ERROR_RETURN(retval) { fprintf(stderr, "Error %d, %s, %s:line %d: \n", retval, PAPI_strerror(retval), __FILE__,__LINE__);  exit(retval); }

int set_PAPI(){
  int eventSet = PAPI_NULL;
  int retval;
  int events[PAPI_events_number] = {PAPI_TOT_INS, PAPI_BR_MSP};
    //{PAPI_TOT_INS, PAPI_L3_TCA, PAPI_L3_TCM, PAPI_L2_TCA, PAPI_L2_TCM, PAPI_L1_TCA, PAPI_L1_TCM, PAPI_BR_INS, PAPI_BR_MSP, PAPI_BR_PRC};

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

    char * text = malloc(sizeof(char)*(text_size+pattern_size+1));

    fread(text, sizeof(char), text_size, fp);
    fclose(fp);

    int i;
    long double target = 0;
    int nb_experiment = 10000;
    int x, y;
    long double alphabet[256];

    memset(alphabet, 0, 256*sizeof(long double));

    int n, m;
    long long values[PAPI_events_number];
    int retval;
    int eventSet = set_PAPI();
    long long int nb_instructions, nb_branch_fault;

    for(i = 0; i < text_size; i++){
        alphabet[(int)text[i]]++;
    }

    for(i = 0; i < 32; i++){
        alphabet[i] = 0;
    }

    for(i = 0; i < 256; i++){
        if (alphabet[i] != 0) {
            alphabet_size++;
            alphabet[i] = (long double) alphabet[i]/(text_size);
            target = target - alphabet[i]*log(alphabet[i]);
        }
    }

    printf("n=%d m=%d k=%d\n", text_size, pattern_size, alphabet_size);

    for(n = 200; n <= text_size; n *= 2){

    for(m = 10; m <= pattern_size; m += 10){

        nb_comparaisons = 0;
        nb_instructions = 0;
        nb_branch_fault = 0;

        for(i = 0; i < nb_experiment; i++){

          x=rand()%(text_size - n);
          y=rand()%(text_size - m);

          if ( (retval = PAPI_start(eventSet)) != PAPI_OK)
          ERROR_RETURN(retval);
          search(&text[y], m, &text[x], n);
          if ( (retval = PAPI_stop(eventSet, values)) != PAPI_OK)
          ERROR_RETURN(retval);
          
          nb_instructions += values[0];
          nb_branch_fault += values[1];

        }

      printf("%d %d %Lg %Lg %Lg %Lg\n", n, m, target, nb_comparaisons/(long double)(nb_experiment), nb_instructions/(long double)(nb_experiment), nb_branch_fault/(long double)(nb_experiment));
	
    }

  }
  free(text);
  return EXIT_SUCCESS;
}
