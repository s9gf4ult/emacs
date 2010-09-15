;;;;;;;;;;;;;;
;; prologue ;;
;;;;;;;;;;;;;;

(defun my-recenter ()
  (recenter-top-bottom (/ (window-height) 2)))


;;;;;;;;;;;;;;;;;;;;;
;; global settings ;;
;;;;;;;;;;;;;;;;;;;;;
(show-paren-mode)
(ido-mode)
(tool-bar-mode -1)
(desktop-save-mode 1)
(global-set-key (kbd "<RET>") (lambda () (interactive)
                                (reindent-then-newline-and-indent)
                                (my-recenter)))
(global-set-key (kbd "C-j") 'join-line)
(global-set-key (kbd "M-j")
                (lambda () (interactive)
                  (next-line)
                  (join-line)
                  (my-recenter)))

(global-set-key (kbd "C-o")
                (lambda () (interactive)
                  (end-of-line)
                  (newline-and-indent)
                  (my-recenter)))

(global-set-key (kbd "C-S-o")
                (lambda () (interactive)
                  (beginning-of-line)
                  (open-line 1)
                  (indent-for-tab-command)
                  (my-recenter)))

(global-set-key (kbd "C-S-k") (lambda (&optional aa) (interactive "p")
                                (kill-whole-line aa)
                                (my-recenter)))

(global-set-key (kbd "C-/") (lambda () (interactive)
                              (undo)
                              (my-recenter)))

(global-set-key (kbd "M-/") 'hippie-expand)

(global-set-key (kbd "<f5>") 'compile)
(global-set-key (kbd "<C-f5>") 'previous-multiframe-window)
(global-set-key (kbd "<C-f6>") 'next-multiframe-window)
(blink-cursor-mode -1)
(scroll-bar-mode -1)

;;;;;;;;;;;;;;;
;; scrooling ;;
;;;;;;;;;;;;;;;

(defun new-next-line () (interactive)
  (next-line)
  (recenter-top-bottom (/ (window-height) 2)))

(defun new-previous-line () (interactive)
  (previous-line)
  (recenter-top-bottom (/ (window-height) 2)))

(global-set-key (kbd "C-n") 'new-next-line)
(global-set-key (kbd "C-p") 'new-previous-line)
(global-set-key (kbd "<down>") 'new-next-line)
(global-set-key (kbd "<up>") 'new-previous-line)
                          

;;;;;;;;;;;;;;;;;;;;
;; color settings ;;
;;;;;;;;;;;;;;;;;;;;
(set-cursor-color "white")
(set-background-color "gray10")
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
(require 'semantic-gcc)

(yas/load-directory (concat dotfiles-dir "snippets/text-mode"))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; loading custom files ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "/home/razor/.emacs.d")

(load "my-custom-funcs")
(load "my-elisp-mode")
(load "my-c-mode")
(load "my-gdb-mode")
(load "my-haskell-mode")
(load "my-python-mode")
(load "my-makefile-mode")
(load "my-org-mode")
(load "my-python-mode")
(load "my-sh-mode")
(load "my-slime-mode")
(load "my-perl-mode")
(load "my-ruby-mode")

;;;;;;;;;;;;;;;
;; slime for ;;
;;;;;;;;;;;;;;;

(setq slime-net-coding-system 'utf-8-unix)

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
 '(inferior-lisp-program "/usr/bin/sbcl --noinform")
 '(org-agenda-files (quote ("~/org/work.org")))
 '(org-remember-clock-out-on-exit t)
 '(quack-default-program "csi")
 '(quack-fontify-style nil)
 '(scheme-program-name "sci")
 '(scroll-preserve-screen-position t)
 '(tab-always-indent t)
 '(tab-width 3)
 '(undo-limit 500000)
 '(use-file-dialog nil)
 '(woman-fill-column (- (window-width) 5))
 '(woman-use-own-frame nil))



(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
