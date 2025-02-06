;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; -*- coding: utf-8; lexical-binding: t -*-
;;pengshao-converttime相关的配置
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun convert-time ()
  "将输入的不同时间单位转换为各种时间单位。"
  (interactive)

  (let* ((input (read-string "请输入时间（例如 100s, 100m, 100h, 100d, 100M, 100y）: "))
         (value1 (string-to-number (substring input 0 (1- (length input))))
         (unit (string (elt input (1- (length input)))))
         (seconds 0))
 
    (cond
     ((eq unit?s)
      (setq seconds value1))
     ((eq unit?m)
      (setq seconds (* value1 60)))
     ((eq unit?h)
      (setq seconds (* value1 3600)))
     ((eq unit?d)
      (setq seconds (* value1 86400)))
     ((eq unit?M)
      (setq seconds (* value1 30 86400)))
     ((eq unit?y)
      (setq seconds (* value1 365 86400)))
     (t
      (message "输入不合法，请使用正确的单位（s, m, h, d, M, y）")
      (return-from convert-time)))

    (message "%.2f 秒" seconds)
    (message "%.2f 分钟" (/ seconds 60))
    (message "%.2f 小时" (/ seconds 3600))
    (message "%.2f 天" (/ seconds 86400))
    (message "%.2f 月" (/ seconds (* 30 86400)))
    (message "%.2f 年" (/ seconds (* 365 86400))))))






  (provide 'pengshao-converttime)
