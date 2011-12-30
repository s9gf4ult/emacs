;;; s9g-configs.el --- customize master configurations

;; Copyright (C) 2011  

;; Author:  <s9gf4ult@gmail.com>
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ac-modes (quote (emacs-lisp-mode lisp-interaction-mode c-mode cc-mode c++-mode java-mode clojure-mode scala-mode scheme-mode ocaml-mode tuareg-mode perl-mode cperl-mode python-mode ruby-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode python-mode)))
 '(auto-insert t)
 '(auto-insert-directory "~/.emacs.d/auto-insert")
 '(auto-insert-mode t)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(desktop-save-mode t)
 '(ecb-options-version "2.40")
 '(emacs-lisp-mode-hook (quote (turn-on-eldoc-mode (lambda nil (local-set-key (kbd "TAB") (function (lambda nil (interactive) (if mark-active (indent-region (region-beginning) (region-end)) (if (looking-at "\\_>") (completion-at-point) (indent-for-tab-command))))))))))
 '(global-semantic-decoration-mode t nil (semantic-decorate-mode))
 '(global-semantic-highlight-edits-mode nil nil (semantic-util-modes))
 '(global-semantic-highlight-func-mode t nil (semantic-util-modes))
 '(global-semantic-idle-completions-mode nil nil (semantic-idle))
 '(global-semantic-idle-local-symbol-highlight-mode t nil (semantic-idle))
 '(global-semantic-idle-scheduler-mode t nil (semantic-idle))
 '(global-semantic-idle-summary-mode t nil (semantic-idle))
 '(global-semantic-mru-bookmark-mode t nil (semantic-util-modes))
 '(global-semantic-stickyfunc-mode t nil (semantic-util-modes))
 '(global-senator-minor-mode t nil (senator))
 '(global-visual-line-mode t)
 '(ido-enable-flex-matching t)
 '(ido-file-extensions-order (quote (".lisp" ".asd" ".css" ".yas")))
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(inferior-lisp-program "/usr/bin/sbcl")
 '(org-agenda-files (quote ("~/org/work.org")))
 '(org-remember-clock-out-on-exit t)
 '(safe-local-variable-values (quote ((Syntax . ANSI-Common-Lisp))))
 '(scroll-bar-mode nil)
 '(scroll-preserve-screen-position t)
 '(semantic-complete-inline-analyzer-displayor-class (quote semantic-displayor-traditional-with-focus-highlight))
 '(semantic-completion-displayor-format-tag-function (quote semantic-format-tag-prototype))
 '(semantic-decoration-styles (quote (("semantic-decoration-on-includes" . t) ("semantic-decoration-on-protected-members" . t) ("semantic-decoration-on-private-members" . t) ("semantic-tag-boundary" . t))))
 '(semantic-idle-work-parse-neighboring-files-flag t)
 '(semantic-idle-work-update-headers-flag t)
 '(semantic-mode t)
 '(semanticdb-global-mode t nil (semanticdb))
 '(senator-completion-menu-summary-function (quote semantic-format-tag-prototype))
 '(show-paren-mode t)
 '(slime-net-coding-system (quote utf-8-unix))
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(undo-limit 500000)
 '(use-file-dialog nil)
 '(woman-fill-column (- (window-width) 5))
 '(woman-use-own-frame nil)
 '(yas/global-mode t nil (yasnippet))
 '(yas/next-field-key (quote ("<C-tab>")))
 '(yas/snippet-dirs (quote ("~/.emacs.d/snippets")) nil (yasnippet))
 '(yas/trigger-key "<C-tab>"))



;;(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 ;;'(magit-diff-add ((t (:background "gray8" :foreground "green3"))))
 ;;'(magit-diff-del ((t (:background "gray8" :foreground "red3"))))
 ;;'(magit-diff-file-header ((t (:inherit magit-header :background "gray8"))))
 ;;'(magit-diff-hunk-header ((t (:inherit magit-header :background "gray8" :foreground "orange" :slant italic))))
 ;;'(magit-item-highlight ((((class color) (background dark)) (:background "gray15")))))
(put 'set-goal-column 'disabled nil)


(provide 's9g-configs)
;;; s9g-configs.el ends here
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#202020" :foreground "White" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 172 :width normal :foundry "xos4" :family "terminus"))))
 '(cursor ((t (:background "white"))))
 '(highlight ((((class color) (min-colors 88) (background dark)) (:background "gray25"))))
 '(magit-diff-add ((t (:inherit diff-added :foreground "green"))))
 '(magit-diff-del ((t (:inherit diff-removed :foreground "red")))))
