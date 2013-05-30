all: test

test: beauty.hs in.txt out.txt
	./test.sh

guard: Guardfile
	bundle exec guard
