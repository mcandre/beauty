BIN=beauty

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is Beauty

all: test

test: test.sh $(BIN) in.txt out.txt
	bash -c 'diff <( ./beauty < in.txt ) out.txt'

$(BIN): Beauty.hs
	ghc $(FLAGS) -o beauty Beauty.hs

guard: Guardfile
	bundle exec guard

lint: beauty.hs
	hlint beauty.hs

clean:
	-rm $(BIN)
	-rm *.exe
	-rm *.o
	-rm *.hi
