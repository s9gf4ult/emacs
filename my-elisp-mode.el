;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my emacs lisp mode hook ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (local-set-key (kbd "<tab>")
                           (lambda () (interactive)
                             (indent-for-tab-command)
                             (lisp-complete-symbol)))))
