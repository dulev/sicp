#lang sicp

(#%require "exercise_67.rkt" "exercise_68.rkt" "exercise_69.rkt")

(define rock-alphabet-pairs 
    (list (list 'A 2) (list 'BOOM 1)
          (list 'GET 2) (list 'JOB 2)
          (list 'SHA 3) (list 'NA 16)
          (list 'WAH 1) (list 'YIP 9)))
(define rock-alphabet-decode-tree (generate-huffman-tree rock-alphabet-pairs))
;;; (display rock-alphabet-decode-tree)

(define sample-rock-song
    '(GET A JOB
      SHA NA NA NA NA NA NA NA NA
      GET A JOB
      SHA NA NA NA NA NA NA NA NA
      WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP
      SHA BOOM))
(define encoded-sample-rock-song
    (encode sample-rock-song rock-alphabet-decode-tree))

;;; 84 bits are used for the encoding of the song in a huffman tree.
;;; At least 36 * log2(8) = 108 bits would be needed for fixed length
;;; encoding with an 8-symbol alphabet.

;;; (length sample-rock-song)
;;; (length encoded-sample-rock-song)
;;; (display encoded-sample-rock-song)
;;; (display (decode encoded-sample-rock-song rock-alphabet-decode-tree))