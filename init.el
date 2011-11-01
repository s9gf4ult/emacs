;;; init.el --- configuration init file

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

(setq dotfiles-dir (file-name-directory
		    (or (buffer-file-name)
			load-file-name)))

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "el-get/"))


(require 'el-get)
(require 'auto-complete)

(require 's9g-configs)

;;; init.el ends here
