module Main where

import Text.Printf

main :: IO ()
main = do
    putStrLn "What is the principal amount?"
    inputPrincipalAmount <- getLine
    let principalAmount = read inputPrincipalAmount :: Float
    putStrLn "What is the rate?"
    inputRate <- getLine
    let rate = read inputRate :: Float
    putStrLn "What is the number of years?"
    inputNumberOfYears <- getLine
    let numberOfYears = read inputNumberOfYears :: Integer
    putStrLn "What is the number of times the interest is compounded per year?"
    inputAnnualCompoundingFrequency <- getLine
    let annualCompoundingFrequency = read inputAnnualCompoundingFrequency :: Float
    let finalAmount = principalAmount * ((1.0 + ((rate/100) / annualCompoundingFrequency)) ^ (round annualCompoundingFrequency * numberOfYears))
    putStrLn (printf "%s invested at %f for %d years compounded %f per year is $%.2f" inputPrincipalAmount rate numberOfYears annualCompoundingFrequency finalAmount)
