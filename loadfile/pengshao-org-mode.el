;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; -*- coding: utf-8; lexical-binding: t -*-
;;pengshao-org-mode.el---orgmode相关的配置
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;我的编码设置
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)


;;org-mode语法高亮
(setq org-src-fontify-natively t)


;;保证后缀为'.org'的文件会使用Org mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))


;;(global-set-key "\C-cl" 'org-store-link)
;;orgmode的链接


;;设置默认的agenda文件,的todo的全局文件可以添加在这里
;;(global-set-key "\C-ca" 'org-agenda)
(setq org-agenda-files
      (list "~/public_note/idear/list-list.org"
	))


;;(global-set-key "\C-cc" 'org-capture)
;;这个设置在init.el文件中.
;;默认的org-notesfile,这里就是org-capture的默认文件
(setq org-default-notes-file "~/public_note/idear/todo-list.org")
(setq org-capture-templates
      '(("t" "Todo item" entry
	 (file+headline "~/public_note/idear/todo-list.org" "Tasks")
	 "* TODO %?\n  SCHEDULED: %T\n  %i\n %a\n Created: %U")

	("w" "Web link" entry
	 (file+headline "~/public_note/share/mybookmarks.org" "bookmarks-temp")
	 "* %?  :WEB:\n [[https://%^{URL}][%^{Description}]]\n:PROPERTIES:\n:Description: %^{Description}\n:END:")

	("a" "Article excerpt" entry
	 (file "~/personal_note/article-excerpt.org") ; 直接插入文件根层级
	 "* %^{输入标题} :ARTICLE:\n:PROPERTIES:\n:描述: %^{描述}\n:来源: %^{来源}\n:插入时间: %U\n:END:"
	 :empty-lines 1)
	
	("s" "Personal statement" entry
	 (file+headline "~/personal_note/personal-statement.org" "think-temp")
	 "* %? :STATEMENT:\n:PROPERTIES:\n:Thought: %^{Thought}\n:END:"))
      )

;;每次新建todo和做完都要添加时间
;(setq org-log-todo 'time)
;(setq org-log-done 'time)


;;如果不想在全局范围使用font-lock,可以用下面一句配置来只在Org-mode下打开font-lock选项
;;(add-hook 'org-mode-hook 'turn-on-font-lock) 



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
(setf org-tag-faces
      '(
	("上班" . (:foreground "black" :background "#95A5A6"   :weight bold))
        ("休班" . (:foreground "red" :background "#2E8B57"  :weight bold))
        ("加班" . (:foreground "white" :background "#3498DB" :weight bold))
	))



;; 折叠时不再显示「...」, 换个你喜欢的符号
(setq org-ellipsis "▼")



(provide 'pengshao-org-mode)
