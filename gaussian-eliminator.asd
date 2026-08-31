(asdf:defsystem "gaussian-eliminator"
  :description "Gaussian elimination using Lisp"
  :author "Judah Sotomayor"
  :license "MIT"
  :version (:read-file-form "VERSION.txt")
  :depends-on (:uiop :serapeum)
  :serial t
  :components ((:file "gaussian-eliminator"))
  :in-order-to ((test-op (test-op "gaussian-eliminator/tests"))))

(asdf:defsystem "gaussian-eliminator/tests"
  :version (:read-file-form "VERSION.txt")
  :depends-on (:gaussian-eliminator :fiasco)
  :perform (asdf:test-op (o s)
                         (unless (symbol-call :gaussian-eliminator/tests :run-gaussian-eliminator-tests)
                           (error "Tests failed")))
  :serial t
  :pathname "tests/"
  :components ((:file "matrix-operations")))
