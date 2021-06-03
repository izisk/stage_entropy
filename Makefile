CC = gcc
CFLAGS = -Wall -O3

all:random_distribution	

random_distribution: random_distribution.o entropy.o
	gcc $(CFLAGS) random_distribution.o entropy.o -o random_distribution -lm

naif_xp: text/naif_xp.o entropy.o text/text_generator.o text/text_algorithm.o
	gcc $(CFLAGS) text/naif_xp.o entropy.o text/text_generator.o text/text_algorithm.o -o naif_xp -lm

kmp: text/kmp.o entropy.o text/text_generator.o text/text_algorithm.o
	gcc $(CFLAGS) text/kmp.o entropy.o text/text_generator.o text/text_algorithm.o -o kmp -lm

ag: algos/ag.o entropy.o text/text_generator.o text/benchmarks.o
	gcc $(CFLAGS) algos/ag.o entropy.o text/text_generator.o text/benchmarks.o -o ag -lm

clean:
	rm *.o text/*.o
	rm -f random_distribution
	rm -f naif_xp
	rm -f kmp
