all: test

test: beauty.hs in.txt out.txt
	./test.sh

guard: Guardfile
	bundle exec guard

lint: beauty.hs
	hlint beauty.hs
