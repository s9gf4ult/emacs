;;; s9g-elisp.el --- 

;; Copyright (C) 2011  

;; Author:  <s9gf4ult@gmail.com>
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


(add-hook 'emacs-lisp-mode-hook
	  #'(lambda ()
	      
	      (local-set-key (kbd "TAB")
			     #'(lambda () (interactive)
				 (if mark-active
				     (indent-region
				      (region-beginning)
				      (region-end))
				   (if (looking-at "\\_>")
				       (completion-at-point)
				     (indent-for-tab-command)))))
	      ))
		     



(provide 's9g-elisp)
;;; s9g-elisp.el ends here
