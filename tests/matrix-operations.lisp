(fiasco:define-test-package #:gaussian-eliminator/tests
    (:documentation "Tests for Gaussian Elimination")
  (:export
   #:run-gaussian-eliminator-tests))

(in-package :gaussian-eliminator/tests)

(defun run-gaussian-eliminator-tests ()
  (run-package-tests
   :packages '(:gaussian-eliminator/tests)
   :interactive t))
