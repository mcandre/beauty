#!/usr/bin/env runhaskell

module Beauty where

import Data.Bits (popCount)
import Control.Monad (replicateM_)

data Player = P Bool

firstPlayer :: Player
firstPlayer = P True

instance Show Player where
  show (P b) = order ++ " Player"
    where
      order = if b then "First" else "Second"

turn :: Player -> Player
turn (P b) = P (not b)

-- Wrap logBase 2 over integers
lg :: (Integral a) => a -> a
lg = floor . logBase (2.0 :: Double) . fromIntegral

-- Number of 1's in binary representation
beauty :: Int -> Int
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
    -- brute force
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
    (print . whoWouldWin firstPlayer) n
