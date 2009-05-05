;;;; this doesn't take into consider many cases.
(define (pluralize str amt)
  (if (> amt 1.0)
      (let ((ends-with (string-ref str (- (string-length str) 1))))
        (case ends-with
         ((#\s) (string-append str "es"))
         ((#\h) (string-append str "es"))
         ((#\y) (string-append
                 (substring str (- (string-length str) 2))
                 "ies"))
         (else
          (string-append str "s"))))
      str))

(define (mix . ingredients)
  (define (display-ingredient ingredient)
    (let ((ing (car ingredient))
          (amt (cadr ingredient))
          (unit (caddr ingredient)))
    (printf "~a ~a ~a~n"
            amt
            (pluralize (symbol->string unit) amt)
            ing)))
  (printf "Mix the ingredients:~n")
  (for-each (lambda (x)
              (if (list? x)
                  (display-ingredient x)))
            ingredients))

;;;; we're ignoring the args here
(define (bake temp time . _)
  (let ((amt-temp (car temp))
        (unit-temp (cadr temp))
        (amt-time (car time))
        (unit-time (cadr time)))
    (printf "Bake at ~a ~a for ~a ~a~n"
            amt-temp (pluralize (symbol->string unit-temp) amt-temp)
            amt-time (pluralize (symbol->string unit-time) amt-time))))
          

(define (peppermint-icing)
  (mix '(butter 1/2 cup)
       '(powdered-sugar 2 cups)
       '(vanilla 1 teaspoon)
       '(peppermint-extract 2 teaspoon)
       '(milk 4 tablespoon)))