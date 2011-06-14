
;;;;;;;;;;;;;;
;; prologue ;;
;;;;;;;;;;;;;;

(defun my-recenter ()
  (recenter-top-bottom (/ (window-height) 2)))

(load-file "~/emacs/cedet/common/cedet.el")
(require 'semantic-ia)
(pymacs-load "ropemacs" "rope-")

;;;;;;;;;;;;;;;;;;;;;
;; global settings ;;
;;;;;;;;;;;;;;;;;;;;;
(show-paren-mode)
(ido-mode)
(tool-bar-mode -1)
(desktop-save-mode 1)
(global-set-key (kbd "<RET>") (lambda () (interactive)
                                (newline-and-indent)))

(global-set-key (kbd "C-S-c") 'copy-region-as-kill)
                                ;(my-recenter)))
(global-set-key (kbd "C-j") 'join-line)
(global-set-key (kbd "M-j")
                (lambda () (interactive)
                  (next-line)
                  (join-line)))
                  ;(my-recenter)))

(global-set-key (kbd "C-o")
                (lambda () (interactive)
                  (end-of-line)
                  (newline-and-indent)))
                  ;(my-recenter)))

(global-set-key (kbd "C-S-o")
                (lambda () (interactive)
                  (beginning-of-line)
                  (open-line 1)
                  (indent-for-tab-command)))
                  ;(my-recenter)))

(global-set-key (kbd "C-S-k") (lambda (&optional aa) (interactive "p")
                                (kill-whole-line aa)))
                                ;(my-recenter)))
(global-set-key (kbd "C-S-d") 'delete-region)

(global-set-key (kbd "C-/") (lambda () (interactive)
                              (undo)))
                            ;  (my-recenter)))

(global-set-key (kbd "M-/") 'hippie-expand)

(global-set-key (kbd "<f5>") 'compile)
(global-set-key (kbd "<C-f5>") 'previous-multiframe-window)
(global-set-key (kbd "<C-f6>") 'next-multiframe-window)
(global-set-key (kbd "C-c , v") 'semantic-decoration-include-visit)
(global-set-key (kbd "<M-tab>") 'auto-complete)
(blink-cursor-mode -1)
(scroll-bar-mode -1)

(global-set-key (kbd "<C-tab>") 'yas/expand)

;;;;;;;;;;;;;;;
;; scrooling ;;
;;;;;;;;;;;;;;;

(defun new-next-line () (interactive)
  (next-line)
  (recenter-top-bottom (/ (window-height) 2)))

(defun new-previous-line () (interactive)
  (previous-line)
  (recenter-top-bottom (/ (window-height) 2)))

;; (global-set-key (kbd "C-n") 'new-next-line)
;; (global-set-key (kbd "C-p") 'new-previous-line)
;; (global-set-key (kbd "<down>") 'new-next-line)
;; (global-set-key (kbd "<up>") 'new-previous-line)
                          

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
(load "my-makefile-mode")
(load "my-org-mode")
(load "my-python-mode")
(load "my-sh-mode")
(load "my-slime-mode")
(load "my-perl-mode")
(load "my-ruby-mode")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; enable-semantic-helpers ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(semantic-load-enable-excessive-code-helpers)

;;;;;;;;;;;;;;;
;; slime for ;;
;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/emacs/slime/")  ; your SLIME directory
;(require 'slime)
(require 'slime-autoloads)
(slime-setup '(slime-fancy))


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
 '(ac-modes (quote (emacs-lisp-mode lisp-interaction-mode c-mode cc-mode c++-mode java-mode clojure-mode scala-mode scheme-mode ocaml-mode tuareg-mode perl-mode cperl-mode python-mode ruby-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode python-mode)))
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
 '(semantic-idle-scheduler-idle-time 25)
 '(slime-auto-connect (quote ask))
 '(tab-always-indent t)
 '(tab-width 3)
 '(template-default-directories (quote ("/usr/share/emacs/site-lisp/template/templates" "~/.emacs.d/templates")) t)
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
(put 'set-goal-column 'disabled nil)
