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

; (require 's9g-cedet)



(require 'cl)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load all directories from ~/.emacs.d/packages/ ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(loop
 for file in (directory-files-and-attributes (concat dotfiles-dir "packages") t)
 if (and (second file)
         (let ((fn (file-name-base (first file))))
           (and
            (not (string-equal "." fn))
            (not (string-equal ".." fn)))))
 do (let ((fname (first file)))
      (add-to-list 'load-path fname)))


(loop
 for file in (directory-files-and-attributes (concat dotfiles-dir "themes") t)
 if (and (second file)
         (let ((fn (file-name-base (first file))))
           (and
            (not (string-equal "." fn))
            (not (string-equal ".." fn)))))
 do (let ((fname (first file)))
      (add-to-list 'custom-theme-load-path fname)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; change default confgis location ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 's9g-defuns)
(require 's9g-configure-modes)
(require 's9g-set-global-keys)
(require 's9g-modalist)

;; (load-theme 'solarized-light t)

(require 's9g-configs)
(setq custom-file (concat dotfiles-dir "s9g-configs.el"))

(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(loop
  for from across "йцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖ\ЭЯЧСМИТЬБЮ№"
  for to   across "qwertyuiop[]asdfghjkl;'zxcvbnm,.QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>#"
  do
  (eval `(define-key key-translation-map (kbd ,(concat "C-" (string from))) (kbd ,(concat "C-" (string to)))))
  (eval `(define-key key-translation-map (kbd ,(concat "M-" (string from))) (kbd ,(concat "M-" (string to)))))
  (eval `(define-key key-translation-map (kbd ,(concat "C-M-" (string from))) (kbd ,(concat "C-M-" (string to))))))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(put 'scroll-left 'disabled nil)

;; (require 'color-theme)
;; (color-theme-initialize)
;; (color-theme-xemacs)

;;; init.el ends here
