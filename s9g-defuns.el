;;; s9g-defuns.el --- function definitions

;; Copyright (C) 2011

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

;;; Code:


(defun smart-tab ()
  "This smart tab is minibuffer compliant: it acts as usual in
    the minibuffer. Else, if mark is active, indents region. Else if
    point is at the end of a symbol, expands it. Else indents the
    current line."
  (interactive)
  (unless (minibufferp)
    (if mark-active
        (indent-region (region-beginning)
                       (region-end))
      (if (looking-at "\\_>")
          (hippie-expand nil)
        (indent-for-tab-command)))))

(defun smart-python-tab () (interactive)
  (if mark-active
      (indent-region (region-beginning)
                     (region-end))
    (if (looking-at "\\_>")
        (auto-complete)
      (indent-for-tab-command))))

(defun add-subdir-to-load-path (subdir)
  (add-to-list 'load-path (concat dotfiles-dir
				  subdir)))

(defun kill-all-buffers-by-regexp (regexp &optional buffers-to-kill)
  "Kills all buffers whitch names matches by `regexp'.
If `buffers-to-kill' is not nil then kills just buffers from this list.
If `buffers-to-kill' is nil or t then kills buffers from `(buffer-list)'"
  (interactive "MRegexp: ")
  (let ((process-buffers (if (and buffers-to-kill
                                  (not (eql t buffers-to-kill)))
                            buffers-to-kill
                          (buffer-list))))
    (loop for var in process-buffers
          when (string-match regexp (buffer-name var))
          do (kill-buffer var))))

(defmacro def-insert-something(name field)
  `(defun ,name() (interactive)
     (comment-dwim nil)
     (if  (looking-at ,(format "%s: " field))
         (progn
           (delete-trailing-whitespace)
           (end-of-line)
           (insert " "))
       (progn
         (insert ,(format " %s: " field))
         (delete-trailing-whitespace)
         (end-of-line)
         (insert " ")))))

(def-insert-something insert-fixme "FIXME")
(def-insert-something insert-note "NOTE")

(defun end-of-non-blank-line() (interactive)
  (delete-trailing-whitespace)
  (end-of-line))


(defun comment-dwim-line (&optional arg)
        "Replacement for the comment-dwim command.
        If no region is selected and current line is not blank and we are not at the end of the line,
        then comment current line.
        Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
          (interactive "*P")
          (comment-normalize-vars)
          (if (not (region-active-p))
              (comment-or-uncomment-region (line-beginning-position) (line-end-position))
            (comment-dwim arg)))

(provide 's9g-defuns)

