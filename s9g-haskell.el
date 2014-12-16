;;; s9g-haskell.el ---

;; Copyright (C) 2012

;; Author:  <razor@localhost>
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

;;; Code:sh

(require 'haskell-mode-autoloads)

(add-to-list 'Info-default-directory-list "~/.emacs.d/packages/haskell-mode/")

(defun s9g-haskell-set-buffer-name ()
  (let ((modname (haskell-guess-module-name)))
    (unless (string-equal "" modname)
      (rename-buffer modname t))))


(defun s9g-haskell-hook ()
  (when (buffer-file-name)              ; fix
    ;; (local-set-key (kbd "<return>") #'newline-and-indent)
    (local-set-key
     (kbd "<f5>") #'s9g-haskell-compile)

    (local-set-key
     (kbd "<f9>")
     #'(lambda ()
         (interactive)
         (haskell-cabal-visit-file t)))

    (local-set-key
     (kbd "C-c c") #'haskell-interactive-switch)

    (local-set-key
     (kbd "C-c l") #'haskell-process-load-or-reload)

    (local-set-key
     (kbd "C-c t") #'haskell-process-do-type)

    (local-set-key
     (kbd "C-c i") #'haskell-process-do-info)

    (local-set-key
     (kbd "C-c s") #'haskell-sort-imports)

    (local-set-key
     (kbd "M-p") #'haskell-navigate-imports)

    (setq tab-width 4
          haskell-indentation-layout-offset 4
          haskell-indentation-left-offset 4
          haskell-indentation-ifte-offset 4)
    (auto-complete-mode t)

    (s9g-haskell-set-buffer-name)

    (ghc-init)))


(defun s9g-cabal-hook ()
  (local-set-key (kbd "<f5>") #'s9g-haskell-compile))

(add-hook 'haskell-cabal-mode-hook #'s9g-cabal-hook)
(add-hook 'haskell-mode-hook #'s9g-haskell-hook)

;; (add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))
;; (add-to-list 'auto-mode-alist '("\\.hsc\\'" . haskell-mode))
;; (add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))

(eval-after-load 'autoinsert
  '(define-auto-insert
    '(haskell-mode . "Haskell mode")
    '("Description:"
      "module " (haskell-guess-module-name) " where" "\n\n")))


(provide 's9g-haskell)
;;; s9g-haskell.el ends here
