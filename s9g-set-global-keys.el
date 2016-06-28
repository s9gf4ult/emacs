;;; s9g-set-global-keys.el --- set all global keys for comfortable editing of everything

;; Copyright (C) 2011

;; Author:  <razor@calculate.local>
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

(require 's9g-defuns)

;;;;;;;;;;;;;
;; generic ;;
;;;;;;;;;;;;;

(global-set-key
 (kbd "<f7>")
 #'helm-buffers-list)

(global-unset-key (kbd "M-x"))
(global-set-key (kbd "M-x") #'helm-M-x)

(global-unset-key (kbd "C-x C-f"))
(global-set-key (kbd "C-x C-f") #'helm-find-files)

;;;;;;;;;;;;;;
;; Editing  ;;
;;;;;;;;;;;;;;

(global-set-key (kbd "C-S-k") (lambda (&optional lines-count) (interactive "p")
                                (if mark-active
                                    (delete-region (region-beginning)
                                                   (region-end))
                                  (kill-whole-line lines-count))))

(global-unset-key (kbd "C-k"))
(global-set-key
 (kbd "C-k")
 #'(lambda ()
     (interactive)
     (kill-line)))

(global-unset-key (kbd "M-\\"))
(global-set-key
 (kbd "M-\\")
 (lambda ()
   (interactive)
   (delete-horizontal-space)
   (insert " ")
   (save-excursion
     (insert " "))))

(global-unset-key (kbd "C-\\"))
(global-set-key (kbd "C-\\") #'delete-horizontal-space-forward)

(global-unset-key (kbd "C-x C-o"))
(global-set-key (kbd "C-x C-o") #'delete-blank-lines-then-insert)

(global-set-key (kbd "C-o")
                (lambda (&optional arg) (interactive "p")
                  (end-of-line)
                  (let ((lines (or arg
                                   1)))
                    (dotimes (none lines)
                      (newline-and-indent)))))

(global-set-key (kbd "C-S-o")
                (lambda (&optional arg) (interactive "p")
                  (beginning-of-line)
                  (open-line 1)
                  (indent-for-tab-command)
                  (when (and arg
                             (> arg 1))
                    (save-excursion
                      (dotimes (none (- arg 1))
                        (newline-and-indent)))
                    (indent-for-tab-command))))

(global-set-key (kbd "RET")
                #'reindent-then-newline-and-indent)

(global-set-key (kbd "<S-return>")
                #'newline)

(global-set-key (kbd "C-S-c")
                #'(lambda (&optional arg) (interactive "p")
                    (if mark-active
                        (copy-region-as-kill (mark) (point))
                      (save-excursion
                        (beginning-of-line)
                        (push-mark)
                        (when (and arg
                                   (> arg 1))
                          (forward-line (- arg 1)))
                        (end-of-line)
                        (copy-region-as-kill (mark) (point))
                        (pop-mark)))))

(global-set-key (kbd "C-S-y")
                #'(lambda () (interactive)
                    (end-of-line)
                    (newline)
                    (yank)))

(global-set-key (kbd "C-j")
                #'(lambda (&optional arg) (interactive "p")
                    (if mark-active
                        (let ((bl (line-number-at-pos (region-beginning)))
                              (el (line-number-at-pos (region-end))))
                          (when (> el bl)
                            (goto-line bl)
                            (dotimes (none (- el bl))
                              (join-line 1))))
                      (let ((cnt (or arg 1)))
                        (dotimes (none cnt)
                          (join-line 1))))))

(global-set-key (kbd "C-S-j")
                #'(lambda (&optional arg) (interactive "p")
                    (let ((cnt (or arg 1)))
                      (dotimes (none cnt)
                        (join-line)))))

(global-set-key (kbd "M-/")
                #'hippie-expand)

(global-set-key (kbd "C-S-f")
                #'insert-fixme)

(global-set-key (kbd "C-S-n")
                #'insert-note)

(global-set-key (kbd "C-S-d")
                #'delete-trailing-whitespace)

(global-set-key (kbd "C-'")
                #'end-of-non-blank-line)

(global-set-key (kbd "C-c k")
                #'kill-comment-region)

(global-set-key (kbd "M-;")
                #'comment-dwim)

(global-set-key (kbd "C-;")
                #'comment-dwim-line)

(global-set-key (kbd "C-S-m") #'mark-paragraph)

(global-set-key (kbd "C-S-u") #'uniq-sort-lines)

(global-set-key (kbd "C-c b b") #'helm-insert-buffer-name)
(global-set-key (kbd "C-c b n") #'insert-neigbour-buffer-name)

;;;;;;;;;;;;;;;;;
;; Navigating  ;;
;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-x 2")
                #'(lambda () (interactive)
                    (split-window-vertically (round (/ (window-height) 1.618)))
                    ;; (switch-to-buffer-other-window (second (buffer-list)))
                    ))

(global-set-key (kbd "C-x 3") #'split-window-horizontally)

(global-set-key (kbd "M-N") #'next-multiframe-window)
(global-set-key (kbd "M-P") #'previous-multiframe-window)

(global-unset-key (kbd "M-."))
(global-set-key (kbd "M-.") #'helm-etags-select)

(global-set-key (kbd "C-c h") #'s9g-helm-do-ag)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; narrowing and firends ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-c p") #'s9g-narrow-scroll-region)
(global-set-key (kbd "C-c u") #'s9g-unnarrow)

;;;;;;;;;;;;;;;;;;;;;
;; maigit keybinds ;;
;;;;;;;;;;;;;;;;;;;;;


(global-set-key (kbd "C-x g g") #'magit-status)
(global-set-key (kbd "C-x g c") #'magit-checkout)
(global-set-key (kbd "C-x g l") #'magit-log)
(global-set-key (kbd "C-x g u") #'magit-pull)
(global-set-key (kbd "C-x g p") #'magit-push)
(global-set-key (kbd "C-x g f") #'magit-fetch)

;;;;;;;;;;;;;;;;;;;;
;; monky bindings ;;
;;;;;;;;;;;;;;;;;;;;

(global-unset-key (kbd "C-x h"))
(global-set-key (kbd "C-x h h") #'monky-status)

;;;;;;;;;;;;;;;
;; indenting ;;
;;;;;;;;;;;;;;;

(global-set-key (kbd "<C-tab>") #'s9g-indent-up)
(global-set-key (kbd "<C-S-iso-lefttab>") #'s9g-indent-down)
(global-set-key (kbd "M-\"") #'align-current)

(global-unset-key (kbd "C-'"))
(global-set-key (kbd "C-'") #'align)

;;;;;;;;;;;;;;;
;; helm-dash ;;
;;;;;;;;;;;;;;;

(global-set-key (kbd "C-c d") #'helm-dash-at-point)

;;;;;;;;;;;;
;; stupid ;;
;;;;;;;;;;;;

(global-set-key (kbd "C-c n") #'normal-mode)

(provide 's9g-set-global-keys)
;;; s9g-set-global-keys.el ends here
