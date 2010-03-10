(add-hook 'python-mode-hook (lambda ()
                              (load "ipython")
                              (setq ipython-completion-command-string "print(';'.join(__IP.Completer.all_completions('%s')))\n")
                              (local-set-key (kbd "<return>")
                                             (lambda () (interactive)
                                               (newline-and-indent)))))
                                               


