;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my emacs lisp mode hook ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(local-set-key (kbd "<tab>")
               (lambda () (interactive)
                 (indent-for-tab-command)
                 (lisp-complete-symbol)))
