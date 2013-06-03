
(test "beta 1"
  ((beta '(lambda (x) x) 'x 'y) 0)
  '(y . 0))

(test "beta 2"
  ((beta '(lambda (x) x) 'x 'x) 0)
  '((lambda (x) x) . 0))

(test "beta 3"
  ((beta '(lambda (x) x) 'x '(lambda (x) y)) 0)
  '((lambda (x) y) . 0))

(test "beta 4"
  ((beta '(lambda (x) x) 'x '(lambda (y) y)) 0)
  '((lambda (y) y) . 1))

(test "beta 5"
  ((beta '(lambda (x) x) 'x '(lambda (y) (lambda (z) y))) 0)
  '((lambda (y) (lambda (z) y)) . 2))

(test "beta 7"
  ((beta '(lambda (x) x) 'x '(x x)) 0)
  '(((lambda (x) x) (lambda (x) x)) . 2))

(test "bv 1"
  ((bv 'x) 0)
  '(x . 0))

(test "bv 2"
  ((bv '(lambda (x) x)) 0)
  '((lambda (x) x) . 0))

(test "bv 3"
  ((bv '(x ((lambda (x) x) y))) 0)
  '((x y) . 1))

(test "bv 4"
  ((bv '((a b) ((lambda (x) x) y))) 0)
  '(((a b) y) . 1))

(test "bv 5"
  ((bv '((lambda (x) x) (a b))) 0)
  '((a b) . 1))

(test "bv 6"
  ((bv '((lambda (x) x) ((lambda (y) y) z))) 0)
  '(z . 2))

(test "bn 1"
  ((bn 'x) 0)
  '(x . 0))

(test "bn 2"
  ((bn '(lambda (x) x)) 0)
  '((lambda (x) x) . 0))

(test "bn 3"
  ((bn '(x ((lambda (x) x) y))) 0)
  '((x ((lambda (x) x) y)) . 0))

(test "bn 4"
  ((bn '((a b) ((lambda (x) x) y))) 0)
  '(((a b) ((lambda (x) x) y)) . 0))

(test "bn 5"
  ((bn '((lambda (x) x) (a b))) 0)
  '((a b) . 1))

(test "bn 6"
  ((bn '((lambda (x) x) ((lambda (y) y) z))) 0)
  '(z . 2))

(test "ao 1"
  ((ao 'x) 0)
  '(x . 0))

(test "ao 2"
  ((ao '(lambda (x) x)) 0)
  '((lambda (x) x) . 0))

(test "ao 3"
  ((ao '(x ((lambda (x) x) y))) 0)
  '((x y) . 1))

(test "ao 4"
  ((ao '((a b) ((lambda (x) x) y))) 0)
  '(((a b) y) . 1))

(test "ao 5"
  ((ao '((lambda (x) x) (a b))) 0)
  '((a b) . 1))

(test "ao 6"
  ((ao '((lambda (x) x) ((lambda (y) y) z))) 0)
  '(z . 2))

(test "norm 1"
  ((norm 'x) 0)
  '(x . 0))

(test "norm 2"
  ((norm '(lambda (x) x)) 0)
  '((lambda (x) x) . 0))

(test "norm 3"
  ((norm '(x ((lambda (x) x) y))) 0)
  '((x y) . 1))

(test "norm 4"
  ((norm '((a b) ((lambda (x) x) y))) 0)
  '(((a b) y) . 1))

(test "norm 5"
  ((norm '((lambda (x) x) (a b))) 0)
  '((a b) . 1))

(test "norm 6"
  ((norm '((lambda (x) x) ((lambda (y) y) z))) 0)
  '(z . 2))

(test "hn 1"
  ((hn 'x) 0)
  '(x . 0))

(test "hn 2"
  ((hn '(lambda (x) x)) 0)
  '((lambda (x) x) . 0))

(test "hn 3"
  ((hn '(x ((lambda (x) x) y))) 0)
  '((x y) . 1))

(test "hn 4"
  ((hn '((a b) ((lambda (x) x) y))) 0)
  '(((a b) y) . 1))

(test "hn 5"
  ((hn '((lambda (x) x) (a b))) 0)
  '((a b) . 1))

(test "hn 6"
  ((hn '((lambda (x) x) ((lambda (y) y) z))) 0)
  '(z . 2))

(test "jot-bv-interface 1"
  (jot-bv-interface '(0))
  '((lambda (y)
      (lambda (z) (((lambda (x) (lambda (y) x)) z) (y z))))
    .
    10))

(test "jot-bv-interface 2"
  (jot-bv-interface '(1))
  '((lambda (x) (lambda (y) ((lambda (x) x) (x y)))) . 0))

(test "jot-bv-interface 3"
  (jot-bv-interface '(1 1))
  '((lambda (x)
      (lambda (y)
        ((lambda (x) (lambda (y) ((lambda (x) x) (x y)))) (x y))))
    .
    0))

(test "jot-bv-interface 4"
  (jot-bv-interface '(1 0))
  '((lambda (y)
      (lambda (z) (((lambda (x) (lambda (y) x)) z) (y z))))
    .
    23))

(test "jot-bv-interface 5"
  (jot-bv-interface '(0 1))
  '((lambda (x)
      (lambda (y)
        ((lambda (y)
           (lambda (z) (((lambda (x) (lambda (y) x)) z) (y z))))
         (x y))))
    .
    10))

(test "jot-bv-interface 6"
  (jot-bv-interface '(0 0))
  '((lambda (x) (lambda (y) x)) . 43))

(test "jot-bv-interface 7"
  (jot-bv-interface '(1 1 1 0 0))
  '((lambda (x) (lambda (y) x)) . 89))

(test "jot-bv-interface 8"
  (jot-bv-interface '(1 1 1 1 1 0 0 0))
  '((lambda (x) (lambda (y) (lambda (z) ((x z) (y z))))) . 118))

(test "jot-interface 1"
  (jot-interface '(0))
  '((lambda (y) (lambda (z) z)) . 13))

(test "jot-interface 2"
  (jot-interface '(1))
  '((lambda (x) (lambda (y) (x y))) . 1))

(test "jot-interface 3"
  (jot-interface '(1 0))
  '((lambda (y) (lambda (z) z)) . 21))

(test "jot-interface 4"
  (jot-interface '(0 1))
  '((lambda (x) (lambda (y) (lambda (z) z))) . 15))

(test "jot-interface 5"
  (jot-interface '(0 0))
  '((lambda (x) (lambda (y) x)) . 16))

(test "jot-interface 6"
  (jot-interface '(1 1 1 0 0))
  '((lambda (x) (lambda (y) x)) . 74))

(test "jot-interface 7"
  (jot-interface '(1 1 1 1 1 0 0 0))
  '((lambda (x) (lambda (y) (lambda (z) ((x z) (y z))))) . 157))

(test "jot-bn-interface 1"
  (jot-bn-interface '(0))
  '((lambda (y) (lambda (z) (((lambda (x) (lambda (y) x)) z) (y z)))) . 10))

(test "jot-bn-interface 2"
  (jot-bn-interface '(1))
  '((lambda (x) (lambda (y) ((lambda (x) x) (x y)))) . 0))

(test "jot-bn-interface 3"
  (jot-bn-interface '(1 0))
  '((lambda (y) (lambda (z) (((lambda (x) (lambda (y) x)) z) (y z)))) . 23))

(test "jot-bn-interface 4"
  (jot-bn-interface '(0 1))
  '((lambda (x) (lambda (y) ((lambda (y) (lambda (z) (((lambda (x) (lambda (y) x)) z) (y z)))) (x y)))) . 10))

(test "jot-bn-interface 5"
  (jot-bn-interface '(0 0))
  '((lambda (x) (lambda (y) x)) . 34))

(test "jot-bn-interface 6"
  (jot-bn-interface '(1 1 1 0 0))
  '((lambda (x) (lambda (y) x)) . 82))

(test "jot-bn-interface 7"
  (jot-bn-interface '(1 1 1 1 1 0 0 0))
  '((lambda (x) (lambda (y) (lambda (z) ((x z) (y z))))) . 133))

(test "jot-he (0)"
  (jot-he-interface '(0))
  '((lambda (y) (lambda (z) z)) . 13))

(test "jot-he (1)"
  (jot-he-interface '(1))
  '((lambda (x) (lambda (y) ((lambda (x) x) (x y)))) . 0))

;; (test "jot-he (1 0)"
;;   (jot-he-interface '(1 0))
;;   '(lambda (g0) (lambda (z) z)))

(test "jot-he (0 1)"
  (jot-he-interface '(0 1))
  '((lambda (x) (lambda (y) ((lambda (y) (lambda (z) z)) (x y)))) . 13))

(test "jot-he (0 0)"
  (jot-he-interface '(0 0))
  '((lambda (x) (lambda (y) x)) . 16))

(test "jot-he K"
  (jot-he-interface '(1 1 1 0 0))
  '((lambda (x) (lambda (y) x)) . 78))

(test "jot-he S"
  (jot-he-interface '(1 1 1 1 1 0 0 0))
  '((lambda (x) (lambda (y) (lambda (z) ((x z) (y z))))) . 161))

(test "jot-ha (0)"
  (jot-ha-interface '(0))
  '((lambda (y) (lambda (z) z)) . 13))

(test "jot-ha (1)"
  (jot-ha-interface '(1))
  '((lambda (x) (lambda (y) (x y))) . 1))

(test "jot-ha (1 0)"
  (jot-ha-interface '(1 0))
  '((lambda (y) (lambda (z) z)) . 21))

(test "jot-ha (0 1)"
  (jot-ha-interface '(0 1))
  '((lambda (x) (lambda (y) (lambda (z) z))) . 15))

(test "jot-ha (0 0)"
  (jot-ha-interface '(0 0))
  '((lambda (x) (lambda (y) x)) . 16))

(test "jot-ha K"
  (jot-ha-interface '(1 1 1 0 0))
  '((lambda (x) (lambda (y) x)) . 74))

(test "jot-ha S"
  (jot-ha-interface '(1 1 1 1 1 0 0 0))
  '((lambda (x) (lambda (y) (lambda (z) ((x z) (y z))))) . 157))

(test "jot-ao-interface 1"
  (jot-ao-interface '(0))
  '((lambda (y) (lambda (z) z)) . 13))

(test "jot-ao-interface 2"
  (jot-ao-interface '(1))
  '((lambda (x) (lambda (y) (x y))) . 1))

;; (test "jot-ao-interface 3"
;;   (jot-ao-interface '(1 1))
;;   '((lambda (x) (lambda (y) (lambda (g0) ((x y) g0)))) . 8))

;; (test "jot-ao-interface 4"
;;   (jot-ao-interface '(1 0))
;;   '((lambda (g2) (lambda (z) z)) . 34))

(test "jot-ao-interface 5"
  (jot-ao-interface '(0 1))
  '((lambda (x) (lambda (y) (lambda (z) z))) . 15))

(test "jot-ao-interface 6"
  (jot-ao-interface '(0 0))
  '((lambda (x) (lambda (y) x)) . 16))

(test "jot-ao-interface 7"
  (jot-ao-interface '(1 1 1 0 0))
  '((lambda (x) (lambda (y) x)) . 78))

(test "jot-ao-interface 8"
  (jot-ao-interface '(1 1 1 1 1 0 0 0))
  '((lambda (x) (lambda (y) (lambda (z) ((x z) (y z))))) . 161))
;;

(test "jot-hn-interface 2"
  (jot-hn-interface '(1))
  '((lambda (x) (lambda (y) (x y))) . 1))

;; (test "jot-hn-interface 3"
;;   (jot-hn-interface '(1 0))
;;   '((lambda (g0) (lambda (z) z)) . 34))

(test "jot-hn-interface 4"
  (jot-hn-interface '(0 1))
  '((lambda (x) (lambda (y) (lambda (z) z))) . 15))

(test "jot-hn-interface 5"
  (jot-hn-interface '(0 0))
  '((lambda (x) (lambda (y) x)) . 16))

(test "jot-hn-interface 6"
  (jot-hn-interface '(1 1 1 0 0))
  '((lambda (x) (lambda (y) x)) . 78))

(test "jot-hn-interface 7"
  (jot-hn-interface '(1 1 1 1 1 0 0 0))
  '((lambda (x) (lambda (y) (lambda (z) ((x z) (y z))))) . 161))

