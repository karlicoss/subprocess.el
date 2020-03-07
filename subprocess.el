;;; subprocess.el  -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 Dima Gerasimov
;;
;; Author: Dima Gerasimov <http://github/karlicos>
;; Maintainer: Dima Gerasimov <karlicoss@gmail.com>
;; Created: March 07, 2020
;; Modified: March 07, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/karlicos/subprocess.el
;; Package-Requires: ((emacs 26.1) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  description
;;
;;; Code:

(require 'cl-lib)

;; TODO run function and check?
(cl-defun check-output (cmd &key (input nil))
  ;; for fuck's sake, messages buffer isn't writable..
  ;; TODO FIXME decouple from stderr, output it to messages somehow
  ;; TODO real-destination?
  (cl-assert input t "Please set input")
  (let (return-code stdout stderr)
    (setq stdout (with-output-to-string
                   (with-temp-buffer
                     (insert input)
                     (setq return-code
                           (apply
                           ;; call-process can only read from stdin..
                            #'call-process-region
                            nil nil
                            (car cmd)
                            nil             ;; delete input?
                            standard-output ;; destination
                            nil             ;; display?
                            (cdr cmd))))))
    ;; TODO FIXME print stderr
    (cl-assert (= return-code 0) t "Program failed with return code %d; stdout: %s" stdout)
    stdout))


(provide 'subprocess)
;;; subprocess.el ends here
