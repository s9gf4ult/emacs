;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my emacs lisp mode hook ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (semantic-load-enable-code-helpers)
            (local-set-key (kbd "<tab>")
                           (lambda () (interactive)
                             (indent-for-tab-command)
                             (lisp-complete-symbol)))
            (local-set-key (kbd "<C-return>")
                           (lambda () (interactive)
                             (semantic-ia-fast-jump (point))))))
;(load "my-scrool")