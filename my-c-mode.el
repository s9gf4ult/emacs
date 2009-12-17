;;;;;;;;;;;;;;;;;;;;
;; my c mode hook ;;
;;;;;;;;;;;;;;;;;;;;

(add-hook 'c-mode-hook
          (lambda ()
            (local-set-key (kbd "<tab>")
                           (lambda () (interactive)
                             (indent-for-tab-command)
                             (complete-symbol (point))))))