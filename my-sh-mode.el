(add-hook 'sh-mode-hook (lambda ()
                          (local-set-key (kbd "M-p") 'comint-dynamic-complete-filename)
                          (local-set-ket (kbd "<C-tab>") (lambda () (interactive)
                                                           (insert "\t")))))

                         

(provide 'my-sh-mode)