;;; s9g-nxml.el ---                                  -*- lexical-binding: t; -*-

;; Copyright (C) 2015

;; Author:  <razor@gazoline>
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


(require 'hideshow)
(require 'sgml-mode)
(require 'nxml-mode)

(add-to-list 'hs-special-modes-alist
             '(nxml-mode
               "<!--\\|<[^/>]*[^/]>"
               "-->\\|</[^/>]*[^/]>"

               "<!--"
               sgml-skip-tag-forward
               nil))

(defun nxml-narrow-hscroll-tag ()
  (interactive)
  (save-excursion
    (nxml-backward-up-element)
    (beginning-of-line)
    (push-mark)
    (back-to-indentation)
    (nxml-forward-element)
    (end-of-line)
    (s9g-narrow-scroll-region)))



(add-hook 'nxml-mode-hook 'hs-minor-mode)
(add-hook
 'nxml-mode-hook
 #'(lambda ()
     (interactive)
     (local-set-key (kbd "C-c t") #'nxml-narrow-hscroll-tag)))



;; optional key bindings, easier than hs defaults
(define-key nxml-mode-map (kbd "<tab>") 'hs-toggle-hiding)
(define-key nxml-mode-map (kbd "C-c s") 'hs-show-all)
(define-key nxml-mode-map (kbd "C-c l") 'hs-hide-level)

(provide 's9g-nxml)
;;; s9g-nxml.el ends here
