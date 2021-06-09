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

clean:
	rm *.o text/*.o
	rm -f random_distribution
	rm -f naif_xp
	rm -f kmp
