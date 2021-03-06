;;; s9g-helm.el ---                                  -*- lexical-binding: t; -*-

;; Copyright (C) 2015

;; Author:  <razor@gazoline>
;; Keywords: convenience

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

(require 'helm)
(require 'helm-buffers)
(require 'helm-ls-git)
(require 'helm-ag)

;; Conveinience
(define-key helm-map (kbd "<C-return>")
  #'helm-buffer-switch-other-window)

(define-key helm-etags-map (kbd "<C-return>")
  #'helm-etags-run-switch-other-window)

(define-key helm-ls-git-map (kbd "<C-return>")
  #'helm-ff-run-switch-other-window)

(define-key helm-find-files-map (kbd "<C-return>")
  #'helm-ff-run-switch-other-window)

(global-set-key
 (kbd "<f8>")
 #'helm-ls-git-ls)

(provide 's9g-helm)
;;; s9g-helm.el ends here
