BIN=bin/beauty

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is Beauty

all: test

test: $(BIN) in.txt out.txt
	bash -c 'diff <( $(BIN) < in.txt ) out.txt'

$(BIN): Beauty.hs
	mkdir -p bin/
	ghc $(FLAGS) -o $(BIN) Beauty.hs

guard: Guardfile
	bundle exec guard

lint: beauty.hs
	hlint beauty.hs

clean:
	-rm -rf bin/
	-rm *.o
	-rm *.hi
