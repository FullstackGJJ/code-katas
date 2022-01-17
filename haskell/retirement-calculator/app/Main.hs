module Main where

import Data.Time.Clock
import Data.Time.Calendar
import Text.Printf

main :: IO ()
main = do
    putStrLn "What is your current age?"
    inputCurrentAge <- getLine
    let currentAge = read inputCurrentAge :: Integer
    putStrLn "At what age would you like to retire?"
    inputRetirementAge <- getLine
    let retirementAge = read inputRetirementAge :: Integer
    (currentYear, _, _) <- getCurrentTime >>= return . toGregorian . utctDay
    if retirementAge - currentAge < 0
    then do 
        putStrLn "You can already retire"
    else do 
        putStrLn (printf "You have %d years until you can retire" (retirementAge - currentAge))
        putStrLn (printf "The year is %d, so you can retire in %d" currentYear (currentYear + (retirementAge - currentAge)))
