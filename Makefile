CC = gcc
CFLAGS = -Wall -O3

all:random_distribution	

algos: naif_xp kmp kmp2 ag aoso2 aoso6 bmh-sbndm bndmq4 ebom fjs fs fsbndm graspm hash3 hash5 hash8 kbndm lbndm sa sbndm-bmh sbndmq4 ssef tunedbm tvsbs

algos_papi: naif_xp_papi kmp_papi kmp2_papi ag_papi aoso2_papi aoso6_papi bmh-sbndm_papi bndmq4_papi ebom_papi fjs_papi fs_papi fsbndm_papi graspm_papi hash3_papi hash5_papi hash8_papi kbndm_papi lbndm_papi sa_papi sbndm-bmh_papi sbndmq4_papi ssef_papi tunedbm_papi tvsbs_papi

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



naif_xp_dist: text/naif_xp_dist.o entropy.o text/text_generator.o text/text_algorithm.o
	gcc $(CFLAGS) text/naif_xp_dist.o entropy.o text/text_generator.o text/text_algorithm.o -o naif_xp -lm

kmp_dist: text/kmp_dist.o entropy.o text/text_generator.o text/text_algorithm.o
	gcc $(CFLAGS) text/kmp_dist.o entropy.o text/text_generator.o text/text_algorithm.o -o kmp -lm

kmp2_dist: algos/kmp.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/kmp.o entropy.o text/text_generator.o text/benchmarks_dist.o -o kmp2 -lm

ag_dist: algos/ag.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/ag.o entropy.o text/text_generator.o text/benchmarks_dist.o -o ag -lm

aoso2_dist: algos/aoso2.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/aoso2.o entropy.o text/text_generator.o text/benchmarks_dist.o -o aoso2 -lm

aoso6_dist: algos/aoso6.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/aoso6.o entropy.o text/text_generator.o text/benchmarks_dist.o -o aoso6 -lm

bmh-sbndm_dist: algos/bmh-sbndm.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/bmh-sbndm.o entropy.o text/text_generator.o text/benchmarks_dist.o -o bmh-sbndm -lm

bndmq4_dist: algos/bndmq4.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/bndmq4.o entropy.o text/text_generator.o text/benchmarks_dist.o -o bndmq4 -lm

ebom_dist: algos/ebom.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/ebom.o entropy.o text/text_generator.o text/benchmarks_dist.o -o ebom -lm

fjs_dist: algos/fjs.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/fjs.o entropy.o text/text_generator.o text/benchmarks_dist.o -o fjs -lm

fs_dist: algos/fs.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/fs.o entropy.o text/text_generator.o text/benchmarks_dist.o -o fs -lm

fsbndm_dist: algos/fsbndm.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/fsbndm.o entropy.o text/text_generator.o text/benchmarks_dist.o -o fsbndm -lm

graspm_dist: algos/graspm.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/graspm.o entropy.o text/text_generator.o text/benchmarks_dist.o -o graspm -lm

hash3_dist: algos/hash3.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/hash3.o entropy.o text/text_generator.o text/benchmarks_dist.o -o hash3 -lm

hash5_dist: algos/hash5.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/hash5.o entropy.o text/text_generator.o text/benchmarks_dist.o -o hash5 -lm

hash8_dist: algos/hash8.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/hash8.o entropy.o text/text_generator.o text/benchmarks_dist.o -o hash8 -lm

kbndm_dist: algos/kbndm.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/kbndm.o entropy.o text/text_generator.o text/benchmarks_dist.o -o kbndm -lm

lbndm_dist: algos/lbndm.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/lbndm.o entropy.o text/text_generator.o text/benchmarks_dist.o -o lbndm -lm

sa_dist: algos/sa.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/sa.o entropy.o text/text_generator.o text/benchmarks_dist.o -o sa -lm

sbndm-bmh_dist: algos/sbndm-bmh.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/sbndm-bmh.o entropy.o text/text_generator.o text/benchmarks_dist.o -o sbndm-bmh -lm

sbndmq4_dist:  algos/sbndmq4.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/sbndmq4.o entropy.o text/text_generator.o text/benchmarks_dist.o -o sbndmq4 -lm

ssef_dist: algos/ssef.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/ssef.o entropy.o text/text_generator.o text/benchmarks_dist.o -o ssef -lm

tunedbm_dist: algos/tunedbm.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/tunedbm.o entropy.o text/text_generator.o text/benchmarks_dist.o -o tunedbm -lm

tvsbs_dist: algos/tvsbs.o entropy.o text/text_generator.o text/benchmarks_dist.o
	gcc $(CFLAGS) algos/tvsbs.o entropy.o text/text_generator.o text/benchmarks_dist.o -o tvsbs -lm



naif_xp_papi_dist: text/naif_xp_papi_dist.o entropy.o text/text_generator.o text/text_algorithm.o
	gcc $(CFLAGS) text/naif_xp_papi_dist.o entropy.o text/text_generator.o text/text_algorithm.o -o naif_xp_papi -lm -lpapi

kmp_papi_dist: text/kmp_papi_dist.o entropy.o text/text_generator.o text/text_algorithm.o
	gcc $(CFLAGS) text/kmp_papi_dist.o entropy.o text/text_generator.o text/text_algorithm.o -o kmp_papi -lm -lpapi

kmp2_papi_dist: algos/kmp.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/kmp.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o kmp2_papi -lm -lpapi

ag_papi_dist: algos/ag.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/ag.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o ag_papi -lm -lpapi

aoso2_papi_dist: algos/aoso2.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/aoso2.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o aoso2_papi -lm -lpapi

aoso6_papi_dist: algos/aoso6.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/aoso6.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o aoso6_papi -lm -lpapi

bmh-sbndm_papi_dist: algos/bmh-sbndm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/bmh-sbndm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o bmh-sbndm_papi -lm -lpapi

bndmq4_papi_dist: algos/bndmq4.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/bndmq4.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o bndmq4_papi -lm -lpapi

ebom_papi_dist: algos/ebom.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/ebom.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o ebom_papi -lm -lpapi

fjs_papi_dist: algos/fjs.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/fjs.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o fjs_papi -lm -lpapi

fs_papi_dist: algos/fs.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/fs.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o fs_papi -lm -lpapi

fsbndm_papi_dist: algos/fsbndm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/fsbndm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o fsbndm_papi -lm -lpapi

graspm_papi_dist: algos/graspm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/graspm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o graspm_papi -lm -lpapi

hash3_papi_dist: algos/hash3.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/hash3.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o hash3_papi -lm -lpapi

hash5_papi_dist: algos/hash5.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/hash5.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o hash5_papi -lm -lpapi

hash8_papi_dist: algos/hash8.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/hash8.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o hash8_papi -lm -lpapi

kbndm_papi_dist: algos/kbndm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/kbndm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o kbndm_papi -lm -lpapi

lbndm_papi_dist: algos/lbndm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/lbndm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o lbndm_papi -lm -lpapi

sa_papi_dist: algos/sa.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/sa.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o sa_papi -lm -lpapi

sbndm-bmh_papi_dist: algos/sbndm-bmh.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/sbndm-bmh.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o sbndm-bmh_papi -lm -lpapi

sbndmq4_papi_dist:  algos/sbndmq4.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/sbndmq4.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o sbndmq4_papi -lm -lpapi

ssef_papi_dist: algos/ssef.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/ssef.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o ssef_papi -lm -lpapi

tunedbm_papi_dist: algos/tunedbm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/tunedbm.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o tunedbm_papi -lm -lpapi

tvsbs_papi_dist: algos/tvsbs.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o
	gcc $(CFLAGS) algos/tvsbs.o entropy.o text/text_generator.o text/benchmarks_papi_dist.o -o tvsbs_papi -lm -lpapi



clean:
	rm *.o text/*.o algos/*.o Textes/*.o
	rm -f random_distribution
	rm -f naif_xp
	rm -f kmp
