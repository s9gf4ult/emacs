
(require 'org)

(add-hook
 'org-mode-hook
 (lambda ()
   (auto-fill-mode 1)))
   

(provide 's9g-org-mode)
