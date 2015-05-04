
(require 'auto-complete)

(setq-default
 ac-sources
 '(ac-source-haskell-process
   ac-source-dictionary
   ac-source-words-in-same-mode-buffers
   ))

(provide 's9g-auto-complete)
