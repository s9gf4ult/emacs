(add-hook 'gdb-mode-hook
          (lambda () 
            (require 'cedet-edebug)
            (define-key debugger-mode-map "A" 'data-debug-edebug-expr)
            (local-set-key (kbd "<F5>")
                           (lambda () (interactive)
                             (gdb-many-windows 1)))
            (local-set-key (kbd "<C-F5>")
                           (lambda () (interactive)
                             (gdb-many-windows -1)))
            ))


(provide 'my-gdb-mode)