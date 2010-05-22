;;;;;;;;;;;;;;;;;;;;;
;; my-custom-funcs ;;
;;;;;;;;;;;;;;;;;;;;;

(defun kill-all-buffers-by-regexp (regexp &optional buffers-to-kill)
  "Kills all buffers whitch names matches by `regexp'.
If `buffers-to-kill' is not nil then kills just buffers from this list.
If `buffers-to-kill' is nil or t then kills buffers from `(buffer-list)'"
  (interactive "MRegexp: ")
  (let ((process-buffers (if (and buffers-to-kill
                                  (not (eql t buffers-to-kill)))
                            buffers-to-kill
                          (buffer-list))))
    (dolist (cbuffer (loop for var in process-buffers when (string-match regexp (buffer-name var)) collect var))
      (kill-buffer cbuffer))))

(defun mark-line (arg)
  "marks current line (at point) or more that one of `arg' is set to >0"
  (interactive)
  (save-excursion
    (beginning-of-line)
    (set-mark-command 1)
    (when (> arg 0)
      (next-line arg nil))
    (end-of-line)
    (set-mark-command 0)))
      

(provide 'my-custom-functions)
  
