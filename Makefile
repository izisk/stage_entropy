CC = gcc
CFLAGS = -Wall -O3

all:random_distribution	



algos: naif_xp kmp kmp2 ag aoso2 aoso6 bmh-sbndm bndmq4 ebom fjs fs fsbndm graspm hash3 hash5 hash8 kbndm lbndm sa sbndm-bmh sbndmq4 ssef tunedbm tvsbs 
 
algos_papi: naif_xp_papi kmp_papi kmp2_papi ag_papi aoso2_papi aoso6_papi bmh-sbndm_papi bndmq4_papi ebom_papi fjs_papi fs_papi fsbndm_papi graspm_papi hash3_papi hash5_papi hash8_papi kbndm_papi lbndm_papi sa_papi sbndm-bmh_papi sbndmq4_papi ssef_papi tunedbm_papi tvsbs_papi

algos_langnat: naif_xp_langnat kmp_langnat kmp2_langnat ag_langnat aoso2_langnat aoso6_langnat bmh-sbndm_langnat bndmq4_langnat ebom_langnat fjs_langnat fs_langnat fsbndm_langnat graspm_langnat hash3_langnat hash5_langnat hash8_langnat kbndm_langnat lbndm_langnat sa_langnat sbndm-bmh_langnat sbndmq4_langnat ssef_langnat tunedbm_langnat tvsbs_langnat 
 
algos_papi_langnat: naif_xp_papi_langnat kmp_papi_langnat kmp2_papi_langnat ag_papi_langnat aoso2_papi_langnat aoso6_papi_langnat bmh-sbndm_papi_langnat bndmq4_papi_langnat ebom_papi_langnat fjs_papi_langnat fs_papi_langnat fsbndm_papi_langnat graspm_papi_langnat hash3_papi_langnat hash5_papi_langnat hash8_papi_langnat kbndm_papi_langnat lbndm_papi_langnat sa_papi_langnat sbndm-bmh_papi_langnat sbndmq4_papi_langnat ssef_papi_langnat tunedbm_papi_langnat tvsbs_papi_langnat

algos_dist: naif_xp_dist kmp_dist kmp2_dist ag_dist aoso2_dist aoso6_dist bmh-sbndm_dist bndmq4_dist ebom_dist fjs_dist fs_dist fsbndm_dist graspm_dist hash3_dist hash5_dist hash8_dist kbndm_dist lbndm_dist sa_dist sbndm-bmh_dist sbndmq4_dist ssef_dist tunedbm_dist tvsbs_dist

algos_papi_dist: naif_xp_papi_dist kmp_papi_dist kmp2_papi_dist ag_papi_dist aoso2_papi_dist aoso6_papi_dist bmh-sbndm_papi_dist bndmq4_papi_dist ebom_papi_dist fjs_papi_dist fs_papi_dist fsbndm_papi_dist graspm_papi_dist hash3_papi_dist hash5_papi_dist hash8_papi_dist kbndm_papi_dist lbndm_papi_dist sa_papi_dist sbndm-bmh_papi_dist sbndmq4_papi_dist ssef_papi_dist tunedbm_papi_dist tvsbs_papi_dist



random_distribution: random_distribution.o entropy.o
	gcc $(CFLAGS) random_distribution.o entropy.o -o random_distribution -lm



naif_xp: text/naif_xp.o entropy.o text/text_generator.o text/text_algorithm.o
	gcc $(CFLAGS) text/naif_xp.o entropy.o text/text_generator.o text/text_algorithm.o -o naif_xp -lm

kmp: text/kmp.o entropy.o text/text_generator.o text/text_algorithm.o
	gcc $(CFLAGS) text/kmp.o entropy.o text/text_generator.o text/text_algorithm.o -o kmp -lm

kmp2: algos/kmp.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/kmp.o entropy.o text/text_generator.o text/benchmarks.o -o kmp2 -lm

ag: algos/ag.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/ag.o entropy.o text/text_generator.o text/benchmarks.o -o ag -lm

aoso2: algos/aoso2.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/aoso2.o entropy.o text/text_generator.o text/benchmarks.o -o aoso2 -lm

aoso6: algos/aoso6.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/aoso6.o entropy.o text/text_generator.o text/benchmarks.o -o aoso6 -lm

bmh-sbndm: algos/bmh-sbndm.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/bmh-sbndm.o entropy.o text/text_generator.o text/benchmarks.o -o bmh-sbndm -lm

bndmq4: algos/bndmq4.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/bndmq4.o entropy.o text/text_generator.o text/benchmarks.o -o bndmq4 -lm

ebom: algos/ebom.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/ebom.o entropy.o text/text_generator.o text/benchmarks.o -o ebom -lm

fjs: algos/fjs.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/fjs.o entropy.o text/text_generator.o text/benchmarks.o -o fjs -lm

fs: algos/fs.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/fs.o entropy.o text/text_generator.o text/benchmarks.o -o fs -lm

fsbndm: algos/fsbndm.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/fsbndm.o entropy.o text/text_generator.o text/benchmarks.o -o fsbndm -lm

graspm: algos/graspm.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/graspm.o entropy.o text/text_generator.o text/benchmarks.o -o graspm -lm

hash3: algos/hash3.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/hash3.o entropy.o text/text_generator.o text/benchmarks.o -o hash3 -lm

hash5: algos/hash5.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/hash5.o entropy.o text/text_generator.o text/benchmarks.o -o hash5 -lm

hash8: algos/hash8.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/hash8.o entropy.o text/text_generator.o text/benchmarks.o -o hash8 -lm

kbndm: algos/kbndm.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/kbndm.o entropy.o text/text_generator.o text/benchmarks.o -o kbndm -lm

lbndm: algos/lbndm.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/lbndm.o entropy.o text/text_generator.o text/benchmarks.o -o lbndm -lm

sa: algos/sa.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/sa.o entropy.o text/text_generator.o text/benchmarks.o -o sa -lm

sbndm-bmh: algos/sbndm-bmh.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/sbndm-bmh.o entropy.o text/text_generator.o text/benchmarks.o -o sbndm-bmh -lm

sbndmq4:  algos/sbndmq4.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/sbndmq4.o entropy.o text/text_generator.o text/benchmarks.o -o sbndmq4 -lm

ssef: algos/ssef.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/ssef.o entropy.o text/text_generator.o text/benchmarks.o -o ssef -lm

tunedbm: algos/tunedbm.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/tunedbm.o entropy.o text/text_generator.o text/benchmarks.o -o tunedbm -lm

tvsbs: algos/tvsbs.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/tvsbs.o entropy.o text/text_generator.o text/benchmarks.o -o tvsbs -lm



naif_xp_papi: text/naif_xp_papi.o entropy.o text/text_generator.o text/text_algorithm.o
	gcc $(CFLAGS) text/naif_xp_papi.o entropy.o text/text_generator.o text/text_algorithm.o -o naif_xp_papi -lm -lpapi

kmp_papi: text/kmp_papi.o entropy.o text/text_generator.o text/text_algorithm.o
	gcc $(CFLAGS) text/kmp_papi.o entropy.o text/text_generator.o text/text_algorithm.o -o kmp_papi -lm -lpapi

kmp2_papi: algos/kmp.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/kmp.o entropy.o text/text_generator.o text/benchmarks_papi.o -o kmp2_papi -lm -lpapi

ag_papi: algos/ag.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/ag.o entropy.o text/text_generator.o text/benchmarks_papi.o -o ag_papi -lm -lpapi

aoso2_papi: algos/aoso2.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/aoso2.o entropy.o text/text_generator.o text/benchmarks_papi.o -o aoso2_papi -lm -lpapi

aoso6_papi: algos/aoso6.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/aoso6.o entropy.o text/text_generator.o text/benchmarks_papi.o -o aoso6_papi -lm -lpapi

bmh-sbndm_papi: algos/bmh-sbndm.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/bmh-sbndm.o entropy.o text/text_generator.o text/benchmarks_papi.o -o bmh-sbndm_papi -lm -lpapi

bndmq4_papi: algos/bndmq4.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/bndmq4.o entropy.o text/text_generator.o text/benchmarks_papi.o -o bndmq4_papi -lm -lpapi

ebom_papi: algos/ebom.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/ebom.o entropy.o text/text_generator.o text/benchmarks_papi.o -o ebom_papi -lm -lpapi

fjs_papi: algos/fjs.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/fjs.o entropy.o text/text_generator.o text/benchmarks_papi.o -o fjs_papi -lm -lpapi

fs_papi: algos/fs.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/fs.o entropy.o text/text_generator.o text/benchmarks_papi.o -o fs_papi -lm -lpapi

fsbndm_papi: algos/fsbndm.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/fsbndm.o entropy.o text/text_generator.o text/benchmarks_papi.o -o fsbndm_papi -lm -lpapi

graspm_papi: algos/graspm.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/graspm.o entropy.o text/text_generator.o text/benchmarks_papi.o -o graspm_papi -lm -lpapi

hash3_papi: algos/hash3.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/hash3.o entropy.o text/text_generator.o text/benchmarks_papi.o -o hash3_papi -lm -lpapi

hash5_papi: algos/hash5.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/hash5.o entropy.o text/text_generator.o text/benchmarks_papi.o -o hash5_papi -lm -lpapi

hash8_papi: algos/hash8.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/hash8.o entropy.o text/text_generator.o text/benchmarks_papi.o -o hash8_papi -lm -lpapi

kbndm_papi: algos/kbndm.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/kbndm.o entropy.o text/text_generator.o text/benchmarks_papi.o -o kbndm_papi -lm -lpapi

lbndm_papi: algos/lbndm.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/lbndm.o entropy.o text/text_generator.o text/benchmarks_papi.o -o lbndm_papi -lm -lpapi

sa_papi: algos/sa.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/sa.o entropy.o text/text_generator.o text/benchmarks_papi.o -o sa_papi -lm -lpapi

sbndm-bmh_papi: algos/sbndm-bmh.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/sbndm-bmh.o entropy.o text/text_generator.o text/benchmarks_papi.o -o sbndm-bmh_papi -lm -lpapi

sbndmq4_papi:  algos/sbndmq4.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/sbndmq4.o entropy.o text/text_generator.o text/benchmarks_papi.o -o sbndmq4_papi -lm -lpapi

ssef_papi: algos/ssef.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/ssef.o entropy.o text/text_generator.o text/benchmarks_papi.o -o ssef_papi -lm -lpapi

tunedbm_papi: algos/tunedbm.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/tunedbm.o entropy.o text/text_generator.o text/benchmarks_papi.o -o tunedbm_papi -lm -lpapi

tvsbs_papi: algos/tvsbs.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/tvsbs.o entropy.o text/text_generator.o text/benchmarks_papi.o -o tvsbs_papi -lm -lpapi




naif_xp_langnat: Textes/naif_xp_langnat.o text/text_algorithm.o
	gcc $(CFLAGS) Textes/naif_xp_langnat.o text/text_algorithm.o -o naif_xp_langnat -lm

kmp_langnat: Textes/kmp_langnat.o text/text_algorithm.o
	gcc $(CFLAGS) Textes/kmp_langnat.o text/text_algorithm.o -o kmp_langnat -lm

kmp2_langnat: algos/kmp.o Textes/benchmarks_langnat.o
	gcc $(CFLAGS) algos/kmp.o Textes/benchmarks_langnat.o -o kmp2_langnat -lm

ag_langnat: algos/ag.o Textes/benchmarks_langnat.o
	gcc $(CFLAGS) algos/ag.o Textes/benchmarks_langnat.o -o ag_langnat -lm

aoso2_langnat: algos/aoso2.o Textes/benchmarks_langnat.o
	gcc $(CFLAGS) algos/aoso2.o Textes/benchmarks_langnat.o -o aoso2_langnat -lm

aoso6_langnat: algos/aoso6.o Textes/benchmarks_langnat.o
	gcc $(CFLAGS) algos/aoso6.o Textes/benchmarks_langnat.o -o aoso6_langnat -lm

bmh-sbndm_langnat: algos/bmh-sbndm.o Textes/benchmarks_langnat.o
	gcc $(CFLAGS) algos/bmh-sbndm.o Textes/benchmarks_langnat.o -o bmh-sbndm_langnat -lm

bndmq4_langnat: algos/bndmq4.o Textes/benchmarks_langnat.o
	gcc $(CFLAGS) algos/bndmq4.o Textes/benchmarks_langnat.o -o bndmq4_langnat -lm

ebom_langnat: algos/ebom.o Textes/benchmarks_langnat.o
	gcc $(CFLAGS) algos/ebom.o Textes/benchmarks_langnat.o -o ebom_langnat -lm

fjs_langnat: algos/fjs.o Textes/benchmarks_langnat.o
	gcc $(CFLAGS) algos/fjs.o Textes/benchmarks_langnat.o -o fjs_langnat -lm

fs_langnat: algos/fs.o Textes/benchmarks_langnat.o
	gcc $(CFLAGS) algos/fs.o Textes/benchmarks_langnat.o -o fs_langnat -lm

fsbndm_langnat: algos/fsbndm.o Textes/benchmarks_langnat.o
	gcc $(CFLAGS) algos/fsbndm.o Textes/benchmarks_langnat.o -o fsbndm_langnat -lm

graspm_langnat: algos/graspm.o Textes/benchmarks_langnat.o
	gcc $(CFLAGS) algos/graspm.o Textes/benchmarks_langnat.o -o graspm_langnat -lm

hash3_langnat: algos/hash3.o Textes/benchmarks_langnat.o
	gcc $(CFLAGS) algos/hash3.o Textes/benchmarks_langnat.o -o hash3_langnat -lm

hash5_langnat: algos/hash5.o Textes/benchmarks_langnat.o
	gcc $(CFLAGS) algos/hash5.o Textes/benchmarks_langnat.o -o hash5_langnat -lm

hash8_langnat: algos/hash8.o Textes/benchmarks_langnat.o
	gcc $(CFLAGS) algos/hash8.o Textes/benchmarks_langnat.o -o hash8_langnat -lm

kbndm_langnat: algos/kbndm.o Textes/benchmarks_langnat.o
	gcc $(CFLAGS) algos/kbndm.o Textes/benchmarks_langnat.o -o kbndm_langnat -lm

lbndm_langnat: algos/lbndm.o Textes/benchmarks_langnat.o
	gcc $(CFLAGS) algos/lbndm.o Textes/benchmarks_langnat.o -o lbndm_langnat -lm

sa_langnat: algos/sa.o Textes/benchmarks_langnat.o
	gcc $(CFLAGS) algos/sa.o Textes/benchmarks_langnat.o -o sa_langnat -lm

sbndm-bmh_langnat: algos/sbndm-bmh.o Textes/benchmarks_langnat.o
	gcc $(CFLAGS) algos/sbndm-bmh.o Textes/benchmarks_langnat.o -o sbndm-bmh_langnat -lm

sbndmq4_langnat:  algos/sbndmq4.o Textes/benchmarks_langnat.o
	gcc $(CFLAGS) algos/sbndmq4.o Textes/benchmarks_langnat.o -o sbndmq4_langnat -lm

ssef_langnat: algos/ssef.o Textes/benchmarks_langnat.o
	gcc $(CFLAGS) algos/ssef.o Textes/benchmarks_langnat.o -o ssef_langnat -lm

tunedbm_langnat: algos/tunedbm.o Textes/benchmarks_langnat.o
	gcc $(CFLAGS) algos/tunedbm.o Textes/benchmarks_langnat.o -o tunedbm_langnat -lm

tvsbs_langnat: algos/tvsbs.o Textes/benchmarks_langnat.o
	gcc $(CFLAGS) algos/tvsbs.o Textes/benchmarks_langnat.o -o tvsbs_langnat -lm



naif_xp_papi_langnat: Textes/naif_xp_papi_langnat.o text/text_algorithm.o
	gcc $(CFLAGS) Textes/naif_xp_papi_langnat.o text/text_algorithm.o -o naif_xp_papi_langnat -lm -lpapi

kmp_papi_langnat: Textes/kmp_papi_langnat.o text/text_algorithm.o
	gcc $(CFLAGS) Textes/kmp_papi_langnat.o text/text_algorithm.o -o kmp_papi_langnat -lm -lpapi

kmp2_papi_langnat: algos/kmp.o Textes/benchmarks_papi_langnat.o
	gcc $(CFLAGS) algos/kmp.o Textes/benchmarks_papi_langnat.o -o kmp2_papi_langnat -lm -lpapi

ag_papi_langnat: algos/ag.o Textes/benchmarks_papi_langnat.o
	gcc $(CFLAGS) algos/ag.o Textes/benchmarks_papi_langnat.o -o ag_papi_langnat -lm -lpapi

aoso2_papi_langnat: algos/aoso2.o Textes/benchmarks_papi_langnat.o
	gcc $(CFLAGS) algos/aoso2.o Textes/benchmarks_papi_langnat.o -o aoso2_papi_langnat -lm -lpapi

aoso6_papi_langnat: algos/aoso6.o Textes/benchmarks_papi_langnat.o
	gcc $(CFLAGS) algos/aoso6.o Textes/benchmarks_papi_langnat.o -o aoso6_papi_langnat -lm -lpapi

bmh-sbndm_papi_langnat: algos/bmh-sbndm.o Textes/benchmarks_papi_langnat.o
	gcc $(CFLAGS) algos/bmh-sbndm.o Textes/benchmarks_papi_langnat.o -o bmh-sbndm_papi_langnat -lm -lpapi

bndmq4_papi_langnat: algos/bndmq4.o Textes/benchmarks_papi_langnat.o
	gcc $(CFLAGS) algos/bndmq4.o Textes/benchmarks_papi_langnat.o -o bndmq4_papi_langnat -lm -lpapi

ebom_papi_langnat: algos/ebom.o Textes/benchmarks_papi_langnat.o
	gcc $(CFLAGS) algos/ebom.o Textes/benchmarks_papi_langnat.o -o ebom_papi_langnat -lm -lpapi

fjs_papi_langnat: algos/fjs.o Textes/benchmarks_papi_langnat.o
	gcc $(CFLAGS) algos/fjs.o Textes/benchmarks_papi_langnat.o -o fjs_papi_langnat -lm -lpapi

fs_papi_langnat: algos/fs.o Textes/benchmarks_papi_langnat.o
	gcc $(CFLAGS) algos/fs.o Textes/benchmarks_papi_langnat.o -o fs_papi_langnat -lm -lpapi

fsbndm_papi_langnat: algos/fsbndm.o Textes/benchmarks_papi_langnat.o
	gcc $(CFLAGS) algos/fsbndm.o Textes/benchmarks_papi_langnat.o -o fsbndm_papi_langnat -lm -lpapi

graspm_papi_langnat: algos/graspm.o Textes/benchmarks_papi_langnat.o
	gcc $(CFLAGS) algos/graspm.o Textes/benchmarks_papi_langnat.o -o graspm_papi_langnat -lm -lpapi

hash3_papi_langnat: algos/hash3.o Textes/benchmarks_papi_langnat.o
	gcc $(CFLAGS) algos/hash3.o Textes/benchmarks_papi_langnat.o -o hash3_papi_langnat -lm -lpapi

hash5_papi_langnat: algos/hash5.o Textes/benchmarks_papi_langnat.o
	gcc $(CFLAGS) algos/hash5.o Textes/benchmarks_papi_langnat.o -o hash5_papi_langnat -lm -lpapi

hash8_papi_langnat: algos/hash8.o Textes/benchmarks_papi_langnat.o
	gcc $(CFLAGS) algos/hash8.o Textes/benchmarks_papi_langnat.o -o hash8_papi_langnat -lm -lpapi

kbndm_papi_langnat: algos/kbndm.o Textes/benchmarks_papi_langnat.o
	gcc $(CFLAGS) algos/kbndm.o Textes/benchmarks_papi_langnat.o -o kbndm_papi_langnat -lm -lpapi

lbndm_papi_langnat: algos/lbndm.o Textes/benchmarks_papi_langnat.o
	gcc $(CFLAGS) algos/lbndm.o Textes/benchmarks_papi_langnat.o -o lbndm_papi_langnat -lm -lpapi

sa_papi_langnat: algos/sa.o Textes/benchmarks_papi_langnat.o
	gcc $(CFLAGS) algos/sa.o Textes/benchmarks_papi_langnat.o -o sa_papi_langnat -lm -lpapi

sbndm-bmh_papi_langnat: algos/sbndm-bmh.o Textes/benchmarks_papi_langnat.o
	gcc $(CFLAGS) algos/sbndm-bmh.o Textes/benchmarks_papi_langnat.o -o sbndm-bmh_papi_langnat -lm -lpapi

sbndmq4_papi_langnat:  algos/sbndmq4.o Textes/benchmarks_papi_langnat.o
	gcc $(CFLAGS) algos/sbndmq4.o Textes/benchmarks_papi_langnat.o -o sbndmq4_papi_langnat -lm -lpapi

ssef_papi_langnat: algos/ssef.o Textes/benchmarks_papi_langnat.o
	gcc $(CFLAGS) algos/ssef.o Textes/benchmarks_papi_langnat.o -o ssef_papi_langnat -lm -lpapi

tunedbm_papi_langnat: algos/tunedbm.o Textes/benchmarks_papi_langnat.o
	gcc $(CFLAGS) algos/tunedbm.o Textes/benchmarks_papi_langnat.o -o tunedbm_papi_langnat -lm -lpapi

tvsbs_papi_langnat: algos/tvsbs.o Textes/benchmarks_papi_langnat.o
	gcc $(CFLAGS) algos/tvsbs.o Textes/benchmarks_papi_langnat.o -o tvsbs_papi_langnat -lm -lpapi



naif_xp_dist: text/naif_xp_dist.o entropy.o text/text_generator.o text/text_algorithm.o
	gcc $(CFLAGS) text/naif_xp_dist.o entropy.o text/text_generator.o text/text_algorithm.o -o naif_xp_dist -lm

kmp_dist: text/kmp_dist.o entropy.o text/text_generator.o text/text_algorithm.o
	gcc $(CFLAGS) text/kmp_dist.o entropy.o text/text_generator.o text/text_algorithm.o -o kmp_dist -lm

kmp2_dist: algos/kmp.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/kmp.o entropy.o text/text_generator.o text/benchmarks_dist.o -o kmp2_dist -lm

ag_dist: algos/ag.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/ag.o entropy.o text/text_generator.o text/benchmarks_dist.o -o ag_dist -lm

aoso2_dist: algos/aoso2.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/aoso2.o entropy.o text/text_generator.o text/benchmarks_dist.o -o aoso2_dist -lm

aoso6_dist: algos/aoso6.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/aoso6.o entropy.o text/text_generator.o text/benchmarks_dist.o -o aoso6_dist -lm

bmh-sbndm_dist: algos/bmh-sbndm.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/bmh-sbndm.o entropy.o text/text_generator.o text/benchmarks_dist.o -o bmh-sbndm_dist -lm

bndmq4_dist: algos/bndmq4.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/bndmq4.o entropy.o text/text_generator.o text/benchmarks_dist.o -o bndmq4_dist -lm

ebom_dist: algos/ebom.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/ebom.o entropy.o text/text_generator.o text/benchmarks_dist.o -o ebom_dist -lm

fjs_dist: algos/fjs.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/fjs.o entropy.o text/text_generator.o text/benchmarks_dist.o -o fjs_dist -lm

fs_dist: algos/fs.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/fs.o entropy.o text/text_generator.o text/benchmarks_dist.o -o fs_dist -lm

fsbndm_dist: algos/fsbndm.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/fsbndm.o entropy.o text/text_generator.o text/benchmarks_dist.o -o fsbndm_dist -lm

graspm_dist: algos/graspm.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/graspm.o entropy.o text/text_generator.o text/benchmarks_dist.o -o graspm_dist -lm

hash3_dist: algos/hash3.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/hash3.o entropy.o text/text_generator.o text/benchmarks_dist.o -o hash3_dist -lm

hash5_dist: algos/hash5.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/hash5.o entropy.o text/text_generator.o text/benchmarks_dist.o -o hash5_dist -lm

hash8_dist: algos/hash8.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/hash8.o entropy.o text/text_generator.o text/benchmarks_dist.o -o hash8_dist -lm

kbndm_dist: algos/kbndm.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/kbndm.o entropy.o text/text_generator.o text/benchmarks_dist.o -o kbndm_dist -lm

lbndm_dist: algos/lbndm.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/lbndm.o entropy.o text/text_generator.o text/benchmarks_dist.o -o lbndm_dist -lm

sa_dist: algos/sa.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/sa.o entropy.o text/text_generator.o text/benchmarks_dist.o -o sa_dist -lm

sbndm-bmh_dist: algos/sbndm-bmh.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/sbndm-bmh.o entropy.o text/text_generator.o text/benchmarks_dist.o -o sbndm-bmh_dist -lm

sbndmq4_dist:  algos/sbndmq4.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/sbndmq4.o entropy.o text/text_generator.o text/benchmarks_dist.o -o sbndmq4_dist -lm

ssef_dist: algos/ssef.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/ssef.o entropy.o text/text_generator.o text/benchmarks_dist.o -o ssef_dist -lm

tunedbm_dist: algos/tunedbm.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/tunedbm.o entropy.o text/text_generator.o text/benchmarks_dist.o -o tunedbm_dist -lm

tvsbs_dist: algos/tvsbs.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/tvsbs.o entropy.o text/text_generator.o text/benchmarks_dist.o -o tvsbs_dist -lm



naif_xp_papi_dist: text/naif_xp_papi_dist.o entropy.o text/text_generator.o text/text_algorithm.o
	gcc $(CFLAGS) text/naif_xp_papi_dist.o entropy.o text/text_generator.o text/text_algorithm.o -o naif_xp_papi_dist -lm -lpapi

kmp_papi_dist: text/kmp_papi_dist.o entropy.o text/text_generator.o text/text_algorithm.o
	gcc $(CFLAGS) text/kmp_papi_dist.o entropy.o text/text_generator.o text/text_algorithm.o -o kmp_papi_dist -lm -lpapi

kmp2_papi_dist: algos/kmp.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/kmp.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o kmp2_papi_dist -lm -lpapi

ag_papi_dist: algos/ag.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/ag.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o ag_papi_dist -lm -lpapi

aoso2_papi_dist: algos/aoso2.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/aoso2.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o aoso2_papi_dist -lm -lpapi

aoso6_papi_dist: algos/aoso6.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/aoso6.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o aoso6_papi_dist -lm -lpapi

bmh-sbndm_papi_dist: algos/bmh-sbndm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/bmh-sbndm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o bmh-sbndm_papi_dist -lm -lpapi

bndmq4_papi_dist: algos/bndmq4.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/bndmq4.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o bndmq4_papi_dist -lm -lpapi

ebom_papi_dist: algos/ebom.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/ebom.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o ebom_papi_dist -lm -lpapi

fjs_papi_dist: algos/fjs.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/fjs.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o fjs_papi_dist -lm -lpapi

fs_papi_dist: algos/fs.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/fs.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o fs_papi_dist -lm -lpapi

fsbndm_papi_dist: algos/fsbndm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/fsbndm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o fsbndm_papi_dist -lm -lpapi

graspm_papi_dist: algos/graspm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/graspm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o graspm_papi_dist -lm -lpapi

hash3_papi_dist: algos/hash3.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/hash3.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o hash3_papi_dist -lm -lpapi

hash5_papi_dist: algos/hash5.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/hash5.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o hash5_papi_dist -lm -lpapi

hash8_papi_dist: algos/hash8.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/hash8.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o hash8_papi_dist -lm -lpapi

kbndm_papi_dist: algos/kbndm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/kbndm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o kbndm_papi_dist -lm -lpapi

lbndm_papi_dist: algos/lbndm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/lbndm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o lbndm_papi_dist -lm -lpapi

sa_papi_dist: algos/sa.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/sa.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o sa_papi_dist -lm -lpapi

sbndm-bmh_papi_dist: algos/sbndm-bmh.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/sbndm-bmh.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o sbndm-bmh_papi_dist -lm -lpapi

sbndmq4_papi_dist:  algos/sbndmq4.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/sbndmq4.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o sbndmq4_papi_dist -lm -lpapi

ssef_papi_dist: algos/ssef.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/ssef.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o ssef_papi_dist -lm -lpapi

tunedbm_papi_dist: algos/tunedbm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/tunedbm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o tunedbm_papi_dist -lm -lpapi

tvsbs_papi_dist: algos/tvsbs.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/tvsbs.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o tvsbs_papi_dist -lm -lpapi




clean:
	rm *.o text/*.o algos/*.o Textes/*.o
	rm -f random_distribution
	rm -f naif_xp
	rm -f kmp
