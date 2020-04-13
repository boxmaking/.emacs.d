;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; -*- coding: utf-8; lexical-binding: t -*-
;;pengshao-copy-cut-paste-killring.el---复制粘帖相关配置
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;不向kill-ring中加入重复内容
(setq kill-do-not-save-duplicates t)

;支持中键粘贴
(setq mouse-yank-at-point t)

;;增大kill-ring-max
(setq kill-ring-max 200)


;;; 关于没有选中区域,则默认为选中整行的advice
;;;;默认情况下M-w复制一个区域，但是如果没有区域被选中，则复制当前行
(defadvice kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (message "welldone,copy this line")
     (list (line-beginning-position)
           (line-beginning-position 2)))))




(provide 'pengshao-copy-cut-paste-killring)
