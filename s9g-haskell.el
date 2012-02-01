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

;;; Code:

(require 'haskell-mode)

(defun haskell-hook ()
  (local-set-key (kbd "<return>") #'newline-and-indent)
  (local-set-key (kbd "<f5>") #'inferior-haskell-load-file)
  (auto-complete-mode t))

(add-hook 'haskell-mode-hook #'haskell-hook)
(setq auto-mode-alist (cons '("\\.hs" . haskell-mode) auto-mode-alist))

(provide 's9g-haskell)
;;; s9g-haskell.el ends here
