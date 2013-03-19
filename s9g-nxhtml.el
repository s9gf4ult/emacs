
(load (concat dotfiles-dir "packages/nxhtml/autostart.el"))

(eval-after-load "mumamo"
  '(setq mumamo-per-buffer-local-vars
         (delq 'buffer-file-name mumamo-per-buffer-local-vars)))

(provide 's9g-nxhtml)
