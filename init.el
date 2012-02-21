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
(add-to-list 'load-path (concat dotfiles-dir "slime"))
(add-to-list 'load-path (concat dotfiles-dir "magit"))
(add-to-list 'load-path (concat dotfiles-dir "auto-complete"))
(add-to-list 'load-path (concat dotfiles-dir "cedet/common"))
(add-to-list 'load-path (concat dotfiles-dir "cedet/semantic"))
(add-to-list 'load-path (concat dotfiles-dir "yasnippet"))
(add-to-list 'load-path (concat dotfiles-dir "color-theme"))
(add-to-list 'load-path (concat dotfiles-dir "emacs-color-theme-solarized"))
(add-to-list 'load-path (concat dotfiles-dir "haskell-mode"))

(require 'slime)
(slime-setup '(slime-fancy))
(require 'magit)
(require 'auto-complete)
(require 'cedet)
(require 'semantic-ia)
(require 's9g-yasnippet)
(require 'haskell-mode)
(require 'inf-haskell)

(require 's9g-set-global-keys)
(require 's9g-set-hooks)
(require 's9g-defuns)

(setq custom-file (concat dotfiles-dir "s9g-configs.el"))
(require 's9g-configs)

(put 'narrow-to-region 'disabled nil)

(loop
  for from across "йцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖ\ЭЯЧСМИТЬБЮ№"
  for to   across "qwertyuiop[]asdfghjkl;'zxcvbnm,.QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>#"
  do
  (eval `(define-key key-translation-map (kbd ,(concat "C-" (string from))) (kbd ,(concat "C-" (string to)))))
  (eval `(define-key key-translation-map (kbd ,(concat "M-" (string from))) (kbd ,(concat "M-" (string to))))))


;; (require 'color-theme)
;; (load-file (concat dotfiles-dir "color-theme/themes/color-theme-library.el"))
;; (color-theme-xemacs)

;;; init.el ends here
