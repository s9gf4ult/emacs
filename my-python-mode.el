(add-hook 'python-mode-hook (lambda ()
                              (load "pycomplete/pycomplete")
                              (local-set-key (kbd "<return>")
                                             (lambda () (interactive)
                                               (newline-and-indent)))))
                                               


(provide 'my-python-mode)