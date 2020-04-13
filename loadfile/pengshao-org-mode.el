;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; -*- coding: utf-8; lexical-binding: t -*-
;;pengshao-org-mode.el---orgmode相关的配置
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;org-mode语法高亮
(setq org-src-fontify-natively t)


;;保证后缀为'.org'的文件会使用Org mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))



;;如果不想在全局范围使用font-lock,可以用下面一句配置来只在Org-mode下打开font-lock选项
;;(add-hook 'org-mode-hook 'turn-on-font-lock) 

;;设置默认的agenda文件,的todo的全局文件可以添加在这里
(setq org-agenda-files
      (list "~/psnote_public/idear/idear-list.org"
	    ))

;;每次新建todo和做完都要添加时间
;(setq org-log-todo 'time)
;(setq org-log-done 'time)

;;默认的org-notesfile
(setq org-default-notes-file "~/psnote_public/idear/idear-list.org")



;;设置org-mode的启动显示选项,#+STARTUP: overview : content : showall : showeverything :
(setq org-startup-folded 'content)

;; prevent editing an invisible part of the buffer防止编辑缓冲区不可见部分
(setq org-catch-invisible-edits nil) 


;;为org-mode添加自动换行功能
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;;为org-mode的(setq org-startup-indented t)缩进星号
(setq org-startup-indented t)

;; 设置 bullet list
;;(setq org-bullets-bullet-list '("☰" "☷" "☯" "☭"))

;定义多组状态序列，每个“#+SEQ_TODO”行定义一组
(setq org-todo-keywords
 '((sequence "TODO(T!)" "DOING(H!)"  "|" "DONE(D!)" "CANCELED(C@/!)")
   
   ))


;; org-todo-keyword-faces
(setq org-todo-keyword-faces
      '(
	("TODO"      . (:foreground "#FF0033" :background "#FFFF33"  :weight bold))
	("CANCELED"  . (:foreground "yellow" :background "#2E8B57"  :weight bold))
	("DOING"     . (:foreground "#990066" :background "#00FF00"  :weight bold))
	))


;;'org-tag-faces'
(setf org-tag-faces '(
		      ("上班" . (:foreground "black" :background "#95A5A6"   :weight bold))
                      ("休班" . (:foreground "red" :background "#2E8B57"  :weight bold))
                      ;("DONE" . (:foreground "white" :background "#3498DB" :weight bold))
		      )
      )



;; 折叠时不再显示「...」, 换个你喜欢的符号
(setq org-ellipsis "▼")



(provide 'pengshao-org-mode)
