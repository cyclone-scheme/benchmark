(define-library (cyclone benchmark)
  (import (scheme base))
  (export elapsed
          perf-counter)
  (include-c-header "<time.h>")
  (begin
    (define-c perf-counter
      "(void *data, int argc, closure _, object k)"
      "struct timespec now;
       clock_gettime(CLOCK_MONOTONIC, &now);
       make_double(res, ((double)(now.tv_sec) + (double)(now.tv_nsec/1.0e9)));
       return_closcall1(data, k, &res);")

    (define-syntax elapsed
      (syntax-rules ()
        ((_ proc)
         (elapsed 5 proc))
        ((_ n proc)
         (let loop ((i 0)
                    (min-time (expt 2 100)))
           (if (= i n)
               min-time
               (begin
                 (define t1 (perf-counter))        
                 proc
                 (define t2 (- (perf-counter) t1))
                 (loop (+ i 1)
                       (min min-time t2))))))))))
