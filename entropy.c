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
int __MULTIPLICATIONS_BY_FACTOR__;


#define EPSILON powl(2,-128)
#define MIN(x,y) ((x)<(y))?x:y



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
    __MULTIPLICATIONS_BY_FACTOR__ = 0;
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
  printf("Nombre moyen de multiplication par un facteur %lf \n", __MULTIPLICATIONS_BY_FACTOR__/(double)__ENTROPY_NB_XP__);
  
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

/**
   Computes the value of the two remaining variables, in order to garantee that the targeted entropy has been reached.
   @param probability_left is equal to 1 - (the sum of the others k-2 variables). 
   @param target is equal to t - entropy(the others k-2 variables).
   @return a probability p such that entropy(p, probability_left - p) = target if this equation has two solutions with probability 1/2, 
           probability_left - p if this equation has two solutions with probability 1/2, 
	   p if probability_left - p = p with probability 1/2,
	   -1 if probability_left - p = p with probability 1/2,
           -1 if the equation has no solution or approximated solution. 
           
*/
long double aim_shannon_entropy(long double probability_left, long double target){
  long double p = probability_left/2;
  long double step = p/2.;
  long double entropy_p = aim_function(p, probability_left);
  // If the target is unreachable, exit function
  if(entropy_p < target || aim_function(EPSILON, probability_left) > target) 
    return -1.;
  while (step > 0 && entropy_p != target && p > 0){
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
  if(p == (probability_left-p) && rand()%2 == 1)
    return -1;
  if(rand()%2)
    return p;
  return probability_left-p;
}

/**
   Function used to compute the entropy of a distribution.
   @param p is a probability
   @requires 0 < p < 1
   @return - p * log2(p)
 */
long double h(long double p){
    return - p * log2(p);
}

/**
   Computes the shannon entropy of a probability distribution over n events
   @param t is a probability distribution
   @param n is the number of events in t.
   @require  n > 0 and t != NULL & size(t) >= n
   @return the shannon entropy of t
 */
long double shannon_entropy(long double * t, int n){
    long double ent = 0;
    int i;
    for(i = 0; i < n; i++)
        ent += h(t[i]);
    return ent;
}

/**
   Set the n-2 first variables of res to random values between 0 and 1/n.
   @param res is a table of values between 0 and 1/n
   @param n is the size of res
   @require res!= NULL, and n > 0 and size(res) > n
*/
void random_doubles_with_two_empty_spaces(long double * res, int n){
    int i;
    for(i=0; i < n-2; i++)
      res[i] = rand()/(RAND_MAX*(long double)n);    
}

/**
   Computes the sum of n-2 first values of dist
   @param dist is a probability distribution
   @param n is the number of events in the probability distribution.
   @require dist!= NULL, and n > 0 and size(dist) > n
   @return the  sum of n-2 first values of dist
 */
long double sum_incomplete_distribution(long double * dist, int n){
    long double res = 0.;
    int i;
    for(i=0; i < n-2; i++)
        res += dist[i];
    return res;
}

/********************** FIRST STEP FUNCTIONS **********************/

/**
   Returns the maximal entropy of two probabilities whose sum is equal to partial_sum.
   @param partial_sum is the sum of the two probabilities whose entropy we try to maximize
   @requires partial_sum < 1
   @return the maximal entropy of two probabilities whose sum is equal to partial_sum.
*/
double maximal_entropy_of_two_values(long double partial_sum){
  return 2*h(partial_sum/2);
}

/**
   Computes the factor by which every value in the distribution will be multiplied
   In order to get closer to the target. 
   Though this method is obviously not optimal, it works surprisingly well.
   @param partial_sum is a sum of probabiliies
   @param partial_ent is the entropy of the variables summed in partial_sum
   @param target is the targeted entropy
   @result a factor by which every value in the distribution will be multiplied
   In order to get closer to the target.
*/
double reaching_factor(long double partial_sum, long double partial_ent, long double target){
  if(partial_ent > target || partial_sum > 1)
    return 0.5;
  if(partial_ent < target-maximal_entropy_of_two_values(partial_sum))
    return 1.5;
  else
    return 0;
}

/**
   Multiplies every probabilities in the distribution by a given factor.
   @param distribution is a table of values to multiply
   @param size is the number of events in the distribution
   @param factor is the multiplying factor by which values will be modified.
*/
void multiply_by_factor(long double * distribution, int size, double factor){
  int i;
  for(i = 0; i < size; i++)
    distribution[i] *= factor;
}

/**
   This function creates a probability distribution whose Shannon entropy is equal to target.
   @param distribution is used to store the result, a probability distribution whose Shannon entropy is equal to target.
   @param target_entropy is the targeted Shannon entropy.
   @param size is the number of events in the probability distribution.
   @require distribution != NULL
   @require 0 < target_entropy < log(size)/log(2)
   @return 0 if the computation succeeded, -1 otherwise.
 */
int reach_first_state(long double * distribution, long double target_entropy, int size){
  long double incomplete_dist_sum, incomplete_ent;
  double factor;
  random_doubles_with_two_empty_spaces(distribution, size);
  incomplete_dist_sum = sum_incomplete_distribution(distribution, size);
  incomplete_ent = shannon_entropy(distribution, size-2);
  while((factor = reaching_factor(incomplete_dist_sum, incomplete_ent, target_entropy)) != 0){
    __MULTIPLICATIONS_BY_FACTOR__++;
    
    multiply_by_factor(distribution, size, factor);
    incomplete_dist_sum = sum_incomplete_distribution(distribution, size);
    incomplete_ent = shannon_entropy(distribution, size-2);
  }
  distribution[size-2] = aim_shannon_entropy(1-incomplete_dist_sum,
					     target_entropy - incomplete_ent);
  if(distribution[size-2] < 0)
    return -1;
										
  distribution[size-1] = 1-incomplete_dist_sum - distribution[size-2];
  
  return 0; //If equal to -1, then a problem occured.
}

/********************** MARKOV CHAIN STEP **********************/

/**
   Randomly generates 3 distincts values between 0 and max_malue-1
   @param max_value sets a maximal value that random values can get.
   @param res is the obtained random triplet.
   @requires res != NULL
 */
void random_triplet(int max_value, int * res){
    res[0] = rand()%max_value;
    do{ res[1] = rand()%max_value;} while(res[0] == res[1]);
    do{ res[2] = rand()%max_value;} while(res[0] == res[2] || res[1] == res[2]);
}

/**
   This function is the step of the markov chain.
   @param dist is the probability distribution that might be modified by the step of the markov chain.
   @param max_value is the number number of events in the distribution.
*/
void markov_chain_step(long double * dist, int max_value){
    int triplet[3], i;
    long double target;
    long double sum;
    long double step[3];
    random_triplet(max_value, triplet);
    sum = dist[triplet[0]] + dist[triplet[1]] + dist[triplet[2]];
    target = h(dist[triplet[0]]) + h(dist[triplet[1]]) + h(dist[triplet[2]]);
    do { 
        step[0] = sum*rand()/(long double)RAND_MAX;
    } while ( h(step[0]) >= target);
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

/**
   Markov chain based algorithm that generates a uniformly random probability distribution whose Shannon entropy approximates a target.
   @param res is the result: a uniformly random probability distribution whose Shannon entropy approximates a target.
   @param target_entropy is the targeted Shannon entropy
   @param size is the number of events in the probability distribution
   @param steps is the number of steps to take in the random walk.
 */
void distribution_markov_chain(long double * res, long double target_entropy, int size, int steps){
    int i;
    while( reach_first_state(res, target_entropy, size) < 0)
      __ENTROPY_FIRST_STEP_FAILURES__++;
    
    for (i = 0; i < steps; i++)
      markov_chain_step(res, size);        
}

/**
   Random generator of probability distributions whose Shannon entropy approximates a target.
   This function results the uniform distribution if the entropy is maximal,
   return of one solutions if there is only 2 events in the distribution 
   and call the markov chain based algorithm otherwise.
   @param res is the result: a uniformly random probability distribution whose Shannon entropy approximates a target.
   @param target_entropy is the targeted Shannon entropy
   @param size is the number of events in the probability distribution
   @param steps is the number of steps to take in the random walk.   
*/
void random_distribution_generator(long double * res, long double target_entropy, int size, int steps){
    int i;
    if(target_entropy < log2(size)){
      if(size > 2)
	distribution_markov_chain(res, target_entropy, size, steps);
      else{
	res[0] = aim_shannon_entropy(1, target_entropy);
	if( res[0] != 1-res[0] rand()%2 == 0){
	  res[1] = res[0];
	  res[0] = 1-res[1];
	}
	else
	  res[1] = 1-res[0];	
      }
    }
    else{ //Entropy is maximal
      for(i = 0; i < size; i++)
	res[i] =  1/(long double)size;
    }
}

/**
   This function draws a random value according the given probability distribution.
   @param distribution is a probability distribution
   @param max_value is the number of events in the distribution
   @return a random value according the given probability distribution.
 */
int draw_according_to_distribution(long double * distribution, int max_value){
    long double p = rand()/(long double)RAND_MAX;
    int res = 0;
    while(p >= distribution[res] && res < max_value-1){
        p -= distribution[res];
        res++;
    }
    return res;
}



