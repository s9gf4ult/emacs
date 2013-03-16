
(require 'org)

(add-hook
 'org-mode-hook
 (lambda ()
   (auto-fill-mode 1)
   (setq fill-column 56)))
   

(provide 's9g-org-mode)
