#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>
#include"entropy.h"


int main(int argc, char ** argv){
    srand(time(NULL));
    if(argc != 3){
        perror("./random_distribution event_number target");
        return EXIT_FAILURE;
    }
    int size = atoi(argv[1]);
    long double target = atof(argv[2]);
    long double * distribution = malloc(sizeof(long double)*size);
    int i;
    int nb_experiment = 1;
    entropy_init_benchmarks(nb_experiment);

    for(i = 0; i < nb_experiment; i++){
      random_distribution_generator(distribution, target, size, 10000);
      print_distribution(distribution, size);
      printf("Entropy : %Lf\n", shannon_entropy(distribution,size));
      
    }
    entropy_print_benchmarks();
    free(distribution);
    return EXIT_SUCCESS;
}
