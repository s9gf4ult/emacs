(add-hook 'sh-mode-hook (lambda ()
                          (local-set-key (kbd "M-p") 'comint-dynamic-complete-filename)))

(provide 'my-sh-mode)