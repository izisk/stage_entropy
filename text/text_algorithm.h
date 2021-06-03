int algorithme_naif(unsigned char * texte,unsigned char * motif,int n,int m);
int knuth_morris_pratt(unsigned char * texte,unsigned char * motif,int n,int m);
int boyer_moore(unsigned char * texte, unsigned char * motif,int n,int m,int k);

extern long long int nb_comparaisons;
