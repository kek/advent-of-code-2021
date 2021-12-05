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

(defparameter *input-lines*
  (let*
    ((input-file-path (asdf:system-relative-pathname :submarine-bingo "input"))
     (input (uiop:read-file-string input-file-path)))
    (uiop:split-string input :separator '(#\Newline))))

(defparameter *number-calling-sequence*
  (read-from-string
   (concatenate 'string "("
                  (substitute #\Space #\, (car *input-lines*))
                  ")")))

(defparameter *boards*
  (let*
      ((board-lines (cdr *input-lines*))
       (board-numbers-text (join-lines-with-space board-lines))
       (board-numbers-sexp (concatenate 'string "(" board-numbers-text ")"))
       (board-numbers (read-from-string board-numbers-sexp))
       (boards (chunked board-numbers 25)))
   boards))

(defun row (board n)
  (nth n board))

(defun column (board n)
  (mapcar (lambda (row) (nth n row))
          (rows board)))

(defun columns (board)
  (mapcar (lambda (i) (column board i))
          '(0 1 2 3 4)))

(defun rows (board)
  (chunked board 5))

(defun won? (board called-numbers)
  (let*
      ((marked? (lambda (number) (member number called-numbers)))
       (bingo? (lambda (numbers) (every marked? numbers)))
       (rows (rows board))
       (columns (columns board))
       (rows-and-columns (append rows columns)))
   (some bingo? rows-and-columns)))

(defun won-boards (called-numbers)
   (mapcan (lambda (board)
             (if (won? board called-numbers)
                 board
                 '()))
           *boards*))

(defparameter *called-number-sequences*
  (loop for n from 1 to (length *number-calling-sequence*) by 1
        collect (subseq *number-calling-sequence* 0 n)))

(defun first-winning-sequence ()
  (find-if #'won-boards *called-number-sequences*))

(defun score-for-winning-board ()
  (let* ((called-numbers (first-winning-sequence))
         (board (won-boards called-numbers))
         (unmarked-numbers (remove-if (lambda (x) (member x called-numbers)) board))
         (sum-of-unmarked-numbers (reduce '+ unmarked-numbers))
         (last-called-number (car (last called-numbers))))
    (* last-called-number sum-of-unmarked-numbers)))
