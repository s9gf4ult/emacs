;;;;;;;;;;;;;;;;;;;;
;; my-python-mode ;;
;;;;;;;;;;;;;;;;;;;;

(add-hook 'python-mode-hook (lambda ()
                              (load "pycomplete/pycomplete.el")
                              (py-complete-init)
                              (local-set-key (kbd "<return>")
                                             (lambda () (interactive)
                                               (newline-and-indent)))))
                                               


(provide 'my-python-mode)