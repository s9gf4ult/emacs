;;;;;;;;;;;;;;;;;;;;;
;; global settings ;;
;;;;;;;;;;;;;;;;;;;;;
(show-paren-mode)
(tool-bar-mode -1)
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

(global-set-key (kbd "C-m") 'kill-whole-line)
;;;;;;;;;;;;;;;;;;;;;;;;;;
;; loading custom files ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (setq dotfiles-dir (file-name-directory
;; 		    (or
;; 		     (buffer-file-name)
;; 		     load-file-name)))

;; (add-to-list 'load-path dotfiles-dir)

;(load "my-elisp-mode")
;(load "my-c-mode")
			   
;;;;;;;;;;;;;;;;;;;;;;;;
;; customize settings ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(put 'narrow-to-region 'disabled nil)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(tab-width 3))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
