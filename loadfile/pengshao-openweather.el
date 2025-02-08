;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; -*- coding: utf-8; lexical-binding: t -*-
;;pengshao-openweather.el---自动插入天气的教程
;;<2025-02-08/Saturday 19:32:10>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun insert-weather ()
  (interactive)
  (insert (shell-command-to-string "curl wttr.in/jinan?format=4 2> /dev/null")))


(global-set-key (kbd "C-c m o") #'insert-weather)



(provide 'pengshao-openweather)

