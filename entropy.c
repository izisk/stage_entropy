#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>
#include"entropy.h"

long int __ENTROPY_AIM_STEPS__;
long int __ENTROPY_FIRST_STEP_FAILURES__;
long int __ENTROPY_INC_DIST_FAILURES__;
long int __ENTROPY_MARKOV_STEP_FAILURES__;
int __ENTROPY_NB_XP__;
int __FIRST_STATE_ITERATIONS__;


#define MIN(x,y) ((x)<(y))?x:y
#define MAX(x,y) ((x)>(y))?x:y



/**
   Initializes all the metrics of the generator's benchmarks.
   @param nb_xp is the number of conducted experiments
   @ensures all metrics are set to zero, except for the number of experiments
*/
void entropy_init_benchmarks(int nb_xp){
    __ENTROPY_AIM_STEPS__ = 0;
    __ENTROPY_FIRST_STEP_FAILURES__ = 0;
    __ENTROPY_INC_DIST_FAILURES__ = 0;
    __ENTROPY_NB_XP__ = nb_xp;
    __ENTROPY_MARKOV_STEP_FAILURES__ = 0;
    __FIRST_STATE_ITERATIONS__ = 0;
}

/**
   Print the value of all the metrics on the standard output.
*/
void entropy_print_benchmarks(){
  printf("Nombre total d'étapes %ld \n", __ENTROPY_AIM_STEPS__);
  printf("Nombre moyen d'échecs de tirage de distribution incomplète: %lf\n",
	 __ENTROPY_INC_DIST_FAILURES__/(double)(__ENTROPY_FIRST_STEP_FAILURES__+1));
  printf("Nombre moyen de rejets sur un pas Markovien: %lf\n", __ENTROPY_MARKOV_STEP_FAILURES__/(double)__ENTROPY_NB_XP__);
  printf("Nombre moyen de d'essai:%lf\n", __ENTROPY_FIRST_STEP_FAILURES__/(double)__ENTROPY_NB_XP__);
  printf("Nombre moyen de multiplication par un facteur %lf \n", __FIRST_STATE_ITERATIONS__/(double)__ENTROPY_NB_XP__);
  
}

/**
   Print the probability distribution 
   @param dist is the probability distribution
   @param n is the number of events, that is to say the size of table 'dist'.
*/
void print_distribution(long double * dist, int n){
    int i;
    for (i = 0; i< n; i++){
        printf("%Lg ", dist[i]);
    }
    printf("\n");
}

/**
   Returns the truncated Shannon entropy of a probability p and a value p_left-p
   @requires 0 < p < 1 and 0 < p_left < 1
   @param p is a probability
   @param p_left is the probability to be in a set of events.
   @returns the truncated Shannon entropy of a probability p and a value p_left-p
*/
long double aim_function(long double p, long double p_left){
    return - ( p*log2(p) + (p_left-p)*log2(p_left-p) );
}

long double aim_shannon_entropy(long double probability_left, long double target){
  long double p = probability_left/2;
  long double step = p/2.;
  long double entropy_p = aim_function(p, probability_left);
  // If the target is unreachable, exit function
  if(entropy_p < target || aim_function(EPSILON, probability_left) > target) 
    return -1.;
  while (step > EPSILON && (double) entropy_p != (double) target && p > 0){
    if(entropy_p < target)
      p += step;
    else
      p -= step;
    entropy_p = aim_function(p, probability_left);
    step /= 2.;
    __ENTROPY_AIM_STEPS__++;
  }
  // the precision for entropy is lower than for probabilities.
  if((float)entropy_p!=(float)target)
    return -1;

  if(rand()%2)
    return p;
  return probability_left-p;
}

long double h(long double p){
    return - p * log2(p);
}

long double shannon_entropy(long double * t, int n){
    long double ent = 0;
    int i;
    for(i = 0; i < n; i++)
        ent += h(t[i]);
    return ent;
}


void distribution_with_max_entropy(long double * res, int n){
    int i;
    for(i=0; i < n; i++)
      res[i] = 1/(long double)n;
}


long double sum_distribution(long double * dist, int n){
    long double res = 0.;
    int i;
    for(i=0; i < n; i++)
        res += dist[i];
    return res;
}

/********************** FIRST STEP FUNCTIONS **********************/

long double maximal_entropy_of_two_values(long double partial_sum){
  return 2*h(partial_sum/2);
}

long double minimal_entropy_of_two_values(long double partial_sum){
  return h(partial_sum-EPSILON)+h(EPSILON);
}


double reaching_factor(long double partial_sum, long double partial_ent, long double target){
  if(partial_ent > target || partial_sum > 1)
    return 0.5;
  if(partial_ent < target-maximal_entropy_of_two_values(partial_sum))
    return 1.5;
  else
    return 0;
}

void multiply_by_factor(long double * distribution, int size, double factor){
  int i;
  for(i = 0; i < size; i++)
    distribution[i] *= factor;
}

void add_delta(long double * distribution, int size, long double delta){
  int i;
  for(i = 0; i < size; i++)
    distribution[i] += delta;
}


int reach_first_state(long double * distribution, long double target_entropy, int size){
  long double incomplete_dist_sum, incomplete_ent;
  long double min_entropy, max_entropy;
  long double delta = 0.5/(long double)size;
  distribution_with_max_entropy(distribution, size);
  incomplete_dist_sum = sum_distribution(distribution, size-2);
  incomplete_ent = shannon_entropy(distribution, size-2);
  min_entropy = incomplete_ent+minimal_entropy_of_two_values(1-incomplete_dist_sum);
  max_entropy = incomplete_ent+maximal_entropy_of_two_values(1-incomplete_dist_sum);
  
  while( max_entropy < target_entropy || min_entropy > target_entropy){
    __FIRST_STATE_ITERATIONS__++;    
    if(incomplete_ent + maximal_entropy_of_two_values(1-incomplete_dist_sum) < target_entropy)
      add_delta(distribution, size-2, delta);
    else
      add_delta(distribution, size-2, -delta);
    

    incomplete_dist_sum = sum_distribution(distribution, size-2);
    incomplete_ent = shannon_entropy(distribution, size-2);
    min_entropy = incomplete_ent+minimal_entropy_of_two_values(1-incomplete_dist_sum);
    max_entropy = incomplete_ent+maximal_entropy_of_two_values(1-incomplete_dist_sum);
    delta/=2;
  }
  distribution[size-2] = aim_shannon_entropy(1-incomplete_dist_sum,
					     target_entropy - incomplete_ent);  
  if(distribution[size-2] < 0)
    return -1;
  
										
  distribution[size-1] = 1-incomplete_dist_sum - distribution[size-2];
  
  return 0; //If equal to -1, then a problem occured.
}

/********************** MARKOV CHAIN STEP **********************/

inline long double lower_approximation_function(long double s, long double t){
  return s-(s*log(2) + sqrt(-log(2)*log(s)*s*s + s*s*log(2)*log(2) - log(2)*log(2)*s*t))/(2*log(2));    
}

inline long double upper_approximation_function(long double s, long double t){
  return MIN(1,(4*log(2)*s + sqrt(18*log(2)*log(2)*s*s - 20*log(2)*log(2)*s*t - 20*log(2)*log(s/2)*s*s))/(10*log(2)));
}

inline long double lower_upper_approximation_function(long double s, long double t){
  return MAX(0, 0.2999999996*s - sqrt(-(0.2740337179*s*log(s) - 0.30105681*s + 0.1899456989*t)*s));
}

long double random_value_in_approx_interval(long double s, long double t){
  long double threshold = -2*s/2*log(s/2)/log(2);
  long double upper_approx = upper_approximation_function(s, t);
  long double res = drand48();
  if(t < threshold ){
    long double lower_approx = lower_approximation_function(s, t);
    long double reverse_lower_approx = s-lower_approx;
    long double upper_range = upper_approx - reverse_lower_approx;
    long double separator = lower_approx/(lower_approx+upper_range);
    if(res >= separator)
      return reverse_lower_approx + drand48()*upper_range;
    else
      return drand48()*lower_approx;
  }
  long double lower_upper_approx = lower_upper_approximation_function(s,t);
  return res*(upper_approx-lower_upper_approx)+lower_upper_approx;
}

void random_triplet(int max_value, int * res){
    res[0] = rand()%max_value;
    do{ res[1] = rand()%max_value;} while(res[0] == res[1]);
    do{ res[2] = rand()%max_value;} while(res[0] == res[2] || res[1] == res[2]);
}

void markov_chain_step(long double * dist, int max_value){
    int triplet[3], i;
    long double target;
    long double sum;
    long double step[3];
    random_triplet(max_value, triplet);
    sum = dist[triplet[0]] + dist[triplet[1]] + dist[triplet[2]];
    target = h(dist[triplet[0]]) + h(dist[triplet[1]]) + h(dist[triplet[2]]);
    do { 
      step[0] = random_value_in_approx_interval(sum, target);
      __ENTROPY_MARKOV_STEP_FAILURES__++;
    } while ( h(step[0]) >= target );
    step[1] = aim_shannon_entropy(sum - step[0], target - h(step[0]));
    
    if(step[1] != -1){
        step[2] = sum - step[0] - step[1];
        for ( i = 0 ; i < 3; ++i)
            dist[triplet[i]] = step[i];
    }
    else 
        __ENTROPY_MARKOV_STEP_FAILURES__++;
}

/********************** RANDOM GENERATORS **********************/

void distribution_markov_chain(long double * res, long double target_entropy, int size, int steps){
    int i;
    while( reach_first_state(res, target_entropy, size) < 0)
      __ENTROPY_FIRST_STEP_FAILURES__++;
    
    for (i = 0; i < steps; i++)
      markov_chain_step(res, size);        
}

void random_distribution_generator(long double * res, long double target_entropy, int size, int steps){
    if(target_entropy < log2(size)){
      if(size > 2)
	distribution_markov_chain(res, target_entropy, size, steps);
      else{
	res[0] = aim_shannon_entropy(1, target_entropy);
	res[1] = 1-res[0];
      }
    }
    else //Entropy is maximal
      distribution_with_max_entropy(res, size);    
}

int draw_according_to_distribution(long double * distribution, int max_value){
  long double p = drand48();
  int res = 0;
  while(p >= distribution[res] && res < max_value-1){
    p -= distribution[res];
    res++;
  }
  return res;
}



