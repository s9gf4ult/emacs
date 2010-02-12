;;;;;;;;;;;;;;;;;;;;;
;; global settings ;;
;;;;;;;;;;;;;;;;;;;;;
(show-paren-mode)
(ido-mode)
(tool-bar-mode -1)
(desktop-save-mode 1)
(global-set-key (kbd "<RET>") 'reindent-then-newline-and-indent)
(global-set-key (kbd "C-j") 'join-line)
(global-set-key (kbd "M-j")
                (lambda () (interactive)
                  (next-line)
                  (join-line)))

(global-set-key (kbd "C-o")
                (lambda () (interactive)
                  (end-of-line)
                  (newline-and-indent)))

(global-set-key (kbd "C-S-o")
                (lambda () (interactive)
                  (beginning-of-line)
                  (open-line 1)
                  (indent-for-tab-command)))

(global-set-key (kbd "C-S-k") 'kill-whole-line)
(global-set-key (kbd "<f5>") 'compile)
(blink-cursor-mode -1)
(scroll-bar-mode -1)

;;;;;;;;;;;;;;;;;;;;
;; receive pathes ;;
;;;;;;;;;;;;;;;;;;;;

(setq dotfiles-dir (file-name-directory
		    (or
		     (buffer-file-name)
		     load-file-name)))

(add-to-list 'load-path dotfiles-dir)

;;;;;;;;;;;;;;
;; requires ;;
;;;;;;;;;;;;;;
(require 'yasnippet)
(yas/load-directory (concat dotfiles-dir "snippets/text-mode"))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; loading custom files ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;


(load "my-custom-funcs")
(load "my-elisp-mode")
(load "my-c-mode")
(load "my-gdb-mode")
(load "my-haskell-mode")
(load "my-python-mode")

;;;;;;;;;;;;;;;;;;;;;;;;
;; customize settings ;;
;;;;;;;;;;;;;;;;;;;;;;;;
(put 'narrow-to-region 'disabled nil)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-insert t)
 '(ecb-options-version "2.40")
 '(indent-tabs-mode nil)
 '(tab-always-indent t)
 '(tab-width 3)
 '(undo-limit 500000))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )



