(add-hook 'perl-mode-hook (lambda ()
                            (local-set-key (kbd "<M-p>") 'comint-dynamic-complete-filename)))