(defun indent-whole-buffer () (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

(defun indent-defun () (interactive)
  (save-excursion
    (let (begin end)
      (beginning-of-defun)
      (setq begin (point))
      (end-of-defun)
      (setq end (point))
      (indent-region begin end nil))))

      