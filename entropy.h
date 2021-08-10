#ifndef __ENTROPY_H
#define __ENTROPY_H

#define EPSILON powl(2,-64)


void print_distribution(long double * dist, int n);
long double shannon_entropy(long double * t, int n);
void random_distribution_generator(long double * res, long double target_entropy, int size, int steps);
int draw_according_to_distribution(long double * distribution, int max_value);

void entropy_init_benchmarks();
void entropy_print_benchmarks();


extern long int __ENTROPY_AIM_STEPS__;
extern long int __ENTROPY_FIRST_STEP_FAILURES__;
extern long int __ENTROPY_INC_DIST_FAILURES__;
extern long int __ENTROPY_MARKOV_STEP_FAILURES__;
extern int __ENTROPY_NB_XP__;
extern int __MULTIPLICATIONS_BY_FACTOR__;


#endif
