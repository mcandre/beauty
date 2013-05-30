# beauty - a Facebook puzzle

# ABOUT

A Haskell solver for the `n - 2^k` problem.

# SUMMARY

Two players are playing a game. A number `n` is written on a board. Players take turns attempting to replace `n` on the board with `n - 2^k` such that `k in [0 .. lg n]` and `beauty(n) = beauty(n - 2^k)`. If the current player cannot do this, his opponent wins.

Given STDIN of the format:

    T
    X
    X
    X
    .
    .
    .

Where `T` is the number of test cases and `X` is a starting board number, determine who would win either the First or Second Player.

# SAMPLE INPUT

    $ cat in.txt 
    7
    1
    2
    8
    16
    42
    1000
    123

# SAMPLE OUTPUT

    $ cat out.txt 
    Second Player
    First Player
    First Player
    Second Player
    Second Player
    First Player
    Second Player

# REQUIREMENTS

* [Haskell](http://www.haskell.org/)

# DEVELOPMENT

Local continuous integration while you code:

    $ bundle

    $ make guard
    >...

# Linting

    $ cabal install hlint
    $ make lint

# EXAMPLE

`make test` displays little output when the code works as expected.

    $ make test
    ./test.sh
    $
