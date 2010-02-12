(add-hook 'python-mode-hook (lambda ()
                              (local-set-key (kbd "<return>")
                                             (lambda () (interactive)
                                               (newline-and-indent)))
                              (local-set-key (kbd "C-M-i")
                                             (lambda () (interactive)
                                               (python-insert-if)))))
                                               


