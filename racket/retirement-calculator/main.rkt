#lang racket/base

(module+ main
  (require readline/readline)
  (require racket/date)

  (define current-age (readline "What is your current age? "))
  (define retirement-age (readline "At what age would you like to retire? "))
  (define current-year (date-year (current-date)))
  (define years-to-retire (- (string->number retirement-age) (string->number current-age)))
  (displayln (format "You have ~s years left until you can retire" years-to-retire))
  (displayln (format "It's ~s, so you can retire in ~s" current-year (+ current-year years-to-retire))))
