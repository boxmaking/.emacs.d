(defun my-insert-time ()
  (interactive)
  (insert (format-time-string "<%Y-%m-%d/%A %H:%M:%S>" (current-time))))

(global-set-key (kbd "C-c m t") 'my-insert-time)



(defun my-insert-date ()
  (interactive)
  (insert (format-time-string "<%Y-%m-%d-%j/%A>" (current-time))))

(global-set-key (kbd "C-c m d") 'my-insert-date)



(defun my-insert-month ()
  (interactive)
  (insert (format-time-string "<%Y-%B>" (current-time))))

(global-set-key (kbd "C-c m m") 'my-insert-month)


(provide 'pengshao-insert-date)
