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
 '(align-rules-list (quote ((haskell-left-arrows (regexp . "\\(\\s-+\\)\\(<-\\|←\\)\\s-+") (modes quote (haskell-mode literate-haskell-mode))) (haskell-arrows (regexp . "\\(\\s-+\\)\\(->\\|→\\)\\s-+") (modes quote (haskell-mode literate-haskell-mode))) (haskell-assignment (regexp . "\\(\\s-+\\)=\\s-+") (modes quote (haskell-mode literate-haskell-mode))) (haskell-types (regexp . "\\(\\s-+\\)\\(::\\|∷\\)\\s-+") (modes quote (haskell-mode literate-haskell-mode))) (lisp-second-arg (regexp . "\\(^\\s-+[^(
]\\|(\\(\\S-+\\)\\s-+\\)\\S-+\\(\\s-+\\)") (group . 3) (modes . align-lisp-modes) (run-if lambda nil current-prefix-arg)) (lisp-alist-dot (regexp . "\\(\\s-*\\)\\.\\(\\s-*\\)") (group 1 2) (modes . align-lisp-modes)) (open-comment (regexp lambda (end reverse) (funcall (if reverse (quote re-search-backward) (quote re-search-forward)) (concat "[^
\\\\]" (regexp-quote comment-start) "\\(.+\\)$") end t)) (modes . align-open-comment-modes)) (c-macro-definition (regexp . "^\\s-*#\\s-*define\\s-+\\S-+\\(\\s-+\\)") (modes . align-c++-modes)) (c-variable-declaration (regexp . "[*&0-9A-Za-z_]>?[&*]*\\(\\s-+[*&]*\\)[A-Za-z_][0-9A-Za-z:_]*\\s-*\\(\\()\\|=[^=
].*\\|(.*)\\|\\(\\[.*\\]\\)*\\)?\\s-*[;,]\\|)\\s-*$\\)") (group . 1) (modes . align-c++-modes) (justify . t) (valid lambda nil (not (or (save-excursion (goto-char (match-beginning 1)) (backward-word 1) (looking-at "\\(goto\\|return\\|new\\|delete\\|throw\\)")) (if (and (boundp (quote font-lock-mode)) font-lock-mode) (eq (get-text-property (point) (quote face)) (quote font-lock-comment-face)) (eq (caar (c-guess-basic-syntax)) (quote c))))))) (c-assignment (regexp . "[^-=!^&*+<>/|
]\\(\\s-*[-=!^&*+<>/|]*\\)=\\(\\s-*\\)\\([^=
]\\|$\\)") (group 1 2) (modes . align-c++-modes) (justify . t) (tab-stop)) (perl-assignment (regexp . "[^=!^&*-+<>/|
]\\(\\s-*\\)=[~>]?\\(\\s-*\\)\\([^>=
]\\|$\\)") (group 1 2) (modes . align-perl-modes) (tab-stop)) (python-assignment (regexp . "[^=!<>
]\\(\\s-*\\)=\\(\\s-*\\)\\([^>=
]\\|$\\)") (group 1 2) (modes quote (python-mode)) (tab-stop)) (make-assignment (regexp . "^\\s-*\\w+\\(\\s-*\\):?=\\(\\s-*\\)\\([^
 \\\\]\\|$\\)") (group 1 2) (modes quote (makefile-mode)) (tab-stop)) (c-comma-delimiter (regexp . ",\\(\\s-*\\)[^/
]") (repeat . t) (modes . align-c++-modes) (run-if lambda nil current-prefix-arg)) (basic-comma-delimiter (regexp . ",\\(\\s-*\\)[^#
]") (repeat . t) (modes append align-perl-modes (quote (python-mode))) (run-if lambda nil current-prefix-arg)) (c++-comment (regexp . "\\(\\s-*\\)\\(//.*\\|/\\*.*\\*/\\s-*\\)$") (modes . align-c++-modes) (column . comment-column) (valid lambda nil (save-excursion (goto-char (match-beginning 1)) (not (bolp))))) (c-chain-logic (regexp . "\\(\\s-*\\)\\(&&\\|||\\|\\<and\\>\\|\\<or\\>\\)") (modes . align-c++-modes) (valid lambda nil (save-excursion (goto-char (match-end 2)) (looking-at "\\s-*\\(/[*/]\\|$\\)")))) (perl-chain-logic (regexp . "\\(\\s-*\\)\\(&&\\|||\\|\\<and\\>\\|\\<or\\>\\)") (modes . align-perl-modes) (valid lambda nil (save-excursion (goto-char (match-end 2)) (looking-at "\\s-*\\(#\\|$\\)")))) (python-chain-logic (regexp . "\\(\\s-*\\)\\(\\<and\\>\\|\\<or\\>\\)") (modes quote (python-mode)) (valid lambda nil (save-excursion (goto-char (match-end 2)) (looking-at "\\s-*\\(#\\|$\\|\\\\\\)")))) (c-macro-line-continuation (regexp . "\\(\\s-*\\)\\\\$") (modes . align-c++-modes) (column . c-backslash-column)) (basic-line-continuation (regexp . "\\(\\s-*\\)\\\\$") (modes quote (python-mode makefile-mode))) (tex-record-separator (regexp lambda (end reverse) (align-match-tex-pattern "&" end reverse)) (group 1 2) (modes . align-tex-modes) (repeat . t)) (tex-tabbing-separator (regexp lambda (end reverse) (align-match-tex-pattern "\\\\[=>]" end reverse)) (group 1 2) (modes . align-tex-modes) (repeat . t) (run-if lambda nil (eq major-mode (quote latex-mode)))) (tex-record-break (regexp . "\\(\\s-*\\)\\\\\\\\") (modes . align-tex-modes)) (text-column (regexp . "\\(^\\|\\S-\\)\\([ 	]+\\)\\(\\S-\\|$\\)") (group . 2) (modes . align-text-modes) (repeat . t) (run-if lambda nil (and current-prefix-arg (not (eq (quote -) current-prefix-arg))))) (text-dollar-figure (regexp . "\\$?\\(\\s-+[0-9]+\\)\\.") (modes . align-text-modes) (justify . t) (run-if lambda nil (eq (quote -) current-prefix-arg))) (css-declaration (regexp . "^\\s-*\\w+:\\(\\s-*\\).*;") (group 1) (modes quote (css-mode html-mode))))))
 '(blink-cursor-mode nil)
 '(coffee-tab-width 2)
 '(column-number-mode t)
 '(comment-auto-fill-only-comments t)
 '(css-indent-offset 2)
 '(desktop-save-mode t)
 '(ecb-options-version "2.40")
 '(emacs-lisp-mode-hook (quote (turn-on-eldoc-mode (lambda nil (local-set-key (kbd "TAB") (function (lambda nil (interactive) (if mark-active (indent-region (region-beginning) (region-end)) (if (looking-at "\\_>") (completion-at-point) (indent-for-tab-command))))))))))
 '(even-window-heights nil)
 '(fill-column 80)
 '(fixme-foreground-color "#CC0019")
 '(fixme-highlighted-words (quote ("FIXME" "TODO" "BUG" "KLUDGE")))
 '(font-lock-global-modes (quote (not speedbar-mode)))
 '(global-hl-line-mode nil)
 '(global-visual-line-mode t)
 '(haskell-ask-also-kill-buffers nil)
 '(haskell-compile-cabal-build-command "cd %s && LANG=C cabal build --ghc-option=-ferror-spans -j2")
 '(haskell-font-lock-symbols t)
 '(haskell-hoogle-command nil)
 '(haskell-indentation-ifte-offset 2)
 '(haskell-indentation-layout-offset 4)
 '(haskell-indentation-left-offset 4)
 '(haskell-indentation-starter-offset 4)
 '(haskell-mode-hook (quote (turn-on-haskell-indentation s9g-haskell-hook)))
 '(haskell-process-path-cabal "/usr/bin/cabal")
 '(haskell-process-suggest-haskell-docs-imports nil)
 '(haskell-process-suggest-hoogle-imports t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-program-name "cabal-dev ghci")
 '(ido-auto-merge-delay-time 2)
 '(ido-enable-flex-matching nil)
 '(ido-enter-matching-directory (quote first))
 '(ido-file-extensions-order (quote (".lisp" ".asd" ".css" ".yas")))
 '(ido-ignore-files (quote ("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./" "\\`~/")))
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(inferior-lisp-program "/usr/bin/sbcl --control-stack-size 20")
 '(js-indent-level 4)
 '(org-agenda-files (quote ("~/org/work.org")))
 '(org-columns-default-format "%40ITEM(Task) %17Effort(Estimated Effort){:} %CLOCKSUM")
 '(org-remember-clock-out-on-exit t)
 '(rng-nxml-auto-validate-flag nil)
 '(rst-level-face-base-color "goldenrod4")
 '(safe-local-variable-values (quote ((hamlet/basic-offset . 4) (haskell-process-use-ghci . t) (haskell-indent-spaces . 4) (encoding . utf-8) (Syntax . ANSI-Common-Lisp))))
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
 '(split-width-threshold 100)
 '(standard-indent 2)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(undo-limit 500000)
 '(use-file-dialog nil)
 '(vc-annotate-background "cornsilk")
 '(vc-annotate-color-map nil)
 '(warning-minimum-level :error)
 '(woman-fill-column (- (window-width) 5))
 '(woman-use-own-frame nil))
(put 'set-goal-column 'disabled nil)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#fdf6e3" :foreground "#657b83" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 147 :width normal :foundry "Book" :family "DejaVu Sans Mono"))))
 '(diff-added ((t (:background "SeaGreen1"))))
 '(diff-removed ((t (:background "#FFC4C4"))))
 '(magit-item-highlight ((t nil)))
 '(vc-annotate-face-3F3FFF ((t (:foreground "#3F3FFF"))) t))


(provide 's9g-configs)
