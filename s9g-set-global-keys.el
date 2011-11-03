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

(global-set-key (kbd "C-S-k") (lambda (&optional lines-count) (interactive)
                                (if mark-active
                                    (delete-region (region-beginning)
                                                   (region-end))
                                  (kill-whole-line lines-count))))
)(global-set-key (kbd "C-o")
                (lambda () (interactive)
                  (end-of-line)
                  (newline-and-indent)))
 
(global-set-key (kbd "C-S-o")
                (lambda () (interactive)
                  (beginning-of-line)
                  (open-line 1)
                  (indent-for-tab-command)))

(provide 's9g-set-global-keys)
;;; s9g-set-global-keys.el ends here
