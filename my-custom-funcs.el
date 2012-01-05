;;;;;;;;;;;;;;;;;;;;;
;; my-custom-funcs ;;
;;;;;;;;;;;;;;;;;;;;;


(defun mark-line (arg)
  "marks current line (at point) or more that one of `arg' is set to >0"
  (interactive)
  (save-excursion
    (beginning-of-line)
    (set-mark-command 1)
    (when (> arg 0)
      (next-line arg nil))
    (end-of-line)
    (set-mark-command 0)))
      

(provide 'my-custom-functions)
  
