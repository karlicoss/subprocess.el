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
  ;; TODO FIXME check return code?
  ;; TODO real-destination?
  ;; TODO FIXME check input
  ;; TODO decouple from stderr, output it to messages somehow
  (with-output-to-string
    (apply
     #'call-process
     (car cmd)
     nil ;; TODO stdin?
     standard-output
     nil
     (cdr cmd))))


(provide 'subprocess)
;;; subprocess.el ends here
