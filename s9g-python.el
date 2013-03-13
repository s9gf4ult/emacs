;;; s9g-python.el --- python mode hooks

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

(require 's9g-defuns)
(require 'python-mode)
(require 'cedet)

(add-hook 'python-mode-hook
          #'(lambda ()
              (local-set-key (kbd "<tab>") #'smart-python-tab)
              (local-set-key (kbd "<return>") #'newline-and-indent)
              (yas/minor-mode)
              (auto-complete-mode)
              (auto-fill-mode t)
              (set (make-local-variable 'comment-auto-fill-only-comments) t)
              (local-set-key (kbd "M-I") #'semantic-ia-show-summary)
              (local-set-key (kbd "M-D") #'semantic-ia-show-doc)))

(provide 's9g-python)
;;; s9g-python.el ends here
