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

(global-set-key (kbd "C-S-k") (lambda (&optional lines-count) (interactive "p")
                                (if mark-active
                                    (delete-region (region-beginning)
                                                   (region-end))
                                  (kill-whole-line lines-count))))
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
                #'newline-and-indent)

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
                  

(provide 's9g-set-global-keys)
;;; s9g-set-global-keys.el ends here