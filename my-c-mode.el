;;;;;;;;;;;;;;;;;;;;
;; my c mode hook ;;
;;;;;;;;;;;;;;;;;;;;
(add-hook 'c-mode-hook
          (lambda ()
            (semantic-load-enable-code-helpers)
            (local-set-key (kbd "<tab>")
                           (lambda () (interactive)
                             (indent-for-tab-command)
                             (semantic-complete-analyze-inline)))
            (local-set-key (kbd "<C-return>") 'semantic-ia-fast-jump)))