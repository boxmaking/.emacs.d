;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; -*- coding: utf-8; lexical-binding: t -*-
;;pengshao-openweather.el---自动插入天气的教程
;;<2025-02-08/Saturday 19:32:10>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;添加济南天气的操作
(defun insert-weather ()
  (interactive)
  (insert (shell-command-to-string "curl wttr.in/jinan?format=4 2> /dev/null")))


(global-set-key (kbd "C-c m w") #'insert-weather)


;;添加月相的操作
(defun insert-pyphoon ()
  (interactive)
  (insert (shell-command-to-string "source ~/mypython/bin/activate && pyphoon")))


(global-set-key (kbd "C-c m o") #'insert-pyphoon)


(defun insert-nongli ()
  (interactive)
  (insert (shell-command-to-string "~/.emacs.d/loadfile/nongli.sh")))

(global-set-key (kbd "C-c m n") #'insert-nongli)

(defun insert-nonglijian ()
  (interactive)
  (insert (shell-command-to-string "~/.emacs.d/loadfile/nonglijian.sh")))

(global-set-key (kbd "C-c m j") #'insert-nonglijian)



(provide 'pengshao-openweather)

