;;; s9g-configs.el --- customize master configurations

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


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ac-modes (quote (emacs-lisp-mode lisp-interaction-mode c-mode cc-mode c++-mode java-mode clojure-mode scala-mode scheme-mode ocaml-mode tuareg-mode perl-mode cperl-mode python-mode ruby-mode ecmascript-mode javascript-mode js-mode js2-mode php-mode css-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode python-mode)))
 '(auto-insert t t)
 '(ecb-options-version "2.40")
; '(global-semantic-tag-folding-mode nil nil (semantic-util-modes))
 '(indent-tabs-mode nil)
 ;;'(inferior-lisp-program "/usr/bin/sbcl --noinform --dynamic-space-size 600")
 '(org-agenda-files (quote ("~/org/work.org")))
 '(org-remember-clock-out-on-exit t)
 ;;'(quack-default-program "csi")
 ;;'(quack-fontify-style nil)
 '(safe-local-variable-values (quote ((Syntax . ANSI-Common-Lisp))))
 ;;'(scheme-program-name "sci")
 '(scroll-preserve-screen-position t)
 ;;'(semantic-c-dependency-system-include-path (quote ("/usr/include" "/usr/include/gtk-2.0" "/usr/include/gtk-2.0/gtk" "/usr/include/gtk-2.0/gdk" "/usr/include/atk-1.0" "/usr/include/cairo" "/usr/include/qt4" "/usr/include/libdrm" "/usr/include/glib-2.0" "/usr/lib/glib-2.0/include" "/usr/include/libpng14")))
 ;;'(semantic-idle-scheduler-idle-time 25)
 ;;'(slime-auto-connect (quote ask))
 ;;'(tab-always-indent t)
 '(tab-width 4)
 ;;'(template-default-directories (quote ("/usr/share/emacs/site-lisp/template/templates" "~/.emacs.d/templates")) t)
 '(undo-limit 500000)
 '(use-file-dialog nil)
 '(woman-fill-column (- (window-width) 5))
 '(woman-use-own-frame nil))



;;(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 ;;'(magit-diff-add ((t (:background "gray8" :foreground "green3"))))
 ;;'(magit-diff-del ((t (:background "gray8" :foreground "red3"))))
 ;;'(magit-diff-file-header ((t (:inherit magit-header :background "gray8"))))
 ;;'(magit-diff-hunk-header ((t (:inherit magit-header :background "gray8" :foreground "orange" :slant italic))))
 ;;'(magit-item-highlight ((((class color) (background dark)) (:background "gray15")))))
(put 'set-goal-column 'disabled nil)


(provide 's9g-configs)
;;; s9g-configs.el ends here
