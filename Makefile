CC = gcc
CFLAGS = -Wall -O3

all:random_distribution	

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

hash5: algos/hash5.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/hash5.o entropy.o text/text_generator.o text/benchmarks.o -o hash5 -lm

hash8: algos/hash8.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/hash8.o entropy.o text/text_generator.o text/benchmarks.o -o hash8 -lm

ssef: algos/ssef.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/ssef.o entropy.o text/text_generator.o text/benchmarks.o -o ssef -lm

sa: algos/sa.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/sa.o entropy.o text/text_generator.o text/benchmarks.o -o sa -lm

aoso2: algos/aoso2.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/aoso2.o entropy.o text/text_generator.o text/benchmarks.o -o aoso2 -lm

hash3: algos/hash3.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/hash3.o entropy.o text/text_generator.o text/benchmarks.o -o hash3 -lm

ebom: algos/ebom.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/ebom.o entropy.o text/text_generator.o text/benchmarks.o -o ebom -lm

bndmq4: algos/bndmq4.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/bndmq4.o entropy.o text/text_generator.o text/benchmarks.o -o bndmq4 -lm

sbndmq4:  algos/sbndmq4.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/sbndmq4.o entropy.o text/text_generator.o text/benchmarks.o -o sbndmq4 -lm

tvsbs: algos/tvsbs.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/tvsbs.o entropy.o text/text_generator.o text/benchmarks.o -o tvsbs -lm

fsbndm: algos/fsbndm.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/fsbndm.o entropy.o text/text_generator.o text/benchmarks.o -o fsbndm -lm

fs: algos/fs.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/fs.o entropy.o text/text_generator.o text/benchmarks.o -o fs -lm

fjs: algos/fjs.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/fjs.o entropy.o text/text_generator.o text/benchmarks.o -o fjs -lm

kbndm: algos/kbndm.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/kbndm.o entropy.o text/text_generator.o text/benchmarks.o -o kbndm -lm

aoso6: algos/aoso6.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/aoso6.o entropy.o text/text_generator.o text/benchmarks.o -o aoso6 -lm

bmh-sbndm: algos/bmh-sbndm.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/bmh-sbndm.o entropy.o text/text_generator.o text/benchmarks.o -o bmh-sbndm -lm

sbndm-bmh: algos/sbndm-bmh.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/sbndm-bmh.o entropy.o text/text_generator.o text/benchmarks.o -o sbndm-bmh -lm

tunedbm: algos/tunedbm.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/tunedbm.o entropy.o text/text_generator.o text/benchmarks.o -o tunedbm -lm

graspm: algos/graspm.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/graspm.o entropy.o text/text_generator.o text/benchmarks.o -o graspm -lm

lbndm: algos/lbndm.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/lbndm.o entropy.o text/text_generator.o text/benchmarks.o -o lbndm -lm

naif_xp_papi: text/naif_xp_papi.o entropy.o text/text_generator.o text/text_algorithm.o
	gcc $(CFLAGS) text/naif_xp_papi.o entropy.o text/text_generator.o text/text_algorithm.o -o naif_xp_papi -lm

ag_papi: algos/ag.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/ag.o entropy.o text/text_generator.o text/benchmarks_papi.o -o ag_papi -lm

kmp2: algos/kmp.o entropy.o text/text_generator.o text/benchmarks_papi.o
	gcc $(CFLAGS) algos/kmp.o entropy.o text/text_generator.o text/benchmarks_papi.o -o kmp2_papi -lm


clean:
	rm *.o text/*.o
	rm -f random_distribution
	rm -f naif_xp
	rm -f kmp
