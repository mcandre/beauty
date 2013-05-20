#!/usr/bin/env runhaskell

import Control.Monad (replicateM_)

data Player
     = FirstPlayer
     | SecondPlayer

instance Show Player where
  show FirstPlayer = "First Player"
  show SecondPlayer = "Second Player"

whoWouldWin :: Int -> Player
whoWouldWin n = FirstPlayer

main :: IO ()
main = do
  testCases' <- getLine
  let testCases = read testCases' :: Int

  replicateM_ testCases $ do
    n' <- getLine
    let n = read n' :: Int
    (print . whoWouldWin) n
