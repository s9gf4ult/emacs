
(require 'org)

(add-hook
 'org-mode-hook
 (lambda ()
   (auto-fill-mode 1)
   (setq fill-column 56)
   (local-set-key (kbd "<S-left>") #'windmove-left)
   (local-set-key (kbd "<S-right>") #'windmove-right)
   (local-set-key (kbd "<S-up>") #'windmove-up)
   (local-set-key (kbd "<S-down>") #'windmove-down)))


(provide 's9g-org-mode)
