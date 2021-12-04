(defpackage submarine-bingo/tests/main
  (:use :cl
        :submarine-bingo
        :rove))
(in-package :submarine-bingo/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :submarine-bingo)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
