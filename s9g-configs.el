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
 '(ac-modes
   (quote
    (emacs-lisp-mode lisp-interaction-mode c-mode cc-mode c++-mode java-mode clojure-mode scala-mode scheme-mode ocaml-mode tuareg-mode perl-mode cperl-mode python-mode ruby-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode python-mode octave-mode nxml-mode haskell-mode)))
 '(ac-use-comphist t)
 '(ac-use-dictionary-as-stop-words nil)
 '(ac-use-fuzzy nil)
 '(ac-use-menu-map t)
 '(align-rules-list
   (quote
    ((haskell-left-arrows
      (regexp . "\\(\\s-+\\)\\(<-\\|←\\)\\s-+")
      (modes quote
             (haskell-mode literate-haskell-mode)))
     (haskell-arrows
      (regexp . "\\(\\s-+\\)\\(->\\|→\\)\\s-+")
      (modes quote
             (haskell-mode literate-haskell-mode)))
     (haskell-assignment
      (regexp . "\\(\\s-+\\)=\\s-+")
      (modes quote
             (haskell-mode literate-haskell-mode)))
     (haskell-types
      (regexp . "\\(\\s-+\\)\\(::\\|∷\\)\\s-+")
      (modes quote
             (haskell-mode literate-haskell-mode)))
     (lisp-second-arg
      (regexp . "\\(^\\s-+[^(
]\\|(\\(\\S-+\\)\\s-+\\)\\S-+\\(\\s-+\\)")
      (group . 3)
      (modes . align-lisp-modes)
      (run-if lambda nil current-prefix-arg))
     (lisp-alist-dot
      (regexp . "\\(\\s-*\\)\\.\\(\\s-*\\)")
      (group 1 2)
      (modes . align-lisp-modes))
     (open-comment
      (regexp lambda
              (end reverse)
              (funcall
               (if reverse
                   (quote re-search-backward)
                 (quote re-search-forward))
               (concat "[^
\\\\]"
                       (regexp-quote comment-start)
                       "\\(.+\\)$")
               end t))
      (modes . align-open-comment-modes))
     (c-macro-definition
      (regexp . "^\\s-*#\\s-*define\\s-+\\S-+\\(\\s-+\\)")
      (modes . align-c++-modes))
     (c-variable-declaration
      (regexp . "[*&0-9A-Za-z_]>?[&*]*\\(\\s-+[*&]*\\)[A-Za-z_][0-9A-Za-z:_]*\\s-*\\(\\()\\|=[^=
].*\\|(.*)\\|\\(\\[.*\\]\\)*\\)?\\s-*[;,]\\|)\\s-*$\\)")
      (group . 1)
      (modes . align-c++-modes)
      (justify . t)
      (valid lambda nil
             (not
              (or
               (save-excursion
                 (goto-char
                  (match-beginning 1))
                 (backward-word 1)
                 (looking-at "\\(goto\\|return\\|new\\|delete\\|throw\\)"))
               (if
                   (and
                    (boundp
                     (quote font-lock-mode))
                    font-lock-mode)
                   (eq
                    (get-text-property
                     (point)
                     (quote face))
                    (quote font-lock-comment-face))
                 (eq
                  (caar
                   (c-guess-basic-syntax))
                  (quote c)))))))
     (c-assignment
      (regexp . "[^-=!^&*+<>/|
]\\(\\s-*[-=!^&*+<>/|]*\\)=\\(\\s-*\\)\\([^=
]\\|$\\)")
      (group 1 2)
      (modes . align-c++-modes)
      (justify . t)
      (tab-stop))
     (perl-assignment
      (regexp . "[^=!^&*-+<>/|
]\\(\\s-*\\)=[~>]?\\(\\s-*\\)\\([^>=
]\\|$\\)")
      (group 1 2)
      (modes . align-perl-modes)
      (tab-stop))
     (python-assignment
      (regexp . "[^=!<>
]\\(\\s-*\\)=\\(\\s-*\\)\\([^>=
]\\|$\\)")
      (group 1 2)
      (modes quote
             (python-mode))
      (tab-stop))
     (make-assignment
      (regexp . "^\\s-*\\w+\\(\\s-*\\):?=\\(\\s-*\\)\\([^
 \\\\]\\|$\\)")
      (group 1 2)
      (modes quote
             (makefile-mode))
      (tab-stop))
     (c-comma-delimiter
      (regexp . ",\\(\\s-*\\)[^/
]")
      (repeat . t)
      (modes . align-c++-modes)
      (run-if lambda nil current-prefix-arg))
     (basic-comma-delimiter
      (regexp . ",\\(\\s-*\\)[^#
]")
      (repeat . t)
      (modes append align-perl-modes
             (quote
              (python-mode)))
      (run-if lambda nil current-prefix-arg))
     (c++-comment
      (regexp . "\\(\\s-*\\)\\(//.*\\|/\\*.*\\*/\\s-*\\)$")
      (modes . align-c++-modes)
      (column . comment-column)
      (valid lambda nil
             (save-excursion
               (goto-char
                (match-beginning 1))
               (not
                (bolp)))))
     (c-chain-logic
      (regexp . "\\(\\s-*\\)\\(&&\\|||\\|\\<and\\>\\|\\<or\\>\\)")
      (modes . align-c++-modes)
      (valid lambda nil
             (save-excursion
               (goto-char
                (match-end 2))
               (looking-at "\\s-*\\(/[*/]\\|$\\)"))))
     (perl-chain-logic
      (regexp . "\\(\\s-*\\)\\(&&\\|||\\|\\<and\\>\\|\\<or\\>\\)")
      (modes . align-perl-modes)
      (valid lambda nil
             (save-excursion
               (goto-char
                (match-end 2))
               (looking-at "\\s-*\\(#\\|$\\)"))))
     (python-chain-logic
      (regexp . "\\(\\s-*\\)\\(\\<and\\>\\|\\<or\\>\\)")
      (modes quote
             (python-mode))
      (valid lambda nil
             (save-excursion
               (goto-char
                (match-end 2))
               (looking-at "\\s-*\\(#\\|$\\|\\\\\\)"))))
     (c-macro-line-continuation
      (regexp . "\\(\\s-*\\)\\\\$")
      (modes . align-c++-modes)
      (column . c-backslash-column))
     (basic-line-continuation
      (regexp . "\\(\\s-*\\)\\\\$")
      (modes quote
             (python-mode makefile-mode)))
     (tex-record-separator
      (regexp lambda
              (end reverse)
              (align-match-tex-pattern "&" end reverse))
      (group 1 2)
      (modes . align-tex-modes)
      (repeat . t))
     (tex-tabbing-separator
      (regexp lambda
              (end reverse)
              (align-match-tex-pattern "\\\\[=>]" end reverse))
      (group 1 2)
      (modes . align-tex-modes)
      (repeat . t)
      (run-if lambda nil
              (eq major-mode
                  (quote latex-mode))))
     (tex-record-break
      (regexp . "\\(\\s-*\\)\\\\\\\\")
      (modes . align-tex-modes))
     (text-column
      (regexp . "\\(^\\|\\S-\\)\\([ 	]+\\)\\(\\S-\\|$\\)")
      (group . 2)
      (modes . align-text-modes)
      (repeat . t)
      (run-if lambda nil
              (and current-prefix-arg
                   (not
                    (eq
                     (quote -)
                     current-prefix-arg)))))
     (text-dollar-figure
      (regexp . "\\$?\\(\\s-+[0-9]+\\)\\.")
      (modes . align-text-modes)
      (justify . t)
      (run-if lambda nil
              (eq
               (quote -)
               current-prefix-arg)))
     (css-declaration
      (regexp . "^\\s-*\\w+:\\(\\s-*\\).*;")
      (group 1)
      (modes quote
             (css-mode html-mode))))))
 '(auto-insert (quote not-modified))
 '(blink-cursor-mode nil)
 '(calendar-week-start-day 1)
 '(coffee-tab-width 2)
 '(column-number-mode t)
 '(comment-auto-fill-only-comments t)
 '(company-auto-complete-chars (quote (32 41)))
 '(company-dabbrev-downcase nil)
 '(company-dabbrev-ignore-case nil)
 '(company-global-modes
   (quote
    (haskell-mode haskell-cabal-mode git-commit-mode markdown-mode ruby-mode js-mode sql-mode hamlet-mode)))
 '(company-idle-delay 0.1)
 '(company-show-numbers t)
 '(compilation-always-kill t)
 '(css-indent-offset 2)
 '(debug-on-error nil)
 '(desktop-globals-to-save
   (quote
    (desktop-missing-file-warning tags-file-name tags-table-list search-ring regexp-search-ring register-alist file-name-history)))
 '(desktop-save-mode t)
 '(ecb-options-version "2.40")
 '(electric-indent-mode nil)
 '(emacs-lisp-mode-hook
   (quote
    (turn-on-eldoc-mode
     (lambda nil
       (local-set-key
        (kbd "TAB")
        (function
         (lambda nil
           (interactive)
           (if mark-active
               (indent-region
                (region-beginning)
                (region-end))
             (if
                 (looking-at "\\_>")
                 (completion-at-point)
               (indent-for-tab-command))))))))))
 '(etags-select-no-select-for-one-match nil)
 '(even-window-heights nil)
 '(fill-column 80)
 '(fixme-foreground-color "#CC0019")
 '(fixme-highlighted-words (quote ("FIXME" "TODO" "BUG" "KLUDGE")))
 '(fixme-mode t)
 '(flycheck-checkers
   (quote
    (haskell-hdevtools ada-gnat asciidoc c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint d-dmd emacs-lisp emacs-lisp-checkdoc erlang eruby-erubis fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck haml handlebars html-tidy javascript-jshint javascript-eslint javascript-gjslint javascript-jscs javascript-standard json-jsonlint less luacheck lua perl perl-perlcritic php php-phpmd php-phpcs puppet-parser puppet-lint python-flake8 python-pylint python-pycompile r-lintr racket rpm-rpmlint rst rst-sphinx ruby-rubocop ruby-rubylint ruby ruby-jruby rust sass scala scala-scalastyle scss-lint scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim tex-chktex tex-lacheck texinfo verilog-verilator xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby)))
 '(font-lock-global-modes (quote (not speedbar-mode)))
 '(global-company-mode t)
 '(global-flycheck-mode nil)
 '(global-hl-line-mode nil)
 '(global-semantic-idle-scheduler-mode nil)
 '(global-semanticdb-minor-mode nil)
 '(global-visual-line-mode nil)
 '(haskell-ask-also-kill-buffers nil)
 '(haskell-compile-cabal-build-alt-command "stack test %s")
 '(haskell-compile-cabal-build-command "stack build --test --no-run-tests --fast %s")
 '(haskell-compile-command "ghc -Wall -ferror-spans -fforce-recomp -c %s")
 '(haskell-font-lock-symbols nil)
 '(haskell-hoogle-command nil)
 '(haskell-indentation-ifte-offset 2)
 '(haskell-indentation-layout-offset 2)
 '(haskell-indentation-left-offset 2)
 '(haskell-indentation-show-indentations nil)
 '(haskell-indentation-show-indentations-after-eol nil)
 '(haskell-indentation-starter-offset 2)
 '(haskell-mode-hook
   (quote
    (turn-on-haskell-decl-scan turn-on-haskell-indentation s9g-haskell-hook)) t)
 '(haskell-process-args-cabal-repl (quote ("--ghc-option=-ferror-spans" "--no-load")))
 '(haskell-process-args-stack-ghci (quote ("--ghci-options=-ferror-spans")))
 '(haskell-process-log t)
 '(haskell-process-path-cabal "/usr/bin/cabal")
 '(haskell-process-suggest-haskell-docs-imports nil)
 '(haskell-process-suggest-hoogle-imports t)
 '(haskell-process-suggest-remove-import-lines nil)
 '(haskell-process-suggest-restart nil)
 '(haskell-process-type (quote stack-ghci))
 '(haskell-program-name "cabal-dev ghci")
 '(haskell-stylish-on-save nil)
 '(helm-M-x-fuzzy-match nil)
 '(helm-autoresize-max-height 40)
 '(helm-autoresize-mode t)
 '(helm-buffer-max-length 80)
 '(helm-buffers-favorite-modes (quote (haskell-mode haskell-cabal-mode)))
 '(helm-buffers-fuzzy-matching nil)
 '(helm-dash-browser-func (quote eww))
 '(helm-etags-execute-action-at-once-if-one nil)
 '(helm-ls-git-default-sources
   (quote
    (helm-source-ls-git-buffers helm-source-ls-git helm-source-ls-git-status)))
 '(helm-mode t)
 '(hscroll-margin -1)
 '(ido-auto-merge-delay-time 2)
 '(ido-auto-merge-work-directories-length -1)
 '(ido-enable-flex-matching t)
 '(ido-enter-matching-directory (quote first))
 '(ido-file-extensions-order (quote (".lisp" ".asd" ".css" ".yas")))
 '(ido-ignore-files
   (quote
    ("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./" "\\`~/")))
 '(ido-mode nil nil (ido))
 '(indent-tabs-mode nil)
 '(inferior-lisp-program "/usr/bin/sbcl --control-stack-size 20")
 '(js-indent-level 2)
 '(layout-restore-after-killbuffer nil)
 '(layout-restore-after-otherwindow nil)
 '(layout-restore-after-switchbuffer nil)
 '(magit-auto-revert-immediately nil)
 '(magit-auto-revert-mode t)
 '(magit-commit-show-diff nil)
 '(magit-diff-arguments
   (quote
    ("--stat" "--no-ext-diff" "-M7" "--diff-algorithm=patience")))
 '(magit-push-always-verify nil)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(mode-require-final-newline t)
 '(org-agenda-files (quote ("~/org/work.org")))
 '(org-columns-default-format "%40ITEM(Task) %17Effort(Estimated Effort){:} %CLOCKSUM")
 '(org-display-custom-times nil)
 '(org-remember-clock-out-on-exit t)
 '(org-time-stamp-custom-formats (quote ("<%Y-%m-%d>" . "<%Y-%m-%d %H:%M>")))
 '(require-final-newline t)
 '(rng-nxml-auto-validate-flag nil)
 '(rst-level-face-base-color "goldenrod4")
 '(safe-local-variable-values
   (quote
    ((hamlet/basic-offset . 4)
     (haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4)
     (encoding . utf-8)
     (Syntax . ANSI-Common-Lisp))))
 '(scroll-bar-mode nil)
 '(scroll-margin 5)
 '(scroll-preserve-screen-position t)
 '(scroll-step 3)
 '(scroll-up-aggressively nil)
 '(semantic-complete-inline-analyzer-displayor-class (quote semantic-displayor-traditional-with-focus-highlight))
 '(semantic-completion-displayor-format-tag-function (quote semantic-format-tag-prototype))
 '(semantic-decoration-styles
   (quote
    (("semantic-decoration-on-includes" . t)
     ("semantic-decoration-on-protected-members" . t)
     ("semantic-decoration-on-private-members" . t)
     ("semantic-tag-boundary" . t))))
 '(semantic-idle-scheduler-idle-time 100)
 '(semantic-idle-summary-function (quote ignore))
 '(semantic-idle-work-parse-neighboring-files-flag t)
 '(semantic-idle-work-update-headers-flag t)
 '(semantic-mode t)
 '(senator-completion-menu-summary-function (quote semantic-format-tag-prototype))
 '(sh-basic-offset 2)
 '(sh-indentation 2)
 '(show-paren-mode t)
 '(slime-net-coding-system (quote utf-8-unix))
 '(solarized-bold nil)
 '(solarized-italic nil)
 '(solarized-underline nil)
 '(split-width-threshold 100)
 '(sql-indent-offset 2)
 '(standard-indent 2)
 '(tab-width 4)
 '(tags-case-fold-search nil)
 '(tags-revert-without-query t)
 '(tool-bar-mode nil)
 '(undo-limit 500000)
 '(use-file-dialog nil)
 '(vc-annotate-background "cornsilk")
 '(vc-annotate-color-map nil)
 '(warning-minimum-level :error)
 '(woman-fill-column 120)
 '(woman-fill-frame t)
 '(woman-use-own-frame nil)
 '(yas-prompt-functions
   (quote
    (yas-ido-prompt yas-x-prompt yas-dropdown-prompt yas-completing-prompt yas-no-prompt))))
(put 'set-goal-column 'disabled nil)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "gray80" :foreground "gray17" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "paratype" :family "PT Mono"))))
 '(cursor ((t (:background "OrangeRed2"))))
 '(diff-added ((t (:foreground "green4"))))
 '(diff-context ((t (:inherit shadow :foreground "gray32"))))
 '(diff-file-header ((t (:weight bold))))
 '(diff-removed ((t (:foreground "red3"))))
 '(font-lock-comment-face ((t (:foreground "gray53"))))
 '(font-lock-doc-face ((t (:foreground "gray39"))))
 '(font-lock-function-name-face ((t (:foreground "medium blue"))))
 '(font-lock-keyword-face ((t (:foreground "dark red"))))
 '(font-lock-string-face ((t (:foreground "dark green"))))
 '(font-lock-variable-name-face ((t (:foreground "dark magenta"))))
 '(haskell-constructor-face ((t (:foreground "dark slate blue"))))
 '(haskell-indentation-show-hl-line-face ((t nil)))
 '(isearch ((t (:background "magenta3" :foreground "dark slate gray"))))
 '(magit-diff-added ((t (:foreground "#22aa22"))))
 '(magit-diff-added-highlight ((t (:background "gray84" :foreground "#22aa22"))))
 '(magit-diff-context-highlight ((t (:background "gray84" :foreground "grey50"))))
 '(magit-diff-removed ((t (:foreground "#aa2222"))))
 '(magit-diff-removed-highlight ((t (:background "gray84" :foreground "#aa2222"))))
 '(magit-hash ((t (:foreground "firebrick4"))))
 '(magit-item-highlight ((t nil)))
 '(magit-section-highlight ((t (:background "gray84"))))
 '(minibuffer-prompt ((t (:foreground "red"))))
 '(monky-diff-add ((t (:foreground "forest green"))))
 '(region ((t (:background "gray61" :distant-foreground "gtk_selection_fg_color"))))
 '(vc-annotate-face-3F3FFF ((t (:foreground "#3F3FFF"))))
 '(warning ((t (:foreground "medium violet red" :weight bold))))
 '(whitespace-empty ((t nil)))
 '(whitespace-trailing ((t nil))))


(provide 's9g-configs)
