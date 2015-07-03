;;; s9g-ruby.el --- ruby hooks

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

;;; Code:
(defun my-ruby-mode-hook()
  (local-set-key (kbd "<return>") #'reindent-then-newline-and-indent)
  ;; (auto-complete-mode 1))
  )

(add-hook 'ruby-mode-hook #'my-ruby-mode-hook)

(add-to-list 'auto-mode-alist '("\\.builder\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("^Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))


(provide 's9g-ruby)
;;; s9g-ruby.el ends here
