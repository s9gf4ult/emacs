(add-hook 'org-mode-hook (lambda ()
                           (local-set-key (kbd "C-o") (lambda () (interactive)
                                                        (move-end-of-line 1)
                                                        (org-return)))))