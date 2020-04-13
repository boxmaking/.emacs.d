;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; -*- coding: utf-8; lexical-binding: t -*-
;;pengshao-einsrt-date.el---插入时间格式相关的配置
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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


;;插入今年的时间进度条
(defun make-progress (width percent has-number?)
  (let* ((done (/ percent 100.0))
         (done-width (floor (* width done))))
    (concat
     "["
     (make-string done-width ?/)
     (make-string (- width done-width) ? )
     "]"
     (if has-number? (concat " " (number-to-string percent) "%"))
     )))

(defun insert-day-progress ()
  (interactive)
  (let* ((today (time-to-day-in-year (current-time)))
         (percent (floor (* 100 (/ today 365.0)))))
    (insert (make-progress 30 percent t))
    ))

(global-set-key (kbd "C-c m y") 'insert-day-progress)

(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))



(provide 'pengshao-insert-date)
