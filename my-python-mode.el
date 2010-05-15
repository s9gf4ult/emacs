(add-hook 'python-mode-hook (lambda ()
                              (load "py-complete/py-complete.el")
                              (py-complete-init)
                              (local-set-key (kbd "<return>")
                                             (lambda () (interactive)
                                               (newline-and-indent)))))
                                               


