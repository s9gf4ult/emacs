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

(defmacro save-lined-selection (&rest body)
  (let ((start (gensym))
        (end (gensym))
        (beg-line (gensym))
        (end-line (gensym)))
    `(if (region-active-p)
         (let* ((,start (region-beginning))
                (,end (region-end))
                (,beg-line (line-number-at-pos ,start))
                (,end-line (line-number-at-pos ,end)))
           (prog1
               (progn ,@body)
             (goto-char ,start)
             (move-beginning-of-line nil)
             (set-mark-command nil)
             (forward-line (- ,end-line ,beg-line))
             (move-end-of-line nil)
             (setq deactivate-mark nil)))
       (progn
         ,@body))))

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

(defun uniq-lines (beg end)
  "Unique lines in region.
Called from a program, there are two arguments:
BEG and END (region to sort)."
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (while (not (eobp))
        (kill-line 1)
        (yank)
        (let ((next-line (point)))
          (while
              (re-search-forward
               (format "^%s" (regexp-quote (car kill-ring))) nil t)
            (replace-match "" nil nil))
          (goto-char next-line))))))

(defun uniq-sort-lines (beg end)
  (interactive "r")
  (save-excursion
    (sort-lines () beg end)
    (uniq-lines beg end)))

(defun touch ()
     "updates mtime on the file for the current buffer"
     (interactive)
     (shell-command (concat "touch " (shell-quote-argument (buffer-file-name))))
     (clear-visited-file-modtime))

(defun indent-by (ind &optional beg end)
  (interactive)
  (when (or (and beg end) (region-active-p))
    (let* ((deactivate-mark)
           (beg (or beg (region-beginning)))
           (end (or end (region-end)))
           (mark-after (region-active-p))
           (bline (line-number-at-pos beg))
           (eline (line-number-at-pos end)))
      (flet ((getlinepos (line)
                         (save-excursion
                           (goto-line line)
                           (beginning-of-line)
                           (point))))
        (indent-rigidly (getlinepos bline)
                        (getlinepos eline) ind)
        (when mark-after
          (push-mark (getlinepos bline))
          (goto-char (getlinepos eline))
          (activate-mark))))))

(defun s9g-indent-up ()
  (interactive)
  (indent-by 1))

(defun s9g-indent-down ()
  (interactive)
  (indent-by -1))

(defun replace-word (tosearch toreplace)
  (interactive "sSearch for word: \nsReplace with: ")
  (save-excursion
    (goto-char (point-min))
    (let ((case-fold-search nil)
          (count 0))
      (while (re-search-forward (concat "\\b" tosearch "\\b") nil t)
        (setq count (1+ count))
        (replace-match toreplace 'fixedcase 'literal))
      (message "Replaced %s match(es)" count))))

(defun kill-comment-region ()
  (interactive)
  (if (region-active-p)
      (save-excursion
        (let* ((beg (line-number-at-pos (region-beginning)))
               (end (line-number-at-pos (region-end)))
               (dif (- end beg)))
          (goto-char (region-beginning))
          (comment-kill dif)))
    (comment-kill 1)))

(defun delete-blank-lines-then-insert (lines-count)
  (interactive "p")
  (delete-blank-lines)
  (save-excursion
    (beginning-of-line)
    (unless (looking-at "[ \t]*$")
     ; insert one blank line if fukin delete-blank-lines removed all
     ; of them, stupid lispers, I hate you!
        (newline))
    ; One line we have already, now insert the rest if required
    (let ((c (- lines-count 1)))
      (if (> c 0)
          (newline c)))))

(defun insert-neigbour-buffer-name ()
  (interactive)
  (let ((w (second (window-list))))
    (when w
      (insert
       (buffer-name (window-buffer w))))))

(defun ido-insert-buffer-name ()
  (interactive)
  (let ((buf (ido-read-buffer "Buffer: ")))
    (insert buf)))

(defun dired-ido-find-file-in-current-directory ()
  (interactive)
  (let ((default-directory (dired-current-directory)))
    (ido-find-file)))

;;;;;;;;;;;;;;;;;;;;;
;; Haskell helpers ;;
;;;;;;;;;;;;;;;;;;;;;

(defun s9g-haskell-compile ()
  (interactive)
  (save-some-buffers t)
  (haskell-compile))

(defun s9g-haskell-yesod-handler-name ()
  (interactive)
  (let* ((p1 (line-beginning-position))
         (p2 (line-end-position))
         (lval (buffer-substring-no-properties p1 p2))
         (w (cdr (split-string lval)))  ; split to words and drop routes
         (rname (car w))
         (methods (cdr w)))
    (if (> (length methods) 0)
        (progn
          (kill-whole-line)
          (previous-line)
          (loop for m in methods do
                (let* ((name (concat (downcase m) rname))
                       (l1 (concat name " :: Handler TypedContent"))
                       (l2 (concat name " = error \"" name " not implemented\"")))
                  (end-of-line)
                  (newline)
                  (insert l1) (newline)
                  (insert l2) (newline)))))))

(defun s9g-haskell-yesod-align-routes (begin end)
  (interactive
   (list (region-beginning) (region-end)))
  (let ((pref "\\(\\s-*\\)"))
    (align-regexp begin end (concat pref "\\ ") 1 align-default-spacing nil)
    (align-regexp begin end (concat pref "\\ \\(GET\\|POST\\)") 1 align-default-spacing nil)))

;; kill buffers which file does not exists
(defun s9g-kill-orphan-buffers ()
  (interactive)
  (loop for buf in (buffer-list) do
        (let ((bfn (buffer-file-name buf)))
          (if (and bfn
                   (not (file-exists-p bfn)))
              (kill-buffer buf)))))

(defun aak/auto-mode-anywhere ()
  (interactive)
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      (when (buffer-file-name)
         (set-auto-mode)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; narrowing and friends ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun s9g-hscroll-to-point (&optional point)
  (interactive)
  (let* ((hscroll-margin -1)
         (cc (or point
                 (current-column)))
         (wc (window-hscroll))
         (s (if (> cc wc)
                (- cc wc)
              (- cc wc))))
    (scroll-left s)))

(defun s9g-narrow-scroll-region (&optional b e)
  (interactive)
  (let* ((beg (or b
                  (region-beginning)))
         (end (or e
                  (region-end)))
         (scrolpos
          (save-excursion
            (let (leftmost)
              (goto-char beg)
              (while (< (point) end)
                (back-to-indentation)
                (let ((p (current-column)))
                  (setq leftmost
                        (min (or leftmost p)
                             p)))
                (forward-line))
              leftmost))))
    (deactivate-mark)
    (narrow-to-region beg end)
    (s9g-hscroll-to-point scrolpos)
    (beginning-of-buffer)
    (back-to-indentation)))

(defun s9g-unnarrow ()
  (interactive)
  (save-excursion
    (widen)
    (scroll-left (- (window-hscroll)))))


(provide 's9g-defuns)
