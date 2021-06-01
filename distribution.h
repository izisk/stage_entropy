typedef struct distribution_s{
  long long int probabilities;
  int event_number;
  long double entropy;
}distribution_t;

distribution_t * create_distribution(int event_number);
void destroy_distribution(distribution_t * d);
