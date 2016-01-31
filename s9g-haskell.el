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
(require 's9g-neotree)
(require 'whitespace)

(add-to-list 'Info-default-directory-list "~/.emacs.d/packages/haskell-mode/")


;; (require 'flycheck)
;; (require 'flycheck-hdevtools)

(defun haskell-helm-do-ag ()
  (interactive)
  (let ((helm-do-ag--extensions (list "*.hs" "*.cabal")))
    (helm-ag-project-root)))

(defun s9g-haskell-set-buffer-name ()
  (let ((modname (haskell-guess-module-name)))
    (unless (string-equal "" modname)
      (rename-buffer modname t))))

(defun s9g-haskell-rgrep (regexp)
  (interactive (list (grep-read-regexp)))
     (if buffer-file-name
         (let* ((cabal-file (haskell-cabal-find-file (file-name-directory buffer-file-name)))
                (proj-dir (file-name-directory cabal-file)))
           (rgrep regexp "*.hs" proj-dir))))

(defun haskell-neotree-open-proj ()
  (interactive)
  (if (neo-global--window-exists-p)
      (neotree-hide)
    (neo-global--open-dir (haskell-cabal-find-dir))))

(defun haskell-process-modules ()
  (let* ((process (haskell-interactive-process))
         (inp "import "))
    (cdr (haskell-process-get-repl-completions process inp))))

(defun haskell-buffers-list ()
  (let ((bufs ()))
    (dolist (buf (buffer-list) bufs)
      (with-current-buffer buf
        (when (string-equal "haskell-mode" major-mode)
          (push buf bufs))))))

;; (defun helm-haskell-buffers ()
;;   (interactive)
;;   (helm :source (helm-build-sync-source
;;                   "Haskell buffers"
;;                   :candidates (haskell-buffers-list))
;;         :buffer "*helm-haskell-buffers*"))

(defun haskell-process-insert-module ()
  (interactive "*")
  (insert (helm :sources (helm-build-sync-source
                          "Haskell modules"
                          :candidates (haskell-process-modules))
                :buffer "*helm-haskell-modules*")))

(defun haskell-move-identifier-name ()
  (interactive)
  (beginning-of-thing 'word)
  (skip-chars-forward "_"))

(defun haskell-upcase-indentifier ()
  (interactive "*")
  (save-excursion
    (haskell-move-identifier-name)
    (upcase-character)))

(defun haskell-downcase-indentifier ()
  (interactive "*")
  (save-excursion
    (haskell-move-identifier-name)
    (downcase-character)))

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
     (kbd "C-c r") #'haskell-process-restart)

    (local-set-key
     (kbd "C-c s") #'haskell-sort-imports)

    (local-set-key
     (kbd "M-p") #'haskell-navigate-imports)

    (local-set-key
     (kbd "C-c g") #'s9g-haskell-rgrep)

    (local-set-key
     (kbd "C-c w") #'haskell-mode-stylish-buffer)

    (local-set-key
     (kbd "C-c n") #'haskell-goto-next-error)

    (local-set-key
     (kbd "C-c p") #'haskell-goto-prev-error)

    (local-set-key
     (kbd "C-c m") #'haskell-process-insert-module)

    (local-set-key
     (kbd "C-c C-u") #'haskell-upcase-indentifier)

    (local-set-key
     (kbd "C-c C-l") #'haskell-downcase-indentifier)

    (local-set-key
     (kbd "C-c h") #'haskell-helm-do-ag)

    (local-set-key
     (kbd "<f12>") #'haskell-neotree-open-proj)

    ;; (local-set-key
    ;;  (kbd "M-n") #'flycheck-next-error)

    (setq tab-width 2)
    (setq whitespace-style '(face empty tabs lines-tail trailing))
    (whitespace-mode 1)

    (auto-insert-mode t)

    ;; (flycheck-mode 1)

    (s9g-haskell-set-buffer-name)

    (require 'haskell-indentation)
    (haskell-indentation-mode 1)
    (helm-dash-activate-docset "haddoc")
    ))


(defun s9g-cabal-hook ()
  (local-set-key (kbd "<f5>") #'s9g-haskell-compile)
  (local-set-key (kbd "<f12>") #'haskell-neotree-open-proj)
  (local-set-key (kbd "C-c s") #'haskell-cabal-subsection-arrange-lines))

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
