(defpackage submarine-bingo
  (:use :cl))
(in-package :submarine-bingo)

;; From https://stackoverflow.com/a/59048247

(defun chunked (seq size)
  (let* ((total (length seq))
         (amount (ceiling total size))
         (res '()))
    (dotimes (i amount res)
      (push (subseq seq (* i size) (min (* (1+ i) size) total))
            res))))

(defun join-lines-with-space (lines)
  (eval (append '(concatenate 'string)
                (mapcar (lambda (number) (concatenate 'string number " "))
                        lines))))

(let*
    ((input-file-path (asdf:system-relative-pathname :submarine-bingo "../input"))
     (input (uiop:read-file-string input-file-path))
     (lines (uiop:split-string input :separator '(#\Newline)))
     (called-numbers (car lines))
     (board-lines (cdr lines))
     (board-numbers-text (join-lines-with-space board-lines))
     (board-numbers-sexp (concatenate 'string "(" board-numbers-text ")"))
     (board-numbers (read-from-string board-numbers-sexp))
     (boards (chunked board-numbers 25)))
 boards)
