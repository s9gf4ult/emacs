;;; s9g-rest.el --- 

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

(require 'rst)

(add-hook
 'rst-mode-hook
 #'(lambda ()
     (local-set-key (kbd "<return>") #'newline-and-indent)))
                             
               



(provide 's9g-rest)
;;; s9g-rest.el ends here
