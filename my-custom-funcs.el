(defun indent-whole-buffer () (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

(defun begin-end-defun ()
  (let (begin end)
    (save-excursion
      (beginning-of-defun)
      (setq begin (point))
      (end-of-defun)
      (setq end (point))
      (list
       begin
       end))))

(defun indent-defun () (interactive)
  (save-excursion
    (let ((begin-end (begin-end-defun)))
      (indent-region (car begin-end) (car (cdr begin-end))))))

(defun comment-defun () (interactive)
  (save-excursion
    (let ((begin-end (begin-end-defun)))
      (comment-region (car begin-end) (car (cdr begin-end))))))

(defun kill-defun () (interactive)
  (let ((begin-end (begin-end-defun)))
    (kill-region (car begin-end) (car (cdr begin-end)))))

(defun move-up-defun () (interactive)
  (let ((oldpos (point)))
    (beginning-of-defun)
    (let ((current-fun-diff (- oldpos (point))))
      (goto-char (+ (point) 1))
      (kill-defun)
      (beginning-of-defun)
      (previous-line)
      (end-of-line)
      (open-line 2)
      (next-line)
      (let ((pull-point (point)))
        (yank)
        (goto-char (+ pull-point current-fun-diff))))))



  
