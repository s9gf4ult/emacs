(add-hook 'org-mode-hook (lambda ()
                           (auto-fill-mode 1)
                           (local-set-key (kbd "C-o") (lambda () (interactive)
                                                        (move-end-of-line 1)
                                                        (org-return)))
                           (local-set-key (kbd "<C-S-return>") (lambda () (interactive)
                                                                 (move-end-of-line 1)
                                                                 (org-insert-todo-heading-respect-content)))
                           (local-set-key (kbd "<C-return>") (lambda () (interactive)
                                                               (move-end-of-line 1)
                                                               (org-insert-heading-respect-content)))))