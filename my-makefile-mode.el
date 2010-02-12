(add-hook 'makefile-mode-hook (lambda ()
                                (local-set-key (kbd "<return>")
                                               (lambda () (interactive)
                                                 (newline-and-indent)))))
                                             