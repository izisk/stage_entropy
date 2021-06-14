#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include"text_algorithm.h"

long long int nb_comparaisons;


int comparer_lettre(char l1,char l2){
  nb_comparaisons++;
  return (l1==l2)?1:0;
}



int algorithme_naif(unsigned char * texte,unsigned char * motif,int n,int m){
  int i,j;
  int occ;
  for(i=0,occ=0;i<=(n-m);i++){
    j=0;
    while( j<m && comparer_lettre(texte[i+j],motif[j]))
      j++;
    if(j==m)
      occ++;
  }
  return occ;
}

#define MAX(x,y) (x<y)?y:x



int * derniere_occ(unsigned char * mot,int m,int k){
  int * last_occ=(int *)malloc(sizeof(int)*k);
  int x;
  for(x = 0; x < k; x++)
    last_occ[x] = 0;
  for(x = 0; x < (m-1) ; x++)
    last_occ[(int)(mot[x]-'a')] = x;
    
  return last_occ;
}

void echanger(unsigned char * x,unsigned char * y){
  char tmp=*x;
  *x=*y;
  *y=tmp;  
}

void inverser_mot(unsigned char * motif,int m){
  int i,j;
  for(i=0,j=m-1;i<j;++i,--j)
    echanger(&motif[i],&motif[j]);
} 

int * kmp_bord(unsigned char * mot,int m){
  int i,j;
  int * table_bord=(int *)malloc(sizeof(int)*(m+1));
  table_bord[0] = -1;
  table_bord[1] = 0;
  j=0;
  for(i=2;i<=m;i++){
    while(j>=0&&mot[j]!=mot[i-1])
      j=table_bord[j];
    j++;
    if(mot[i]!=mot[j])
      table_bord[i]=j;
    else
      table_bord[i]=MAX(0,table_bord[j]);
  }
  return table_bord;
}

int knuth_morris_pratt(unsigned char * texte,unsigned char * motif,int n,int m){
  int i=0,j=0;
  int * table_bord;
  int occ=0;
  table_bord=kmp_bord(motif,m);
  while(i<=(n-m+j)){
    while(j<m && comparer_lettre(texte[i],motif[j])){
      i++;
      j++;
    }
    if(j==m)
      occ++;
    if(j==0)
      i++;
    else 
      j=table_bord[j];
  }
  free(table_bord);
  return occ;
}


int * bm_bon_decalage(unsigned char * mot,int m){
  int * table_bord;
  int * bon_suff=(int *)malloc(sizeof(int)*(m+1));
  int i,l;
  inverser_mot(mot,m);
  table_bord=kmp_bord(mot,m);
  inverser_mot(mot,m);

  for(l=0;l<=m;l++)
    bon_suff[l]=m-(table_bord[m]);

  for(i=1;i<=m;i++){
    l = m- table_bord[i];
    if(bon_suff[l]>(i - table_bord[i]) ) 
      bon_suff[l] = i - table_bord[i];
  }
    
  free(table_bord);
  return bon_suff;
}

int boyer_moore(unsigned char * texte, unsigned char * motif,int n,int m,int k){
  int * last_occ=derniere_occ(motif,m,k);
  int * bon_suff=bm_bon_decalage(motif,m);
  int i,j;
  int occ=0;
  i=0;
  while(i<(n-m+1)){
    j=m-1;
    while(j>=0&&comparer_lettre(texte[i+j],motif[j]))
      j--;
    
    if(j<0){
      occ++;
      i+=bon_suff[0];
    }
    else
      i+=MAX(bon_suff[j+1],  j - last_occ[(int)(texte[i + j]-'a')]);
  }
  free(last_occ);
  free(bon_suff);
  return occ;
}
