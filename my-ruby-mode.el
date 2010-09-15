;;;;;;;;;;;;;;;;;;;
;; my ruby mode  ;;
;;;;;;;;;;;;;;;;;;;

(add-hook 'ruby-mode-hook (lambda ()
                            (local-set-key (kbd "<RET>") (lambda () (interactive)
                                                           (reindent-then-newline-and-indent)
                                                           (my-recenter)))))