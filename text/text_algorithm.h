int algorithme_naif(char * texte,char * motif,int n,int m);
int knuth_morris_pratt(char * texte,char * motif,int n,int m);
int boyer_moore(char * texte, char * motif,int n,int m,int k);

extern long long int nb_comparaisons;
