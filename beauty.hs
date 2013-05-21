#!/usr/bin/env runhaskell

import Data.Bits (popCount)
import Control.Monad (replicateM_)

data Player = First | Second

instance Show Player where
  show First = "First Player"
  show Second = "Second Player"

turn First = Second
turn Second = First

lg = floor . logBase 2 . fromIntegral

-- Number of 1's in binary representation
beauty = popCount

-- Determines which player would win a game,
-- Given n and a starting player
whoWouldWin :: Player -> Int -> Player
whoWouldWin p 0 = p
whoWouldWin p n = case ns' of
  -- lose to previous player
  [] -> p'

  -- optimal play
  n':_ -> whoWouldWin p' n'
  where
    ns' = [ n' |
            k <- [0 .. lg n],
            let n' = n - 2^k,
            beauty n' == beauty n ]
    p' = turn p

main :: IO ()
main = do
  testCases' <- getLine
  let testCases = read testCases' :: Int

  replicateM_ testCases $ do
    n' <- getLine
    let n = read n' :: Int
    (print . whoWouldWin First) n
