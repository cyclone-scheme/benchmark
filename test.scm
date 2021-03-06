(import (scheme base)
        (cyclone test)
        (cyclone benchmark))

(define (fib n)
  (if (< n 2)
      n
      (+ (fib (- n 1)) (fib (- n 2)))))

(test-begin)
(test-assert (elapsed (fib 20)))
(test-end)

