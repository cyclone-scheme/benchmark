# benchmark

## Index 
- [Intro](#Intro)
- [Dependencies](#Dependencies)
- [Test dependencies](#Test-dependencies)
- [Foreign dependencies](#Foreign-dependencies)
- [API](#API)
- [Examples](#Examples)
- [Author(s)](#Author(s))
- [Maintainer(s)](#Maintainer(s))
- [Version](#Version) 
- [License](#License) 
- [Tags](#Tags) 

## Intro 
A very simple benchmark library

## Dependencies 
None

## Test-dependencies 
None

## Foreign-dependencies 
None

## API 

### (cyclone benchmark)

#### [syntax]   `(elapsed [n] procedure-call)`
Benchmark the `procedure-call` repeating it `n` times. `n` defaults to `5`.

#### [procedure]   `(perf-counter)`
Returns seconds elapsed of a monotonic clock. Used by `elapsed` to calculate procedure performance.


## Examples
```scheme
(import (scheme base)
        (cyclone benchmark))

(define (fib n)
  (if (< n 2)
      n
      (+ (fib (- n 1)) (fib (- n 2)))))

(elapsed (fib 20))
;; => 0.000"0.1.0"323  (in seconds)
```

## Author(s)
Arthur Maciel

## Maintainer(s) 
Arthur Maciel

## Version 
"0.1.0"

## License 
BSD

## Tags 
benchmark
