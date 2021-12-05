(defpackage submarine-bingo/tests/main
  (:use :cl
        :submarine-bingo
        :rove))
(in-package :submarine-bingo/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :submarine-bingo)' in your Lisp.

(deftest test-target-1
  (testing "should score-for-winning-board to be 64084"
    (ok (= (submarine-bingo::score-for-winning-board) 64084)))
  (testing "should score-for-last-winning-board to be 12833"
    (ok (= (submarine-bingo::score-for-last-winning-board) 12833))))
