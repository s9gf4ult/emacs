;;;;;;;;;;;;;;;;;;;;;
;; my-haskell-mode ;;
;;;;;;;;;;;;;;;;;;;;;

(add-hook 'haskell-mode-hook
          (lambda ()
            (local-set-key (kbd "<return>") 'newline-and-indent)
            (haskell-indent-mode 1)))


(provide 'my-haskell-mode)