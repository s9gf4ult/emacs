;;;;;;;;;;;;;;;;;;;;
;; my c mode hook ;;
;;;;;;;;;;;;;;;;;;;;

(semantic-load-enable-code-helpers)
(local-set-key (kbd "<tab>")
               (lambda () (interactive)
                 (indent-for-tab-command)
                 (semantic-complete-analyze-inline)))
