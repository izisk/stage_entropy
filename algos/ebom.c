/*
 * SMART: string matching algorithms research tool.
 * Copyright (C) 2012  Simone Faro and Thierry Lecroq
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>
 * 
 * contact the authors at: faro@dmi.unict.it, thierry.lecroq@univ-rouen.fr
 * download the tool at: http://www.dmi.unict.it/~faro/smart/
 *
 * This is an implementation of the Extended Backward Oracle Matching algorithm
 * in S. Faro and T. Lecroq. 
 * Efficient Variants of the Backward-Oracle-Matching Algorithm. 
 * Proceedings of the Prague Stringology Conference 2008, pp.146--160, Czech Technical University in Prague, Czech Republic, (2008).
 */

#include "include/define.h"
//#include "include/main.h"
#include <string.h>
#include <stdlib.h>

long long int nb_comparaisons;

int search(unsigned char *x, int m, unsigned char *y, int n) {
   int S[XSIZE], FT[SIGMA][SIGMA];
   int *trans[XSIZE];
   int i, j, p, q;
   int iMinus1, mMinus1, count;
   unsigned char c;
   count = 0;

   //BEGIN_PREPROCESSING
   for(i=0; i<=m+1; i++) trans[i] = (int *)malloc (sizeof(int)*(SIGMA));
   for(i=0; i<=m+1; i++) for(j=0; j<SIGMA; j++) trans[i][j]=UNDEFINED;
   S[m] = m + 1;
   for (i = m; i > 0; --i) {
      iMinus1 = i - 1;
      c = x[iMinus1];
      trans[i][c] = iMinus1;
      p = S[i];
      while (p <= m && (q = trans[p][c]) ==  UNDEFINED) {
         trans[p][c] = iMinus1;
         p = S[p];
      }
      S[iMinus1] = (p == m + 1 ? m : q);
   }

   /* Construct the FirstTransition table */
   for(i=0; i<SIGMA; i++) {
      q = trans[m][i];
      for(j=0; j<SIGMA; j++)
         if(q>=0) FT[i][j] = trans[q][j];
         else FT[i][j] = UNDEFINED;
   }
   //END_PREPROCESSING

   //BEGIN_SEARCHING
   for(i=0; i<m; i++) y[n+i]=x[i];
   //remplacement du if en commentaire afin de pouvoir incrementer le nb_comparaisons
   int cmpt = 0;
   while(cmpt<m && x[cmpt] == y[cmpt]){
      nb_comparaisons++;
      cmpt++;
   }
   if (cmpt != m) count++;
   //if( !memcmp(x,y,m) ) count++;
   j=m;
   mMinus1 = m-1;
   while (j<n) {
      while ( (FT[y[j]][y[j-1]]) == UNDEFINED ) {
         j+=mMinus1;
         nb_comparaisons++; //pas sur
      }
      i = j-2;
      p = FT[y[j]][y[j-1]];
      while ( (p = trans[p][y[i]]) != UNDEFINED ) {
         i--;
         nb_comparaisons++; //pas sir
      }
      if (i < j-mMinus1 && j<n) {
         count++;
         i++;
      }
      j = i + m;
   }
   //END_SEARCHING

   for(i=0; i<=m+1; i++) free(trans[i]);
   return count;
}



