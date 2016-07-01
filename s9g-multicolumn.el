;;; s9g-multicolumn.el ---                           -*- lexical-binding: t; -*-

;; Copyright (C) 2016

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

(require 'multicolumn)

(global-set-key (kbd "C-M-<") 'multicolumn-select-first-window)
(global-set-key (kbd "C-M->") 'multicolumn-select-last-window)

    ;; The `C-x 4' prefix is used for window-related functions.
(global-set-key (kbd "C-x 4 m")  'multicolumn-delete-other-windows-and-split)
(global-set-key (kbd "C-x 4 >") 'multicolumn-extend-right)
(global-set-key (kbd "C-x 4 <") 'multicolumn-extend-left)

(global-set-key (kbd "C-x 4 t") 'multicolumn-transpose-windows)

(global-set-key (kbd "C-x 4 p") 'multicolumn-select-previous-window)
(global-set-key (kbd "C-x 4 n") 'other-window)

(global-set-key (kbd "C-x 4 u") 'multicolumn-pop-window-configuration)

(global-set-key (kbd "C-x 4 :") 'multicolumn-select-minibuffer)

(let ((count 1))
  (while (< count 10)
	;; Note: In newer Emacs versins, `kbd' and `read-kbd-macro'
	;; are the same. In older versions, however, `kbd' doesn't
	;; evaluate its argument.
    (global-set-key (read-kbd-macro (format "C-x 4 %d" count))
      'multicolumn-select-window-number)
    (setq count (+ count 1))))

(provide 's9g-multicolumn)
;;; s9g-multicolumn.el ends here
