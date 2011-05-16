;;;;;;;;;;;;;;;;;;;;
;; my-python-mode ;;
;;;;;;;;;;;;;;;;;;;;
;(load "python-pep7")
;(load "python-pylint")
(defun my-python-mode-hook ()
  (auto-complete-mode)
  (local-set-key (kbd "M-/") #'rope-lucky-assist)
  (local-set-key (kbd "M-S-/") #'rope-code-assist)
  (local-set-key (kbd "<ret>") #'newline))
(add-hook 'python-mode-hook #'my-python-mode-hook)

(provide 'my-python-mode)
