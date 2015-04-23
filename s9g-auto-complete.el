
(require 'auto-complete)

(setq-default
 ac-sources
 '(ac-source-dictionary
   ac-source-words-in-same-mode-buffers
   ac-source-haskell-process
   ))

(provide 's9g-auto-complete)
