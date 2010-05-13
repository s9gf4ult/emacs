;;;;;;;;;;;;;;;;;;;;
;; my c mode hook ;;
;;;;;;;;;;;;;;;;;;;;
(defun my-c-mode-hook ()
  (require 'semantic-ia)
  (require 'semantic-gcc)
;  (semantic-load-enable-excessive-code-helpers)
  (semantic-load-enable-code-helpers)
  (local-set-key (kbd "<tab>")
                 (lambda () (interactive)
                   (indent-for-tab-command)
                   (semantic-complete-analyze-inline)))
  (local-set-key (kbd "<C-return>") 'semantic-ia-fast-jump)
  (local-set-key (kbd "<C-f1>") 'pop-mark)
  (local-set-key (kbd "<C-f2>") 'pop-global-mark)
  (local-set-key (kbd "<C-tab>") 'yas/expand))
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)
(semantic-add-system-include "/usr/lib/gcc/i686-pc-linux-gnu/4.3.3/include/g++-v4" 'c++-mode)
(semantic-add-system-include "/usr/lib/gcc/x86_64-pc-linux-gnu/4.3.3/include/g++-v4" 'c++-mode)

(provide 'my-c-mode)
;(load "my-scrool")