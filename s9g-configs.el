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
 '(ac-comphist-threshold 0.7)
 '(ac-delay 0.1)
 '(ac-dwim t)
 '(ac-expand-on-auto-complete nil)
 '(ac-ignore-case nil)
 '(ac-modes (quote (emacs-lisp-mode lisp-interaction-mode c-mode cc-mode c++-mode java-mode clojure-mode scala-mode scheme-mode ocaml-mode tuareg-mode perl-mode cperl-mode python-mode ruby-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode python-mode octave-mode nxml-mode)))
 '(ac-use-comphist t)
 '(ac-use-fuzzy nil)
 '(ac-use-menu-map t)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(comment-auto-fill-only-comments t)
 '(desktop-save-mode t)
 '(ecb-options-version "2.40")
 '(emacs-lisp-mode-hook (quote (turn-on-eldoc-mode (lambda nil (local-set-key (kbd "TAB") (function (lambda nil (interactive) (if mark-active (indent-region (region-beginning) (region-end)) (if (looking-at "\\_>") (completion-at-point) (indent-for-tab-command))))))))))
 '(even-window-heights nil)
 '(fill-column 80)
 '(fixme-foreground-color "#CC0019")
 '(fixme-highlighted-words (quote ("FIXME" "TODO" "BUG" "KLUDGE")))
 '(global-hl-line-mode nil)
 '(global-visual-line-mode t)
 '(haskell-font-lock-symbols (quote unicode))
 '(haskell-mode-hook (quote (turn-on-haskell-simple-indent haskell-hook)))
 '(haskell-program-name "cabal-dev ghci")
 '(ido-auto-merge-delay-time 2)
 '(ido-enable-flex-matching nil)
 '(ido-enter-matching-directory (quote first))
 '(ido-file-extensions-order (quote (".lisp" ".asd" ".css" ".yas")))
 '(ido-ignore-files (quote ("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./" "\\`~/")))
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(inferior-lisp-program "/usr/bin/sbcl --control-stack-size 20")
 '(org-agenda-files (quote ("~/org/work.org")))
 '(org-remember-clock-out-on-exit t)
 '(rng-nxml-auto-validate-flag nil)
 '(rst-level-face-base-color "goldenrod4")
 '(safe-local-variable-values (quote ((Syntax . ANSI-Common-Lisp))))
 '(scroll-bar-mode nil)
 '(scroll-margin 5)
 '(scroll-preserve-screen-position t)
 '(scroll-step 3)
 '(scroll-up-aggressively nil)
 '(semantic-complete-inline-analyzer-displayor-class (quote semantic-displayor-traditional-with-focus-highlight))
 '(semantic-completion-displayor-format-tag-function (quote semantic-format-tag-prototype))
 '(semantic-decoration-styles (quote (("semantic-decoration-on-includes" . t) ("semantic-decoration-on-protected-members" . t) ("semantic-decoration-on-private-members" . t) ("semantic-tag-boundary" . t))))
 '(semantic-idle-work-parse-neighboring-files-flag t)
 '(semantic-idle-work-update-headers-flag t)
 '(semantic-mode t)
 '(senator-completion-menu-summary-function (quote semantic-format-tag-prototype))
 '(show-paren-mode t)
 '(slime-net-coding-system (quote utf-8-unix))
 '(solarized-bold nil)
 '(solarized-italic nil)
 '(solarized-underline nil)
 '(split-width-threshold 80)
 '(standard-indent 2)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(undo-limit 500000)
 '(use-file-dialog nil)
 '(warning-minimum-level :error)
 '(woman-fill-column (- (window-width) 5))
 '(woman-use-own-frame nil))
(put 'set-goal-column 'disabled nil)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#fdf6e3" :foreground "#657b83" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 147 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(diff-added ((t (:background "SeaGreen1"))))
 '(diff-removed ((t (:background "#FFC4C4"))))
 '(magit-item-highlight ((t nil))))


(provide 's9g-configs)
