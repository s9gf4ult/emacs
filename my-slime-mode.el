(add-hook 'slime-mode-hook (lambda () (interactive)
                             "when slime starts this function is runs"
                             (local-set-key (kbd "<tab>") 'slime-complete-symbol)))

(provide 'my-slime-mode)