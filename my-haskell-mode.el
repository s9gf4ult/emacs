(add-hook 'haskell-mode-hook
          (lambda ()
            (local-set-key (kbd "<return>") 'newline-and-indent)
            (haskell-indent-mode 1)))
          