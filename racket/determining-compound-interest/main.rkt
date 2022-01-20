#lang racket/base

(module+ main
  (require readline/readline)
  (require racket/format)

  (define principal-amount
    (string->number (readline "What is the principal amount? ")))
  (define rate
    (string->number (readline "What is the rate? ")))
  (define number-of-years
    (string->number (readline "What is the number of years? ")))
  (define compounding-frequency
    (string->number (readline "What is the number of times the interest is compounded per year? ")))
  (define final-amount 
    (* 
      principal-amount
      (expt 
        (+ 1.0 
           (/ 
             (/ rate 100) 
              compounding-frequency)) 
        (* compounding-frequency number-of-years))))
  (define final-amount-string 
    (~r final-amount #:precision '(= 2)))
  (displayln (format "~s invested at ~s for ~s years compounded ~s per year is $~a"
                   principal-amount
                   rate
                   number-of-years
                   compounding-frequency
                   final-amount-string)))
